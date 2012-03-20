//
//  BigBigDataStore.m
//  Ari9
//
//  Created by 오 화종 on 12. 02. 23.
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "BigBigDataStore.h"

@implementation BigBigDataStore


static BigBigDataStore *singletonInstance = nil;

+ (BigBigDataStore *) sharedInstance
{
	@synchronized([BigBigDataStore class])
	{
		if (!singletonInstance)
			[[self alloc] init];
		return singletonInstance;
	}
	return nil; // to avoid compiler warning
}

+(id)alloc
{
	@synchronized([BigBigDataStore class])
	{
		NSAssert(singletonInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		singletonInstance = [super alloc];
		return singletonInstance;
	}
	// to avoid compiler warning
	return nil;
}

+(void) destroySharedInstance
{
	[singletonInstance release];
	singletonInstance = nil;
}

-(NSNumber*) versionInfo
{
	return [NSNumber numberWithInt:20100313];
}

-(void) getGameDataJsonFromServer
{
	NSData *versionInfo = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://localhost:1337/getUpdateVersion"]];
	NSString *versionString = [[NSString alloc] initWithData:versionInfo encoding:NSUTF8StringEncoding];
	if([[self versionInfo] intValue] < [versionString intValue]){
		NSData *jsonChunk = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://localhost:1337/getGameData"]];
		NSError *error = nil;
		NSArray *jsonGameData = [NSJSONSerialization JSONObjectWithData:jsonChunk options:0 error:&error];
		NSArray *paths = NSSearchPathForDirectoriesInDomains
		(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
		NSLog(@"jsonGameData %@", jsonGameData);
		NSLog(@"documentsDirectory %@", documentsDirectory);
		//TODO: Documents 디렉토리가 iTunes로 접근 가능하여 보안 취약. 다른 경로에 저장하자.
		[jsonChunk writeToFile:[documentsDirectory stringByAppendingPathComponent: @"/downloadedGameData.json"] atomically:YES];
	}
	else {
		NSLog(@"버전이 같아서 아무 것도 받지 않았다.");
	}
}

@synthesize jsonStructure;
-(id) init
{
	self = [super init];
	if(self){
		
		[self getGameDataJsonFromServer];
		
		
		NSString *mainDataPath = [[NSBundle mainBundle] pathForResource:@"mainData" ofType:@"json"];
		NSData *jsonChunk = [NSData dataWithContentsOfFile: mainDataPath];
		NSError *error = nil;
		self.jsonStructure = [NSJSONSerialization JSONObjectWithData:jsonChunk options:0 error:&error];		
	}
	return self;
}

-(NSInteger) countOfHorizontalTabs
{
	return [jsonStructure count];
}

-(NSString*) horizontalTabTitleAtIndex:(int)anInteger
{
	return [[jsonStructure objectAtIndex: anInteger] objectForKey: @"타이틀"];
}

-(NSString*) verticalTabTitleAtIndex:(int)int1 atIndex:(int)int2
{
	NSDictionary *horizontalTab = [jsonStructure objectAtIndex: int1];
	NSArray *verticalTabBarItems = [horizontalTab objectForKey: @"수직탭바"];
	
	NSDictionary *vtab = [verticalTabBarItems objectAtIndex:int2];
	return [vtab objectForKey:@"타이틀"];
}

-(NSArray*) verticalTabsAtIndex:(int)int1
{
	return [[jsonStructure objectAtIndex: int1] objectForKey: @"수직탭바"];
}

-(NSUInteger) countOfVerticalTabsAtIndex:(int)int1
{
	return [[self verticalTabsAtIndex:int1] count];
}

-(NSArray*) tableViewCellDatasAtTabIndex:(int)int1 verticalTabIndex:(int)int2
{
	NSDictionary *vtab = [[self verticalTabsAtIndex:int1] objectAtIndex:int2];
	
	NSArray *vtabItems = [vtab objectForKey:@"table items"];
	return vtabItems;	
}

-(NSUInteger) countOfTableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2
{
	return [[self tableViewCellDatasAtTabIndex:int1 verticalTabIndex:int2] count];
}


-(NSDictionary*) tableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3
{
	return [[self tableViewCellDatasAtTabIndex:int1 verticalTabIndex:int2] objectAtIndex: int3];
}

-(NSInteger)getType:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3
{
	NSArray *levels = [self tableViewCellDataAtTabIndex:int1 verticalTabIndex:int2 rowIndex:int3];
	NSString *str =  [[levels objectAtIndex:0] objectForKey:@"type"];
	if ([@"1" isEqualToString: str]) {
		return [str intValue];
	}
	
	return -1;
	
}

-(void) dealloc
{
	self.jsonStructure = nil;
	[super dealloc];
}

@end

//
//  BigBigDataStore.m
//  Ari9
//
//  Created by 오 화종 on 12. 02. 23.
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "BigBigDataStore.h"


@implementation BigBigData
@synthesize jsonStructure;
-(void) dealloc
{
	self.jsonStructure = nil;
	[super dealloc];
}

-(id) initWithArray:(NSArray*)anArray
{
	self = [super init];
	if(self){
		self.jsonStructure = anArray;
	}
	return self;
}

-(NSString*) horizontalTabTitleAtIndex:(int)anInteger
{
	return [[self.jsonStructure objectAtIndex: anInteger] objectForKey: @"타이틀"];
}

-(NSArray*) verticalTabsAtIndex:(int)int1
{
	return [[self.jsonStructure objectAtIndex: int1] objectForKey: @"수직탭바"];
}

-(NSUInteger) countOfVerticalTabsAtIndex:(int)int1
{
	return [[self verticalTabsAtIndex:int1] count];
}

-(NSDictionary*) verticalTabAtHorizontalIndex: (int)int1 atVerticalTabIndex:(int)int2
{
	return [[self verticalTabsAtIndex:int1] objectAtIndex:int2];
}

-(NSArray*) tableViewCellDatasAtTabIndex:(int)int1 verticalTabIndex:(int)int2
{
	return [[self verticalTabAtHorizontalIndex:int1 atVerticalTabIndex:int2] objectForKey:@"table items"];
}

-(NSString*) verticalTabTitleAtIndex:(int)int1 atIndex:(int)int2
{
	return [[self verticalTabAtHorizontalIndex:int1 atVerticalTabIndex:int2] objectForKey:@"타이틀"];
}

-(NSArray*) cellAtHor:(int)int1 atVert:(int)int2
{
	return [self tableViewCellDatasAtTabIndex:int1 verticalTabIndex:int2];
}

-(NSUInteger) countOfTableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2
{
	return [[self cellAtHor:int1 atVert:int2] count];
}

-(NSDictionary*) tableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3
{
	return [[self cellAtHor:int1 atVert:int2] objectAtIndex: int3];
}

-(NSInteger)getType:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3
{
	NSString *str =  [[self tableViewCellDataAtTabIndex:int1 verticalTabIndex:int2 rowIndex:int3] objectForKey:@"type"];
	if ([@"1" isEqualToString: str]) {
		return [str intValue];
	}
	return -1;	
}

@end

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

-(id) init
{
	self = [super init];
	if(self){
		data = [[BigBigData alloc] init];
		NSString *mainDataPath = [[NSBundle mainBundle] pathForResource:@"mainData" ofType:@"json"];
		NSData *jsonChunk = [NSData dataWithContentsOfFile: mainDataPath];
		NSError *error = nil;
		data.jsonStructure = [NSJSONSerialization JSONObjectWithData:jsonChunk options:0 error:&error];		
	}
	return self;
}

-(NSString*) horizontalTabTitleAtIndex:(int)anInteger
{
	return [data horizontalTabTitleAtIndex: anInteger];
}

-(NSString*) verticalTabTitleAtIndex:(int)int1 atIndex:(int)int2
{
	return [data verticalTabTitleAtIndex:int1 atIndex:int2];
}

-(NSArray*) verticalTabsAtIndex:(int)int1
{
	return [data verticalTabsAtIndex:int1];
}

-(NSUInteger) countOfVerticalTabsAtIndex:(int)int1
{
	return [data countOfVerticalTabsAtIndex:int1];
}

-(NSArray*) tableViewCellDatasAtTabIndex:(int)int1 verticalTabIndex:(int)int2
{
	return [data tableViewCellDatasAtTabIndex:int1 verticalTabIndex:int2];
}

-(NSUInteger) countOfTableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2
{
	return [data countOfTableViewCellDataAtTabIndex:int1 verticalTabIndex:int2];
}

-(NSDictionary*) tableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3
{
	return [data tableViewCellDataAtTabIndex:int1 verticalTabIndex:int2 rowIndex:int3];
}

-(NSInteger)getType:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3
{
	return [data getType:int1 verticalTabIndex:int2 rowIndex:int3];
}

-(void) dealloc
{
	[data release];
	[super dealloc];
}

@end

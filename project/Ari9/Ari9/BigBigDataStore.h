//
//  BigBigDataStore.h
//  Ari9
//
//  Created by 오 화종 on 12. 02. 23.
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BigBigData : NSObject
{
	NSArray *jsonStructure;
}
-(id) initWithArray:(NSArray*)anArray;
@property(nonatomic,retain) NSArray *jsonStructure;
-(NSString*) horizontalTabTitleAtIndex:(int)anInteger;
-(NSString*) verticalTabTitleAtIndex:(int)int1 atIndex:(int)int2;
-(NSUInteger) countOfVerticalTabsAtIndex:(int)int1;
-(NSArray*) tableViewCellDatasAtTabIndex:(int)int1 verticalTabIndex:(int)int2;
-(NSUInteger) countOfTableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2;
-(NSDictionary*) tableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3;
-(NSInteger)getType:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3;
@end


@interface BigBigDataStore : NSObject{
	BigBigData *data;
}
+ (BigBigDataStore *) sharedInstance;
+(void) destroySharedInstance;
-(NSString*) horizontalTabTitleAtIndex:(int)anInteger;
-(NSString*) verticalTabTitleAtIndex:(int)int1 atIndex:(int)int2;
-(NSUInteger) countOfVerticalTabsAtIndex:(int)int1;
-(NSUInteger) countOfTableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2;
-(NSDictionary*) tableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3;
-(NSInteger)getType:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3;
@end

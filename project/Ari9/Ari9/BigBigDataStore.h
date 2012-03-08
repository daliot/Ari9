//
//  BigBigDataStore.h
//  Ari9
//
//  Created by 오 화종 on 12. 02. 23.
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BigBigDataStore : NSObject{
	NSArray *jsonStructure;
}
+ (BigBigDataStore *) sharedInstance;
+(void) destroySharedInstance;
@property(nonatomic,retain) NSArray *jsonStructure;
-(NSInteger) countOfHorizontalTabs;
-(NSString*) horizontalTabTitleAtIndex:(int)anInteger;
-(NSString*) verticalTabTitleAtIndex:(int)int1 atIndex:(int)int2;
-(NSUInteger) countOfVerticalTabsAtIndex:(int)int1;
-(NSUInteger) countOfTableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2;
-(NSDictionary*) tableViewCellDataAtTabIndex:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3;
-(NSInteger)getType:(int)int1 verticalTabIndex:(int)int2 rowIndex:(int)int3;
@end

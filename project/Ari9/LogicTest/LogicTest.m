//
//  LogicTest.m
//  LogicTest
//
//  Created by 오 화종 on 12. 03. 06.
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "LogicTest.h"
#import "BigBigDataStore.h"

@implementation LogicTest

- (void)setUp
{
    [super setUp];
	NSMutableArray *array = [NSMutableArray array];
	NSMutableDictionary *dic;
	NSMutableArray *vertical;
	
	NSMutableDictionary *vDic;
	NSMutableArray *tableItems;
	
	dic = [NSMutableDictionary dictionary];
	[dic setObject:@"하나" forKey:@"타이틀"];
		vertical = [NSMutableArray array];
		vDic = [NSMutableDictionary dictionary];
		[vDic setObject:@"하나-수직0" forKey:@"타이틀"];
		tableItems = [NSMutableArray array];
		[tableItems addObject:@"아이템1"];
		[tableItems addObject:@"아이템2"];
		[tableItems addObject:@"아이템3"];
		[vDic setObject:tableItems forKey:@"table items"];
		[vertical addObject:vDic];
		[vertical addObject:[NSDictionary dictionaryWithObject:@"하나-수직1" forKey:@"타이틀"]];
	[dic setObject:vertical forKey:@"수직탭바"];
	[array addObject:dic];
	
	dic = [NSMutableDictionary dictionary];
	[dic setObject:@"둘" forKey:@"타이틀"];
	vertical = [NSMutableArray array];
	vDic = [NSMutableDictionary dictionary];
	[vDic setObject:@"둘-수직0" forKey:@"타이틀"];
		tableItems = [NSMutableArray array];
		[tableItems addObject:[NSDictionary dictionaryWithObject:@"1" forKey:@"type"]];
		[tableItems addObject:[NSDictionary dictionary]];
	[vDic setObject:tableItems forKey:@"table items"];
	[vertical addObject:vDic];
	[dic setObject:vertical forKey:@"수직탭바"];
	[array addObject:dic];
	

	dic = [NSMutableDictionary dictionary];
	[dic setObject:@"셋" forKey:@"타이틀"];
	[array addObject:dic];


	bigBig = [[BigBigData alloc] initWithArray:array];	
}

- (void)tearDown
{
	[bigBig release];
    [super tearDown];
}

- (void)testHorizontalTabTitleAtIndex
{
	STAssertEqualObjects(@"하나", [bigBig horizontalTabTitleAtIndex: 0],nil);
	STAssertEqualObjects(@"둘", [bigBig horizontalTabTitleAtIndex: 1],nil);
	STAssertEqualObjects(@"셋", [bigBig horizontalTabTitleAtIndex: 2],nil);
}

-(void) testVerticalTabTitleAtIndexAtIndex
{
	STAssertEqualObjects(@"하나-수직0", [bigBig verticalTabTitleAtIndex: 0 atIndex: 0],nil);
	STAssertEqualObjects(@"하나-수직1", [bigBig verticalTabTitleAtIndex: 0 atIndex: 1],nil);
}

-(void) testCountOfVerticalTabsAtIndex
{
	STAssertEquals(2, (int)[bigBig countOfVerticalTabsAtIndex: 0],nil);
}

-(void) testTableViewCellDatasAtTabIndex
{
	NSArray *array = [NSArray arrayWithObjects:@"아이템1",@"아이템2",@"아이템3", nil];
	STAssertEqualObjects(array, [bigBig tableViewCellDatasAtTabIndex: 0 verticalTabIndex: 0],nil);
}

-(void) testCountOfTableViewCellDataAtTabIndexVerticalTabIndex
{
	STAssertEquals(3, (int)[bigBig countOfTableViewCellDataAtTabIndex:0 verticalTabIndex:0],nil);
}

-(void) testTableViewCellDataAtTabIndexVerticalTabIndexRowIndex
{
	STAssertEqualObjects(@"아이템1", [bigBig tableViewCellDataAtTabIndex:0 verticalTabIndex:0 rowIndex:0],nil);
	STAssertEqualObjects(@"아이템2", [bigBig tableViewCellDataAtTabIndex:0 verticalTabIndex:0 rowIndex:1],nil);
	STAssertEqualObjects(@"아이템3", [bigBig tableViewCellDataAtTabIndex:0 verticalTabIndex:0 rowIndex:2],nil);
}

-(void) testGetTypeVerticalTabIndexRowIndex
{
	STAssertEquals(1, [bigBig getType:1 verticalTabIndex:0 rowIndex:0], nil);
	STAssertEquals(-1, [bigBig getType:1 verticalTabIndex:0 rowIndex:1], nil);
}

@end

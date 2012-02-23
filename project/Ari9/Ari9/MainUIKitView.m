//
//  MainUIKitView.m
//  Ari9
//
//  Created by 최 민규 on 12. 2. 16..
//  Copyright (c) 2012 앱달. All rights reserved.
//

#import "MainUIKitView.h"
#import "VerticalTabView.h"


@implementation MainUIKitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		
//		NSString *mainDataPath = [[NSBundle mainBundle] pathForResource:@"jsonData" ofType:@"plist"];
//		NSDictionary *dataDic = [NSDictionary dictionaryWithContentsOfFile: mainDataPath];
//		mainData = [[dataDic objectForKey:@"data"] retain];
//		
//		NSError *error = nil;
//		NSString *dataString = [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:mainData options:NSJSONWritingPrettyPrinted error:&error] encoding:NSUTF8StringEncoding];
//		NSLog(@"mainData json[%@]", dataString);
		
		
		[self setBackgroundColor:[UIColor whiteColor]];
		
		UIButton *switchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[switchButton setFrame:CGRectMake(100, 100, 100, 100)];
		[switchButton addTarget:APPDAL action:@selector(switch_UIViewToCocosView) forControlEvents:UIControlEventTouchDown];
		[self addSubview:switchButton];
		
		UITabBarItem *firstTab = [[UITabBarItem alloc] initWithTitle: @"upgrade" image: [UIImage imageNamed:@"Icon"] tag:0];
		UITabBarItem *secondTab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
		UITabBarItem *thirdTab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:2];
		UITabBarItem *fourthTab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3];
		UITabBarItem *fifthTab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:4];
		
		NSArray *tabArray = [NSArray arrayWithObjects:firstTab,secondTab,thirdTab,fourthTab,fifthTab, nil];
		
		UITabBar *bottomTab = [[UITabBar alloc]init];
		[bottomTab setFrame:CGRectMake(0, 431, 320, 49)];
		[bottomTab setItems:tabArray];
		[self addSubview:bottomTab];
		
		bottomTab.delegate = self;	
		
		
		VerticalTabView *aTabView;
		
		tabView0 = [VerticalTabView createTabView:0];
		aTabView = tabView0;
		[self addSubview:aTabView];
		[aTabView release];
		
		tabView1 = [VerticalTabView createTabView:1];
		aTabView = tabView1;
		[self addSubview:aTabView];
		[aTabView release];
		
		tabView2 = [VerticalTabView createTabView:2];
		aTabView = tabView2;
		[self addSubview:aTabView];
		[aTabView release];
		
		tabView3 = [VerticalTabView createTabView:3];
		aTabView = tabView3;
		[self addSubview:aTabView];
		[aTabView release];
		
		tabView4 = [VerticalTabView createTabView:4];
		aTabView = tabView4;
		[self addSubview:aTabView];
		[aTabView release];
	}
    return self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	switch (item.tag) {
		case 0:
			[self bringSubviewToFront:tabView0];
			break;
			
		case 1:
			[self bringSubviewToFront:tabView1];
			break;
			
		case 2:
			[self bringSubviewToFront:tabView2];
			break;
			
		case 3:
			[self bringSubviewToFront:tabView3];
			break;
			
		case 4:
			[self bringSubviewToFront:tabView4];
			break;
	}
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

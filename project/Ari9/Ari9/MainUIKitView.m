//
//  MainUIKitView.m
//  Ari9
//
//  Created by 최 민규 on 12. 2. 16..
//  Copyright (c) 2012 앱달. All rights reserved.
//

#import "MainUIKitView.h"

@implementation MainUIKitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor whiteColor]];
		
		UIButton *switchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[switchButton setFrame:CGRectMake(100, 100, 100, 100)];
		[switchButton addTarget:APPDAL action:@selector(switch_UIViewToCocosView) forControlEvents:UIControlEventTouchDown];
		[self addSubview:switchButton];
		
		UITabBarItem *firstTab = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
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
    }
    return self;
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	switch (item.tag) {
		case 0:
			[self setBackgroundColor:[UIColor yellowColor]];
			break;
			
		case 1:
			[self setBackgroundColor:[UIColor redColor]];
			break;
			
		case 2:
			[self setBackgroundColor:[UIColor blueColor]];
			break;
			
		case 3:
			[self setBackgroundColor:[UIColor grayColor]];
			break;
			
		case 4:
			[self setBackgroundColor:[UIColor magentaColor]];
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

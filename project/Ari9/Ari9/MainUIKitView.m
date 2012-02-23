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
		
		
		tabViews = [[NSMutableArray alloc] init];
		NSMutableArray *tabArray = [NSMutableArray array];
		for(int i=0;i<3;i++){
			UITabBarItem *hTab = [[UITabBarItem alloc] initWithTitle: [[BigBigDataStore sharedInstance] horizontalTabTitleAtIndex:i] image: [UIImage imageNamed:@"Icon"] tag:i];
			[tabArray addObject: hTab];
			
			VerticalTabView *aTabView = [VerticalTabView createTabView:i];
			[self addSubview:aTabView];
			[aTabView release];
			[tabViews addObject:aTabView];
		}
				
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
	[self bringSubviewToFront: [tabViews objectAtIndex: item.tag]];
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

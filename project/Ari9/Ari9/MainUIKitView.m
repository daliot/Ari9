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
		
		
		// 세로탭 + 내용 
		tabViews = [[NSMutableArray alloc] init];
		NSMutableArray *tabArray = [NSMutableArray array];
		for(int i=0;i<3;i++){
			UITabBarItem *hTab = [[UITabBarItem alloc] 
								  initWithTitle: [[BigBigDataStore sharedInstance] horizontalTabTitleAtIndex:i] 
								  image: [UIImage imageNamed:@"Icon"] 
								  tag:i];
			[tabArray addObject: hTab];
			
			VerticalTabView *aTabView = [VerticalTabView createTabView:i];
			[self addSubview:aTabView];
			[aTabView release];
			[tabViews addObject:aTabView];
		}
		
		// 탭바 (바닥에 있는)
		bottomTab = [[UITabBar alloc]init];
		[bottomTab setFrame:CGRectMake(0, 431, 320, LAYOUT_BOTTOM_TAB_BAR_HEIGHT)];
		[bottomTab setItems:tabArray];
		
		//[bottomTab setSelectedItem:[[bottomTab items]objectAtIndex:0]];
		[self addSubview:bottomTab];
		[bottomTab setSelectedItem:[[bottomTab items]objectAtIndex:0]];
		
		
		bottomTab.delegate = self;
		
		// 타이틀 바
		titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, LAYOUT_TITLE_BAR_HEIGHT)];
		[titleBar setBackgroundColor:[UIColor purpleColor]];
		
		UIButton *btnShowMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[btnShowMenu setTitle:@"메뉴" forState:UIControlStateNormal];
		[btnShowMenu addTarget:self action:@selector(toggle_VerticalTab) forControlEvents:UIControlEventTouchDown];
		[titleBar addSubview:btnShowMenu];
		btnShowMenu.frame = CGRectMake(5, 5, 55, LAYOUT_TITLE_BAR_HEIGHT - 10);
		
		
		lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(65, 5, 320-70, LAYOUT_TITLE_BAR_HEIGHT - 10)];
		[lblTitle setBackgroundColor:[UIColor clearColor]];
		//[lblTitle setText:@""];
		[lblTitle setTextAlignment:UITextAlignmentCenter];
		[titleBar addSubview:lblTitle];
		
		[self addSubview:titleBar];
		[self tabBar:bottomTab didSelectItem:[[bottomTab items]objectAtIndex:0]];
	}
    return self;
}

- (void)setTitleText: (NSString*)aTitle
{
	[lblTitle setText:aTitle];
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	[self bringSubviewToFront: [tabViews objectAtIndex: item.tag]];
	[self setTitleText:item.title];
}

-(void)toggle_VerticalTab
{
	if ([[tabViews objectAtIndex:[[bottomTab selectedItem] tag]] verticalTabShown])[[tabViews objectAtIndex:[[bottomTab selectedItem] tag]] hideVerticalTab];
	else [[tabViews objectAtIndex:[[bottomTab selectedItem] tag]] showVerticalTab];
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

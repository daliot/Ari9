//
//  MainUIKitView.h
//  Ari9
//
//  Created by 최 민규 on 12. 2. 16..
//  Copyright (c) 2012 앱달. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VerticalTabView;

@interface MainUIKitView : UIView<UITabBarDelegate>
{
	VerticalTabView *tabView0;
	VerticalTabView *tabView1;
	VerticalTabView *tabView2;
	VerticalTabView *tabView3;
	VerticalTabView *tabView4;
}
@end

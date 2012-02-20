//
//  VerticalTabView.h
//  Ari9
//
//  Created by 홍준 김 on 12. 2. 20..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VerticalTab;
@class ContentsTableView;

@interface VerticalTabView : UIView
{
	VerticalTab *verticalTab;
	ContentsTableView *contentsTableView;
}

+(VerticalTabView*)createTabView:(int)tag;
-(void) setMyColor;
-(void) addTabButton:(UIImage*)image title:(NSString*)title;

@end

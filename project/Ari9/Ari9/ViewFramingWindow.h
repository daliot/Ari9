//
//  ViewFramingWindow.h
//  RManual
//
//  Created by 오 화종 on 11. 12. 08.
//  Copyright (c) 2011년 앱달. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewFramingWindow : UIWindow{
	UIView *framingView;
	CGPoint touchBeginPosition;
	int mode;
	CGPoint originWhenTouchBegin;
	CGSize sizeWhenTouchBegin;
}
@property(nonatomic, assign) UIView *framingView;
@end


extern ViewFramingWindow *viewFramer;
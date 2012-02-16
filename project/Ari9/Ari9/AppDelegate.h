//
//  AppDelegate.h
//  Ari9
//
//  Created by 오 화종 on 12. 02. 07.
//  Copyright 앱달 2012년. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "MainUIKitView.h"

@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	MainUIKitView *UIKitView;
	
	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;


-(void)switch_UIViewToCocosView;
-(void)switch_CocosViewToUIView;

@end

//
//  HelloWorldLayer.h
//  Ari9
//
//  Created by 오 화종 on 12. 02. 07.
//  Copyright 앱달 2012년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "NodePositionProbingLayer.h"
#import "FirstLayer.h"
#import "SecondLayer.h"
#import "ThirdLayer.h"
#import "FourthLayer.h"
#import "FifthLayer.h"

// HelloWorldLayer
@interface MainMenuLayer : CCLayerColor <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
	NSMutableArray *tabLayers;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end

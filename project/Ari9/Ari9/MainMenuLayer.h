//
//  HelloWorldLayer.h
//  Ari9
//
//  Created by 오 화종 on 12. 02. 07.
//  Copyright 앱달 2012년. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "FirstLayer.h"

// HelloWorldLayer
@interface MainMenuLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end

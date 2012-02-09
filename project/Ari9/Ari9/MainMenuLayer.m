//
//  HelloWorldLayer.m
//  Ari9
//
//  Created by 오 화종 on 12. 02. 07.
//  Copyright 앱달 2012년. All rights reserved.
//


// Import the interfaces
#import "MainMenuLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation MainMenuLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainMenuLayer *layer = [MainMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(void) allTabLayersGoOffScreen
{
	for(TabLayer *each in tabLayers){
		[each goOffScreen];
	}
}

-(TabLayer*) firstLayer
{
	return [tabLayers objectAtIndex:0];
}

-(TabLayer*) secondLayer
{
	return [tabLayers objectAtIndex:1];
}

-(TabLayer*) thirdLayer
{
	return [tabLayers objectAtIndex:2];
}

-(TabLayer*) fourthLayer
{
	return [tabLayers objectAtIndex:3];
}

-(TabLayer*) fifthLayer
{
	return [tabLayers objectAtIndex:4];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init])) {
		
		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:20];
		
		tabLayers = [[NSMutableArray alloc] init];
		[tabLayers addObject:[FirstLayer layerWithColor:ccc4(0,255,0,255) width:320 height:440]];
		[tabLayers addObject:[SecondLayer layerWithColor:ccc4(0,0,255,255) width:320 height:440]];
		[tabLayers addObject:[ThirdLayer layerWithColor:ccc4(255,0,0,255) width:320 height:440]];
		[tabLayers addObject:[FourthLayer layerWithColor:ccc4(255,255,0,255) width:320 height:440]];
		[tabLayers addObject:[FifthLayer layerWithColor:ccc4(0,255,255,255) width:320 height:440]];

		// Achievement Menu Item using blocks
		CCMenuItem *first = [CCMenuItemFont itemWithString:@"[  1  ]" block:^(id sender) {
			[self allTabLayersGoOffScreen];
			[self firstLayer].position = ccp(0,40);
			[self addChild:[self firstLayer]];
		}
									   ];

		// Leaderboard Menu Item using blocks
		CCMenuItem *second = [CCMenuItemFont itemWithString:@"[  2  ]" block:^(id sender) {
						
			[self allTabLayersGoOffScreen];
			[self secondLayer].position = ccp(0,40);
			[self addChild:[self secondLayer]];
			
		}
									   ];
		
		CCMenuItem *third = [CCMenuItemFont itemWithString:@"[  3  ]" block:^(id sender) {
			
			[self allTabLayersGoOffScreen];
			[self thirdLayer].position = ccp(0,40);
			[self addChild:[self thirdLayer]];
		}
							 ];

		CCMenuItem *fourth = [CCMenuItemFont itemWithString:@"[  4  ]" block:^(id sender) {
			
			[self allTabLayersGoOffScreen];
			[self fourthLayer].position = ccp(0,40);
			[self addChild:[self fourthLayer]];
		}
							 ];
		
		CCMenuItem *fifth = [CCMenuItemFont itemWithString:@"[  5  ]" block:^(id sender) {
			
			[self allTabLayersGoOffScreen];
			[self fifthLayer].position = ccp(0,40);
			[self addChild:[self fifthLayer]];
		}
							 ];


		
		CCMenu *menu = [CCMenu menuWithItems:first, second,third,fourth,fifth, nil];
		[menu setColor:ccGRAY];
		[menu alignItemsHorizontallyWithPadding:1];
		[menu setPosition:ccp( size.width/2, 10)];
		
		// Add the menu to the layer
		[self addChild:menu];
	}
	return self;
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}
@end

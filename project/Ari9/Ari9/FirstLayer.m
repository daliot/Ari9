//
//  FirstLayer.m
//  Ari9
//
//  Created by 최 민규 on 12. 2. 7..
//  Copyright 2012 앱달. All rights reserved.
//

#import "FirstLayer.h"


@implementation FirstLayer

- (id) initWithColor:(ccColor4B)color width:(GLfloat)w  height:(GLfloat) h
{
	
		// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
 
	
	
	
	
	
	if( (self = [super initWithColor:color width:w height:h])) {
		
		verticalTabsLayer = [CCLayerColor layerWithColor: ccc4(100, 100, 100, 100) width:100 height:440];
		
		CCMenuItem *first = [CCMenuItemFont itemWithString:@"[  1  ]" block:^(id sender) {
			
			[APPDAL switch_CocosViewToUIView];
			
			//[self allTabLayersGoOffScreen];
			//[self firstLayer].position = ccp(0,40);
			//[self addChild:[self firstLayer]];
			
		}
							 ];
		
		// Leaderboard Menu Item using blocks
		CCMenuItem *second = [CCMenuItemFont itemWithString:@"[  2  ]" block:^(id sender) {
			
//			[self allTabLayersGoOffScreen];
//			[self secondLayer].position = ccp(0,40);
//			[self addChild:[self secondLayer]];
			
		}
							  ];
		
		CCMenuItem *third = [CCMenuItemFont itemWithString:@"[  3  ]" block:^(id sender) {
			
//			[self allTabLayersGoOffScreen];
//			[self thirdLayer].position = ccp(0,40);
//			[self addChild:[self thirdLayer]];
		}
							 ];
		
		CCMenuItem *fourth = [CCMenuItemFont itemWithString:@"[  4  ]" block:^(id sender) {
			
//			[self allTabLayersGoOffScreen];
//			[self fourthLayer].position = ccp(0,40);
//			[self addChild:[self fourthLayer]];
		}
							  ];
		
		CCMenuItem *fifth = [CCMenuItemFont itemWithString:@"[  5  ]" block:^(id sender) {
			
//			[self allTabLayersGoOffScreen];
//			[self fifthLayer].position = ccp(0,40);
//			[self addChild:[self fifthLayer]];
		}
							 ];
		
		first.position = ccp(-130,170);
		second.position = ccp(-130,120);
		third.position = ccp(-130,70);
		fourth.position = ccp(-130,20);
		fifth.position = ccp(-130,-30);
		
		CCMenu *menu = [CCMenu menuWithItems:first, second,third,fourth,fifth, nil];
		[menu setColor:ccRED];
		
		// Add the menu to the layer
		[verticalTabsLayer addChild:menu];
		[self addChild:verticalTabsLayer];
	}
	return self;
}

@end

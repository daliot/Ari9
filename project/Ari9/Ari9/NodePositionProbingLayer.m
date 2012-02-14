//  Created by 오화종 on 10. 12. 11.
//  Copyright 2010 앱달. All rights reserved.
//

#import "NodePositionProbingLayer.h"


@implementation NodePositionProbingLayer

-(void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	[super ccTouchesBegan:touches withEvent:event];
	spritePositionWhenTouchBegin = probedNode.position;
}

- (void) probeWithTouchDisplacement:(CGPoint)aPoint
{
	CGPoint newPosition = probedNode.position;
	newPosition.x = spritePositionWhenTouchBegin.x + aPoint.x;
	newPosition.y = spritePositionWhenTouchBegin.y - aPoint.y;
	probedNode.position = newPosition;
	
	NSLog(@"NODE.position = ccp(%f , %f);", probedNode.position.x, probedNode.position.y);
}

@end

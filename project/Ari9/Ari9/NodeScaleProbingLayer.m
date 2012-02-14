//  Created by 오화종 on 10. 12. 11.
//  Copyright 2010 앱달. All rights reserved.
//

#import "NodeScaleProbingLayer.h"


@implementation NodeScaleProbingLayer

-(void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	[super ccTouchesBegan:touches withEvent:event];
	spriteScaleXWhenTouchBegin = probedNode.scaleX;
	spriteScaleYWhenTouchBegin = probedNode.scaleY;
}


- (void) probeWithTouchDisplacement:(CGPoint)aPoint
{
	if (probedNode.scaleX==0.0) {
		probedNode.scaleX = spriteScaleXWhenTouchBegin + aPoint.x/100.0;
	}
	else {
		probedNode.scaleX = spriteScaleXWhenTouchBegin + aPoint.x/100.0/spriteScaleXWhenTouchBegin;
	}

	if (probedNode.scaleY==0.0) {
		probedNode.scaleY = spriteScaleYWhenTouchBegin + aPoint.y/100.0;
	}
	else {
		probedNode.scaleY = spriteScaleYWhenTouchBegin + aPoint.y/100.0/spriteScaleYWhenTouchBegin;
	}
	NSLog(@"NODE.scaleX = %f; SPRITE.scaleY = %f;", probedNode.scaleX, probedNode.scaleY);
}

@end

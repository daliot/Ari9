//  Created by 오화종 on 10. 12. 11.
//  Copyright 2010 앱달. All rights reserved.
//

#import "NodePositionProbingLayer.h"


@implementation NodeProbingLayer

-(id) init
{
	self = [super init];
	if(self){
		self.isTouchEnabled = YES;
	}
	return self;
}

-(void) setProbedNode:(CCNode*)aNode;
{
	NSAssert(aNode.parent != nil, @"보이지 않는 스프라이트");
	//NSAssert(aNode.visible == YES, @"보이지 않는 스프라이트");
	
	if(probedNode != aNode){
		[probedNode release];
		probedNode = aNode;
		[probedNode retain];		
	}
}

-(void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
	NSAssert(probedNode != nil, @"스프라이트가 없어");
	UITouch *touch = [touches anyObject];
	touchBeginPosition = [touch locationInView: touch.view];
}

- (void) probeWithTouchDisplacement:(CGPoint)aPoint
{
	// subclass jobs expected
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint currentPoint = [touch locationInView: touch.view];
	
//	CGFloat tdx = currentPoint.x - touchBeginPosition.x;
//	CGFloat tdy = currentPoint.y - touchBeginPosition.y;
	[self probeWithTouchDisplacement: CGPointMake(currentPoint.x - touchBeginPosition.x, currentPoint.y - touchBeginPosition.y)];
}	



@end

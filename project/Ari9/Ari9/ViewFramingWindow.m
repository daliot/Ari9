//
//  ViewFramingWindow.m
//  RManual
//
//  Created by 오 화종 on 11. 12. 08.
//  Copyright (c) 2011년 앱달. All rights reserved.
//

#import "ViewFramingWindow.h"

ViewFramingWindow *viewFramer;

@implementation ViewFramingWindow
@synthesize framingView;

-(void) commonInit
{
	mode = 1011;
	self.userInteractionEnabled = YES;
	self.multipleTouchEnabled = YES;
	self.exclusiveTouch = NO;
}

-(id) initWithFrame:(CGRect)aRect
{
	self = [super initWithFrame:aRect];
	if(self){
		[self commonInit];
	}
	return self;
}

-(BOOL) isFraming
{
	return self.framingView != nil;
}

-(void)sendEvent:(UIEvent *)event {
    if ( [self isFraming] == NO ) {
        [super sendEvent:event];
        return;
    }
	
    UITouch *touch = [[event allTouches] anyObject];
	
    switch ( touch.phase ) {
        case UITouchPhaseBegan:
			[self touchesBegan:[event allTouches] withEvent:event];				
			break;
        case UITouchPhaseMoved:
			[self touchesMoved:[event allTouches] withEvent:event];				
            break;
        case UITouchPhaseCancelled:
			[self touchesCancelled:[event allTouches] withEvent:event];			  
			break;
        case UITouchPhaseEnded:
			[self touchesEnded:[event allTouches] withEvent:event];
            break;
		default:
			break;
    }
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([[touches anyObject] tapCount]==2){
		if(mode==1011) mode=2022;
		else if(mode==2022) mode=1011;
	}
	else{
		
		if([self isFraming]){
			UITouch *touch = [touches anyObject];
			touchBeginPosition = [touch locationInView: self];
			
			if(mode==1011){
				originWhenTouchBegin = framingView.frame.origin;	
			}
			if(mode==2022){
				sizeWhenTouchBegin = framingView.frame.size;	
			}
		}
	}
}

- (void) probeWithTouchDisplacement:(CGPoint)aPoint
{
	if(mode==1011){
		CGPoint newPosition = framingView.frame.origin;
		newPosition.x = originWhenTouchBegin.x + aPoint.x;
		newPosition.y = originWhenTouchBegin.y + aPoint.y;
		CGRect rect = framingView.frame;
		rect.origin = newPosition;
		framingView.frame = rect;
	}
	if(mode==2022){
		CGSize newSize = framingView.frame.size;
		newSize.width = sizeWhenTouchBegin.width + aPoint.x;
		newSize.height = sizeWhenTouchBegin.height + aPoint.y;
		CGRect rect = framingView.frame;
		rect.size = newSize;
		framingView.frame = rect;
	}
	NSLog(@"VIEW.frame = CGRectMake(%g, %g, %g, %g);", framingView.frame.origin.x, framingView.frame.origin.y, framingView.frame.size.width, framingView.frame.size.height);
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	if([self isFraming]){
		UITouch *touch = [touches anyObject];
		CGPoint currentPoint = [touch locationInView: self];
		
		[self probeWithTouchDisplacement: CGPointMake(currentPoint.x - touchBeginPosition.x, currentPoint.y - touchBeginPosition.y)];
	}
}

@end

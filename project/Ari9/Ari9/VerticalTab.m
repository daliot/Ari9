//
//  VerticalTab.m
//  Ari9
//
//  Created by 홍준 김 on 12. 2. 20..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "VerticalTab.h"
#import "ViewFramingWindow.h"

@implementation VerticalTab

-(void) addTabButton:(NSString*)titleString tag:(int)anInteger
{
	UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[bt setTitle:titleString forState:UIControlStateNormal];
	CGFloat btFrameY;
	if([tabButtons count]==0) btFrameY = 0;
	else {
		btFrameY = CGRectGetMaxY(((UIButton*)[tabButtons lastObject]).frame);
	}
	bt.frame = CGRectMake(0, btFrameY, self.frame.size.width, 81);
	[self addSubview: bt];
	[tabButtons addObject: bt];
	bt.tag = anInteger;
	
	[bt addTarget: [self superview] action:@selector(verticalTabButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		tabButtons = [[NSMutableArray alloc] init];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

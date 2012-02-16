//
//  MainUIKitView.m
//  Ari9
//
//  Created by 최 민규 on 12. 2. 16..
//  Copyright (c) 2012 앱달. All rights reserved.
//

#import "MainUIKitView.h"

@implementation MainUIKitView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		[self setBackgroundColor:[UIColor whiteColor]];
		
		UIButton *switchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[switchButton setFrame:CGRectMake(100, 100, 100, 100)];
		[switchButton addTarget:APPDAL action:@selector(switch_UIViewToCocosView) forControlEvents:UIControlEventTouchDown];
		[self addSubview:switchButton];
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

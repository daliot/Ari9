//
//  VerticalTabView.m
//  Ari9
//
//  Created by 홍준 김 on 12. 2. 20..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "VerticalTabView.h"
#import "VerticalTab.h"
#import "ContentsTableView.h"

@implementation VerticalTabView

+(VerticalTabView*)createTabView:(int)tag 
{
	VerticalTabView *tempView = [[VerticalTabView alloc]initWithFrame: LAYOUT_CONTENTS_FULL];  
	[tempView setTag:tag];
	[tempView setMyColor];
	return tempView;
}

-(void) setMyColor
{
	switch (self.tag) {
		case 0:
			[self setBackgroundColor:[UIColor redColor]];
			break;
		case 1:
			[self setBackgroundColor:[UIColor blueColor]];
			break;
		case 2:
			[self setBackgroundColor:[UIColor grayColor]];
			break;
		case 3:
			[self setBackgroundColor:[UIColor yellowColor]];
			break;
		case 4:
			[self setBackgroundColor:[UIColor magentaColor]];
			break;
			
	}
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		verticalTab = [[VerticalTab alloc] initWithFrame:LAYOUT_LEFTSIDE];
		[verticalTab setBackgroundColor:[UIColor whiteColor]];
		[self addSubview:verticalTab];
		[verticalTab release];
		contentsTableView = [[ContentsTableView alloc] initWithFrame:LAYOUT_CONTENTS_SIDE];
		[self addSubview:contentsTableView];
		[contentsTableView release];
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

-(void)addTabButton:(UIImage*)image title:(NSString*)title
{
	
}

@end

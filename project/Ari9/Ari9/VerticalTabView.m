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

-(void) showVerticalTab
{
	if(verticalTabShown==YES) return;
	verticalTabShown=YES;
	[UIView animateWithDuration:0.2f animations:^{
		CGRect fr = verticalTab.frame;
		fr.origin.x = 0;
		verticalTab.frame = fr;
				
		CGRect ctfr = contentsTableView.frame;
		ctfr.origin.x = fr.origin.x + fr.size.width;
		ctfr.size.width = 320-ctfr.origin.x;
		contentsTableView.frame = ctfr;
	}];	
}

-(void) hideVerticalTab
{
	if(verticalTabShown==NO) return;
	verticalTabShown=NO;
	
	[UIView animateWithDuration:0.2f animations: ^{
		CGRect fr = verticalTab.frame;
		fr.origin.x = -fr.size.width;
		verticalTab.frame = fr;
				
		CGRect ctfr = contentsTableView.frame;
		ctfr.origin.x = fr.origin.x + fr.size.width;
		ctfr.size.width = 320-ctfr.origin.x;
		contentsTableView.frame = ctfr;
	}];
}

-(void) toggle_VerticalTab
{
	if (verticalTabShown)[self hideVerticalTab];
	else [self showVerticalTab];
}

+(VerticalTabView*)createTabView:(int)tag 
{
	VerticalTabView *tempView = [[VerticalTabView alloc] initWithFrame: LAYOUT_CONTENTS_FULL];  
	[tempView setTag:tag];
	return tempView;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
		verticalTabShown = YES;
		verticalTab = [[VerticalTab alloc] initWithFrame:LAYOUT_LEFTSIDE];
		[verticalTab setBackgroundColor:[UIColor whiteColor]];
		[self addSubview:verticalTab];
		[verticalTab release];
		
		for(int i=0;i<[[BigBigDataStore sharedInstance] countOfVerticalTabsAtIndex:self.tag]; i++){
			[verticalTab addTabButton: [[BigBigDataStore sharedInstance] verticalTabTitleAtIndex:self.tag atIndex:i] tag: i];
		}

		contentsTableView = [[ContentsTableView alloc] initWithFrame:LAYOUT_CONTENTS_SIDE];
		[self addSubview:contentsTableView];
		[contentsTableView release];
    }
    return self;
}

-(void) verticalTabButton:(UIButton*)sender
{
	[verticalTab unHilight_AllButton:sender];
	[self performSelector:@selector(change_SelectedButton:) withObject:sender afterDelay:0.1f];
	
	contentsTableView.horizontalTabIndex = self.tag;
	contentsTableView.verticalTabIndex = sender.tag;
	[contentsTableView reloadData];
	
	[APPDAL setTitleText:sender.titleLabel.text];
}

-(void)change_SelectedButton:(UIButton *)sender
{	
	sender.highlighted = YES;
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

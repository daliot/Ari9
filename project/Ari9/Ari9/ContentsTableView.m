//
//  ContentsTableView.m
//  Ari9
//
//  Created by 홍준 김 on 12. 2. 20..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "ContentsTableView.h"
#import "SimpleCell.h"
#import "CustomCell.h"


@implementation ContentsTableView

@synthesize horizontalTabIndex;
@synthesize verticalTabIndex;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
		self.delegate = self;
		self.dataSource = self;
    }
    return self;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	NSDictionary *cellDic = [[BigBigDataStore sharedInstance] tableViewCellDataAtTabIndex:horizontalTabIndex verticalTabIndex:verticalTabIndex rowIndex:indexPath.row];
	int type = [[BigBigDataStore sharedInstance] getType:horizontalTabIndex verticalTabIndex:verticalTabIndex rowIndex:indexPath.row];
	
	NSString *CellIdentifier;
	if (type == 1) {
		CellIdentifier = @"SimpleCell";
	}
	else {
		CellIdentifier = @"CustomCell";
	}
	
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	
	if (cell == nil) {
        if (type == 1) 
		{
			cell = [[[SimpleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		}
		else {
			cell = [[[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		}
		
		
    }
	[(SimpleCell*)cell setData:cellDic];	
	
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[BigBigDataStore sharedInstance] countOfTableViewCellDataAtTabIndex:horizontalTabIndex verticalTabIndex:verticalTabIndex];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 130.0f;
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

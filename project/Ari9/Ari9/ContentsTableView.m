//
//  ContentsTableView.m
//  Ari9
//
//  Created by 홍준 김 on 12. 2. 20..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "ContentsTableView.h"

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
    static NSString *CellIdentifier = @"Cell";
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	
	NSMutableString *string = [NSMutableString string];
	NSDictionary *cellDic = [[BigBigDataStore sharedInstance] tableViewCellDataAtTabIndex:horizontalTabIndex verticalTabIndex:verticalTabIndex rowIndex:indexPath.row];

	for (NSString *keyObj in cellDic) {
		[string appendFormat:@"%@=%@ ", keyObj, [cellDic objectForKey: keyObj]];
	}	
	cell.textLabel.text = string;

    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [[BigBigDataStore sharedInstance] countOfTableViewCellDataAtTabIndex:horizontalTabIndex verticalTabIndex:verticalTabIndex];
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

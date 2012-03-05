//
//  CustomCell.m
//  Ari9
//
//  Created by 홍준 김 on 12. 3. 5..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setData:(NSDictionary*)cellDic
{
	[self setData:cellDic type:@"custom"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(id) cellWithStyle:(UITableViewCellStyle)cellStyleInt tableView:(UITableView*) tableView cellDic:(NSDictionary*)cellDic
{
	NSString *CellIdentifier = @"CustomCell";
	CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];	
	if (cell == nil) {
		cell = [[[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
	}
	[cell setData:cellDic];			
	return cell;
}


@end

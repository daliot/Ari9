//
//  SimpleCell.m
//  Ari9
//
//  Created by 홍준 김 on 12. 3. 5..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "SimpleCell.h"

@implementation SimpleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		self.detailTextLabel.text = @"simple";
    }
    return self;
}

- (void)setData:(NSDictionary*)cellDic
{
	[self setData:cellDic type:@"simple"];
}

- (void)setData:(NSDictionary*)cellDic type:(NSString*)str
{
	NSMutableString *string = [NSMutableString string];
	[string appendFormat:@"%@\n",str];
	for (NSString *keyObj in cellDic) {
		[string appendFormat:@"%@=%@ \n", keyObj, [cellDic objectForKey: keyObj]];
	}
	self.textLabel.text = string;
	self.textLabel.font = [UIFont fontWithName:@"Hevetica" size:14];
	self.textLabel.numberOfLines = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

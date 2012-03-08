//
//  UpgradeCell.m
//  Ari9
//
//  Created by 홍준 김 on 12. 3. 5..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import "UpgradeCell.h"

@implementation UpgradeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
		
		webView = [[UIWebView alloc] initWithFrame: CGRectMake(0, 0, 200, 100)];
		[webView loadHTMLString:@"<H1>Hello</H1>" baseURL:nil];
		[self addSubview: webView];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setData:(NSDictionary*)levels type:(NSString*)str
{
	NSDictionary *cellDic = [levels objectAtIndex:0];
	NSMutableString *string = [NSMutableString string];
	[string appendFormat:@"%@\n",str];
	for (NSString *keyObj in cellDic) {
		[string appendFormat:@"%@=%@ \n", keyObj, [cellDic objectForKey: keyObj]];
	}
	self.textLabel.text = string;
	self.textLabel.font = [UIFont fontWithName:@"Hevetica" size:14];
	self.textLabel.numberOfLines = 0;
}

- (void)setData:(NSDictionary*)cellDic
{
}

+(id) cellWithStyle:(UITableViewCellStyle)cellStyleInt tableView:(UITableView*) tableView cellDic:(NSDictionary*)cellDic
{
	NSString *CellIdentifier = [self description];
	UpgradeCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];	
	if (cell == nil) {
		cell = [[[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		
	}
	[cell setData:cellDic];			
	return cell;
}

@end

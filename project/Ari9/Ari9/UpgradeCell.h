//
//  UpgradeCell.h
//  Ari9
//
//  Created by 홍준 김 on 12. 3. 5..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpgradeCell : UITableViewCell
- (void)setData:(NSDictionary*)cellDic type:(NSString*)str;
- (void)setData:(NSDictionary*)cellDic;
+(id) cellWithStyle:(UITableViewCellStyle)cellStyleInt tableView:(UITableView*) tableView cellDic:(NSDictionary*)cellDic;
@end

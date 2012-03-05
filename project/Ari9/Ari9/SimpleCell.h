//
//  SimpleCell.h
//  Ari9
//
//  Created by 홍준 김 on 12. 3. 5..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimpleCell : UITableViewCell

- (void)setData:(NSDictionary*)cellDic;
- (void)setData:(NSDictionary*)cellDic type:(NSString*)str;

@end

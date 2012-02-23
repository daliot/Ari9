//
//  VerticalTab.h
//  Ari9
//
//  Created by 홍준 김 on 12. 2. 20..
//  Copyright (c) 2012년 앱달. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerticalTab : UIView{
	NSMutableArray *tabButtons;
}
-(void) addTabButton:(NSString*)titleString tag:(int)anInteger;
@end

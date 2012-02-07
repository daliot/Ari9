//
//  FirstLayer.m
//  Ari9
//
//  Created by 최 민규 on 12. 2. 7..
//  Copyright 2012 앱달. All rights reserved.
//

#import "FirstLayer.h"


@implementation FirstLayer

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init])) {
		
		NSLog(@"first Layer 생성");
		
	}
	return self;
}

@end

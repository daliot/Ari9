//  Created by 오화종 on 10. 12. 11.
//  Copyright 2010 앱달. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "NodeProbingLayer.h"

@interface NodeScaleProbingLayer : NodeProbingLayer {
	CGFloat spriteScaleXWhenTouchBegin;
	CGFloat spriteScaleYWhenTouchBegin;
}

@end

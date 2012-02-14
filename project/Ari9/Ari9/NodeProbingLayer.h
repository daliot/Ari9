//  Created by 오화종 on 10. 12. 11.
//  Copyright 2010 앱달. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



@interface NodeProbingLayer : CCLayer {
	CGPoint touchBeginPosition;
	CCNode *probedNode;
}

-(void) setProbedNode:(CCNode*)aNode;

@end

//
//  LyMatchScreen.h
//  test－刘详刚
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LyMatchScreen : NSObject

//适配后的frame
+(CGRect)realFrame:(CGRect)rect;

//适配后的X
+(CGFloat)realX:(CGFloat)x;

//适配后的Y
+(CGFloat)realY:(CGFloat)y;

//适配后的高
+(CGFloat)realHeight:(CGFloat)height;

//适配后的宽
+(CGFloat)realWidth:(CGFloat)width;

//是配后的point
+(CGPoint)realPoint:(CGPoint)point;

//适配后的size
+(CGSize)realSize:(CGSize)size;
@end

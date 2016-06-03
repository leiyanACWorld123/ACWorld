//
//  LyMatchScreen.m
//  test－刘详刚
//
//  Created by apple on 16/4/15.
//  Copyright © 2016年 雷晏. All rights reserved.
//
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width

#import "LyMatchScreen.h"
@interface LyMatchScreen()
@property (nonatomic,assign) CGFloat autoSizeScaleX;
@property (nonatomic,assign) CGFloat autoSizeScaleY;
@end
@implementation LyMatchScreen

#pragma mark  适配后的frame
+(CGRect)realFrame:(CGRect)rect
{
    rect = [[self alloc]initFrame:rect];
    return rect;
}

-(CGRect)initFrame:(CGRect)rect
{
    rect.origin.x = rect.origin.x * self.autoSizeScaleX;
    rect.origin.y = rect.origin.y * self.autoSizeScaleY;
    
    rect.size.width = rect.size.width * self.autoSizeScaleX;
    rect.size.height = rect.size.height * self.autoSizeScaleY;
    
    return rect;
}

#pragma mark  适配后的x
+(CGFloat)realX:(CGFloat)x
{
    x = [[self alloc]initX:x];
    return x;
}
-(CGFloat)initX:(CGFloat)x
{
    x = x * self.autoSizeScaleX;
    return x;
}

#pragma mark  适配后的y
+(CGFloat)realY:(CGFloat)y
{
    y = [[self alloc]initY:y];
    return y;
}
-(CGFloat)initY:(CGFloat)y
{
    y = y * self.autoSizeScaleY;
    return y;
}

#pragma mark  适配后的height
+(CGFloat)realHeight:(CGFloat)height
{
    height = [[self alloc]initHeight:height];
    return height;
}
-(CGFloat)initHeight:(CGFloat)height
{
    height = height * self.autoSizeScaleY;
    return height;
}

#pragma mark  适配后的width
+(CGFloat)realWidth:(CGFloat)width
{
    width = [[self alloc]initWidth:width];
    return width;
}

-(CGFloat)initWidth:(CGFloat)width
{
    width = width * self.autoSizeScaleX;
    return width;
}

#pragma mark 适配后的point
+(CGPoint)realPoint:(CGPoint)point
{
    return [[self alloc]initPoint:point];
}

-(CGPoint)initPoint:(CGPoint)point
{
    point.x = point.x * self.autoSizeScaleX;
    point.y = point.y * self.autoSizeScaleY;
    return point;
}

#pragma mark 适配后的size
+(CGSize)realSize:(CGSize)size
{
    return [[self alloc]initSize:size];
}

-(CGSize)initSize:(CGSize)size
{
    size.width  = size.width * self.autoSizeScaleX;
    size.height = size.height * self.autoSizeScaleY;
    return size;
}
#pragma mark Get方法
-(CGFloat)autoSizeScaleX
{
    if(ScreenHeight > 480){
        _autoSizeScaleX = ScreenWidth/ScreenWidth;
    }else{
        _autoSizeScaleX = 1.0;
    }
    return _autoSizeScaleX;
}
-(CGFloat)autoSizeScaleY
{
    if(ScreenHeight > 480){
        _autoSizeScaleY = ScreenHeight/ScreenHeight;
    }else{
        _autoSizeScaleY = 1.0;
    }
    return _autoSizeScaleY;
}



@end

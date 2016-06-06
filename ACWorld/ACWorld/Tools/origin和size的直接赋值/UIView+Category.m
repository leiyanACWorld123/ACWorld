//
//  UIView+Category.m
//  仿QQ音乐播放器
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "UIView+Category.h"
#import <objc/message.h>

@implementation UIView (Category)
//
//@dynamic x;
//@dynamic y;
//@dynamic width;
//@dynamic height;
//@dynamic origin;
//@dynamic size;

#pragma mark ---------------- Setters-----------------
-(void)setX:(CGFloat)x{
    objc_setAssociatedObject(self, "x", @(x), OBJC_ASSOCIATION_ASSIGN);
    
    CGRect r        = self.frame;
    r.origin.x      = x;
    self.frame      = r;
}

-(void)setY:(CGFloat)y{
    objc_setAssociatedObject(self, "y", @(y), OBJC_ASSOCIATION_ASSIGN);
    CGRect r        = self.frame;
    r.origin.y      = y;
    self.frame      = r;
}

-(void)setWidth:(CGFloat)width{
    objc_setAssociatedObject(self, "width", @(width), OBJC_ASSOCIATION_ASSIGN);
    
    CGRect r        = self.frame;
    r.size.width    = width;
    self.frame      = r;
}

-(void)setHeight:(CGFloat)height{
    objc_setAssociatedObject(self, "height", @(height), OBJC_ASSOCIATION_ASSIGN);
    CGRect r        = self.frame;
    r.size.height   = height;
    self.frame      = r;
}

-(void)setOrigin:(CGPoint)origin{
    objc_setAssociatedObject(self, "origin",[NSValue valueWithCGPoint:origin], OBJC_ASSOCIATION_ASSIGN);

    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    objc_setAssociatedObject(self, "size",[NSValue valueWithCGSize:size], OBJC_ASSOCIATION_ASSIGN);
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    objc_setAssociatedObject(self, "right", @(right), OBJC_ASSOCIATION_ASSIGN);

    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

-(void)setButtom:(CGFloat)buttom {
    objc_setAssociatedObject(self, "bottom", @(buttom), OBJC_ASSOCIATION_ASSIGN);

    CGRect frame = self.frame;
    frame.origin.y = buttom - frame.size.height;
    self.frame = frame;
}

-(void)setCenterX:(CGFloat)centerX {
    objc_setAssociatedObject(self, "centerX", @(centerX), OBJC_ASSOCIATION_ASSIGN);
    self.center = CGPointMake(centerX, self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    objc_setAssociatedObject(self, "centerY", @(centerY), OBJC_ASSOCIATION_ASSIGN);
    self.center = CGPointMake(self.center.x, centerY);
}

#pragma mark ---------------- Getters-----------------
-(CGFloat)x{
    
    return self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGPoint)origin{
    
    return CGPointMake([objc_getAssociatedObject(self, "x") floatValue], [objc_getAssociatedObject(self, "y") floatValue]);
}

-(CGSize)size{
    return CGSizeMake([objc_getAssociatedObject(self, "width") floatValue], [objc_getAssociatedObject(self, "height") floatValue]);
}

-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)buttom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(CGFloat)centerY {
    return self.center.y;
}

#pragma mark ---------------- other-----------------
/**
 * @brief 移除此view上的所有子视图
 */
- (void)removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    return;
}

@end

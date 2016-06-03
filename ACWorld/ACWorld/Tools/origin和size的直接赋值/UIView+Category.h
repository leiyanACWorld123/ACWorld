//
//  UIView+Category.h
//  仿QQ音乐播放器
//
//  Created by apple on 16/5/5.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Category)
@property (nonatomic,assign) CGFloat x;
@property (nonatomic,assign) CGFloat y;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,assign) CGPoint origin;
@property (nonatomic,assign) CGSize  size;
@property (nonatomic,assign) CGFloat buttom;
@property (nonatomic,assign) CGFloat right;
@property (nonatomic,assign) CGFloat centerX;
@property (nonatomic,assign) CGFloat centerY;



- (void)removeAllSubviews;

@end

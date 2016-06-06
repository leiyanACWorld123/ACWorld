//
//  PopMenu.m
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "PopMenu.h"

@implementation PopMenu

+(void)showIn:(UIView *)view{
    NSLog(@"%@",view);
//    CAGradientLayer *gradientlayer = [CAGradientLayer layer];
//    gradientlayer.frame = [LyMatchScreen realFrame:CGRectMake(0, 0, view.width, 587 * 0.5+5)];
//    gradientlayer.startPoint = CGPointMake(0, 0);
//    gradientlayer.endPoint = CGPointMake(0, 1);
//    gradientlayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
//                             (__bridge id)[UIColor lightGrayColor].CGColor];
//    gradientlayer.locations = @[@(0.95f),@(1.f)];
//    [view.layer addSublayer:gradientlayer];

    UIView *mainView = [UIView new];
    mainView.frame = [LyMatchScreen realFrame:CGRectMake(0, 0,view.width, 587 * 0.5)];
    mainView.backgroundColor = ly_color(237, 237, 237);
    mainView.layer.shadowOffset = CGSizeMake(0, 5);
    mainView.layer.shadowColor = [UIColor blackColor].CGColor;
    mainView.layer.shadowOpacity = 0.5f;//阴影透明度
    [view addSubview:mainView];
//    CAShapeLayer *shapelayer = [CAShapeLayer layer];
//    shapelayer.frame = [LyMatchScreen realFrame:CGRectMake(0, mainView.height, mainView.width, 10)];
//    [view.layer addSublayer:shapelayer];
    
 
}

-(void)dealloc
{
    
}
@end

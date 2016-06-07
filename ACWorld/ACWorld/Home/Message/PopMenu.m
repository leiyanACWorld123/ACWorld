//
//  PopMenu.m
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "PopMenu.h"
#define RANDOM_COLOR [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1]
#define mainView_Height 520 * 0.5
@implementation PopMenu

//+(void)showIn:(UIView *)view delegate:(id<PopMenuDelegate>)delegate{
//    return [[self alloc]initIn:view delegate:delegate];
//}

-(void)showIn:(UIView *)view delegate:(id<PopMenuDelegate>)delegate{
    
    self.delegate = delegate;
    
    UIView *mainView = [UIView new];
    mainView.frame = [LyMatchScreen realFrame:CGRectMake(0, 64 - 520 * 0.5,view.width, mainView_Height)];
    mainView.backgroundColor = ly_color(237, 237, 237);
    mainView.layer.shadowOffset = CGSizeMake(0, 5);
    mainView.layer.shadowColor = [UIColor blackColor].CGColor;
    mainView.layer.shadowOpacity = 0.5f;//阴影透明度
    [view addSubview:mainView];
    
    CGFloat w = mainView.width / 3 ;
    CGFloat h = mainView.height / 2 ;
    CGFloat x;
    CGFloat y;
    
    for(int i = 0 ; i < 6 ; i++){
        x =(i % 3) * w;
        y =(i / 3) * h;
        
        UIView *btnView = [UIView new];
        btnView.userInteractionEnabled = YES;
        btnView.frame = [LyMatchScreen realFrame:CGRectMake(x, y, w, h)];
        btnView.backgroundColor = [UIColor clearColor];
        btnView.tag = i;
        [mainView addSubview:btnView];
        [self setUpUI:btnView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGR:)];
        [btnView addGestureRecognizer:tap];

    }
    
    [UIView animateWithDuration:0.5f delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        mainView.transform = CGAffineTransformMakeTranslation(0, mainView_Height);
    } completion:^(BOOL finished) {
        
    }];
}


+(void)hideIn:(UIView *)view{
    [UIView animateWithDuration:0.35f animations:^{
        view.subviews[0].transform = CGAffineTransformMakeTranslation(0, -mainView_Height);
    } completion:^(BOOL finished) {
        [view.subviews[0] removeFromSuperview];
    }];
}


-(void)setUpUI:(UIView *)btnView{
    NSInteger temp = 0;
    if(btnView.tag / 3  == 0){
        temp = 0;
    }else{
        temp = 10;
    }
    
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.center = CGPointMake(btnView.width / 2 - (btnView.width - 50)/2, 22 - temp);
    imgView.size = CGSizeMake(btnView.width - 50, btnView.width - 50);
    imgView.image = [MyUtil createImageFromColor:RANDOM_COLOR];
    imgView.layer.cornerRadius = imgView.size.width / 2;
    imgView.layer.masksToBounds = YES;
    imgView.tag = btnView.tag;
    [btnView addSubview:imgView];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @[@"相册",@"视频聊天",@"位置",@"AC币",@"相机",@"更多"][btnView.tag];
    CGFloat fontHeight = [titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.f]}].height;
    titleLabel.frame = CGRectMake(0, btnView.height - fontHeight-temp, btnView.width, fontHeight);
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [btnView addSubview:titleLabel];
}


-(void)tapGR:(UITapGestureRecognizer *)tap
{
    switch (tap.view.tag) {
        case 0:
            if([self.delegate respondsToSelector:@selector(centerPhotos:)]){
                [self.delegate centerPhotos:self];
            }
            break;
        case 1:
            if([self.delegate respondsToSelector:@selector(centerAVChart:)]){
                [self.delegate centerAVChart:self];
            }
            break;
        case 2:
            if([self.delegate respondsToSelector:@selector(centerPosition:)]){
                [self.delegate centerPosition:self];
            }
            break;
        case 3:
            if([self.delegate respondsToSelector:@selector(centerACMemony:)]){
                [self.delegate centerACMemony:self];
            }
            break;
        case 4:
            if([self.delegate respondsToSelector:@selector(centerCamera:)]){
                [self.delegate centerCamera:self];
            }
            break;
        case 5:
            if([self.delegate respondsToSelector:@selector(centerMore:)]){
                [self.delegate centerMore:self];
            }
            break;
        default:
            break;
    }
}
@end

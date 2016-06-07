//
//  MessageChattingViewController.m
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MessageChattingViewController.h"
#import "PopMenu.h"

@interface MessageChattingViewController ()<PopMenuDelegate>
{
    BOOL _isOpen;
}

@property (nonatomic,strong) PopMenu *popMenu;

@end

@implementation MessageChattingViewController
-(instancetype)init
{
    if(self = [super init]){
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"赵本山";
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.rightBarButtonItem = [MyUtil rightBarButtonTarget:self action:@selector(popView)];
    self.navigationItem.leftBarButtonItems = [MyUtil leftBarButtonTarget:self action:@selector(back) type:UIBarButtonItemLeftTypeDouble];
    
    //修改导航栏头像
    [self.navigationItem.leftBarButtonItems[1].customView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UIImageView class]]){
            UIImageView *img = (UIImageView *)obj;
            img.image = [MyUtil createImageFromColor:[UIColor blueColor]];
        }
    }];
}

-(void)popView{
    
    _isOpen = !_isOpen;
    
    if(!_popMenu){
        _popMenu = [[PopMenu alloc]init];
    }
    
    _isOpen == YES ? [_popMenu showIn:self.view delegate:self] : [PopMenu hideIn:self.view];
}


#pragma -mark PopMenu Delegate
-(void)centerPhotos:(PopMenu *)popMenu{
    NSLog(@"相册");
}

-(void)centerAVChart:(PopMenu *)popMenu{
    NSLog(@"视频聊天");
}

-(void)centerPosition:(PopMenu *)popMenu{
    NSLog(@"位置");
}

-(void)centerACMemony:(PopMenu *)popMenu{
    NSLog(@"AC币");
}

-(void)centerCamera:(PopMenu *)popMenu{
    NSLog(@"相机");
}

-(void)centerMore:(PopMenu *)popMenu{
    NSLog(@"更多");
}


#pragma -mark back

-(void)back{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

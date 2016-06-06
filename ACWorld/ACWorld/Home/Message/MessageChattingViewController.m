//
//  MessageChattingViewController.m
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MessageChattingViewController.h"
#import "PopMenu.h"

@interface MessageChattingViewController ()

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
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.bounds = CGRectMake(0, 0, 42, 42);
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -42);
    [button setTitle:@"+" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    [button addTarget:self action:@selector(popView) forControlEvents:UIControlEventTouchUpInside];
}

-(void)popView{
    [PopMenu showIn:self.view];
}
@end

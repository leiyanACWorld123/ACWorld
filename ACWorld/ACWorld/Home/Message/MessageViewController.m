//
//  MessageViewController.m
//  ACWorld
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MessageViewController.h"

@interface MessageViewController ()

@end

@implementation MessageViewController
-(instancetype)init
{
    if(self = [super init]){
        self.view.backgroundColor = [UIColor whiteColor];
        self.title = @"消息";

    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableview = [[UITableView alloc]init];
    [self.view addSubview:tableview];
    [tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 44, 0));
    }];
}

@end

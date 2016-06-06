//
//  MessageViewController.m
//  ACWorld
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MessageViewController.h"
#import "MessageCell.h"
#import "MessageChattingViewController.h"

@interface MessageViewController ()<UITableViewDataSource,UITableViewDelegate>

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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    tableview.tableFooterView = [UIView new];
    tableview.dataSource = self;
    tableview.delegate = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(!cell){
        cell = [[MessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [LyMatchScreen realHeight:95];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    MessageChattingViewController *chatVC = [[MessageChattingViewController alloc]init];
    chatVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatVC animated:YES];
}
@end

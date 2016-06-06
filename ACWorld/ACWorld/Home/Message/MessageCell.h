//
//  MessageCell.h
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageCell : UITableViewCell

//头像
@property (nonatomic,strong) UIImageView *headerIcon;
//名字
@property (nonatomic,strong) UILabel *name;
//内容
@property (nonatomic,strong) UILabel *content;
//发送时间
@property (nonatomic,strong) UILabel *time;

@end

//
//  MessageCell.m
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MessageCell.h"

@implementation MessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        _headerIcon = [[UIImageView alloc]init];
        [self.contentView addSubview:_headerIcon];
        _headerIcon.layer.cornerRadius = 40;
        _headerIcon.layer.masksToBounds = YES;
        _headerIcon.image = [MyUtil createImageFromColor:[UIColor redColor] imgSize:CGSizeMake(1, 1)];
        
        _name = [[UILabel alloc]init];
        _name.font = [UIFont systemFontOfSize:20.f];
        [self.contentView addSubview:_name];
        _name.text = @"赵本山";
        
        _content = [[UILabel alloc]init];
        _content.font = [UIFont systemFontOfSize:20.f];
        [self.contentView addSubview:_content];
        _content.text = @"今天你去那里了啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
        
        _time = [[UILabel alloc]init];
        [self.contentView addSubview:_time];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    [_headerIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(5);
        make.bottom.mas_equalTo(-5);
        make.width.mas_equalTo(80);
    }];
    
    [_name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headerIcon.mas_right).offset(10);
        make.top.mas_equalTo(10);
    }];
    
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_name);
        make.bottom.mas_equalTo(-10);
        make.width.mas_equalTo(self.width - 100);
    }];
}
@end

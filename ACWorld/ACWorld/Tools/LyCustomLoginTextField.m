//
//  LyCustomLoginTextField.m
//  ACWorld
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LyCustomLoginTextField.h"
#import "UIView+Category.h"

@implementation LyCustomLoginTextField

+(LyCustomLoginTextField *)underSingleTextField:(CGRect)frame{
    
    return [[self alloc]initUnderSingleTextField:frame];
}

-(LyCustomLoginTextField *)initUnderSingleTextField:(CGRect)frame{
    LyCustomLoginTextField *bgView = [LyCustomLoginTextField new];
    bgView.frame = frame;
    
    UITextField *textfield = [UITextField new];
    _textfield = textfield;
    textfield.frame = CGRectMake(0, 0,frame.size.width,frame.size.height-1);
    [bgView addSubview:textfield];
    
    UIView *line = [UIView new];
    line.frame = CGRectMake(0, textfield.height,frame.size.width, 1);
    line.backgroundColor = [UIColor lightGrayColor];
    [bgView addSubview:line];
    return bgView;
}

-(void)setPlaceholder:(NSString *)placeholder{
    _placeholder = placeholder;
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if([obj isKindOfClass:[UITextField class]]){
            UITextField *textfield = (UITextField *)obj;
            textfield.placeholder = placeholder;
        }
    }];
}

@end

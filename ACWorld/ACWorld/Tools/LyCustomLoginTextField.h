//
//  LyCustomLoginTextField.h
//  ACWorld
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LyCustomLoginTextField : UIView

@property (nonatomic,weak) UITextField *textfield;

@property (nonatomic,copy) NSString *placeholder;

/**
 *  自定义下划线输入框
 *
 *  @param frame <#frame description#>
 *
 *  @return <#return value description#>
 */
+(LyCustomLoginTextField *)underSingleTextField:(CGRect)frame;

@end

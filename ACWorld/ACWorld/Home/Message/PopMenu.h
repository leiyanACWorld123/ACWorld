//
//  PopMenu.h
//  ACWorld
//
//  Created by apple on 16/6/6.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PopMenu;

@protocol PopMenuDelegate <NSObject>

//相册功能
-(void)centerPhotos:(PopMenu *)popMenu;

//视频聊天
-(void)centerAVChart:(PopMenu *)popMenu;

//位置
-(void)centerPosition:(PopMenu *)popMenu;

//AC币
-(void)centerACMemony:(PopMenu *)popMenu;

//相机功能
-(void)centerCamera:(PopMenu *)popMenu;

//更多功能
-(void)centerMore:(PopMenu *)popMenu;

@end
@interface PopMenu : UIView

//显示
-(void)showIn:(UIView *)view delegate:(id<PopMenuDelegate>)delegate;

//消失
+(void)hideIn:(UIView *)view;

@property (nonatomic,assign) id<PopMenuDelegate>delegate;

@end

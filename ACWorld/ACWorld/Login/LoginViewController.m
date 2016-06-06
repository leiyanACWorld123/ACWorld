//
//  LoginViewController.m
//  ACWorld
//
//  Created by apple on 16/6/1.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "LoginViewController.h"
#import "LyCustomLoginTextField.h"
#import "MyTabBarController.h"
#import "NSObject+Model.h"

#import "UMSocial.h"

static NSInteger count = 30;

@interface LoginViewController ()
{
    NSTimer *_timer;
}

@property (weak, nonatomic) UIButton *getPassBtn;

@end


@implementation LoginViewController

-(instancetype)init{
    if(self = [super init]){
        self.view.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
}

/**
 *  界面UI
 */
-(void)setUpUI{
    UIImageView *iconView = [[UIImageView alloc]init];
    [self.view addSubview:iconView];
    iconView.backgroundColor = [UIColor redColor];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(480 * 0.5);
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.textColor = [UIColor lightGrayColor];
    titleLabel.text = @"验证手机号登录";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:19.f];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView.mas_bottom).offset(0);
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(30);
    }];
    
   LyCustomLoginTextField *phoneText = [LyCustomLoginTextField underSingleTextField:[LyMatchScreen realFrame:CGRectMake(20, 480 * 0.5 + 30 + 30, 200, 30)]];
    phoneText.placeholder = @"输入手机号";
    [self.view addSubview:phoneText];
    
    LyCustomLoginTextField *passText = [LyCustomLoginTextField underSingleTextField:[LyMatchScreen realFrame:CGRectMake(20, phoneText.y+phoneText.height+20, 200, 30)]];
    passText.placeholder = @"输入验证码";
    [self.view addSubview:passText];
    
    UIButton *getPassBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _getPassBtn = getPassBtn;
    [self.view addSubview:getPassBtn];
    [getPassBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getPassBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    getPassBtn.layer.borderWidth = 1.f;
    getPassBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [getPassBtn addTarget:self action:@selector(getPass:) forControlEvents:UIControlEventTouchUpInside];
    [getPassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneText.mas_right).offset(20);
        make.top.equalTo(phoneText);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(34);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20.f];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[MyUtil createImageFromColor:[UIColor colorWithRed:92/255.0 green:9/255.0 blue:16/255.0 alpha:1] imgSize:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    loginBtn.layer.cornerRadius = 5.f;
    loginBtn.layer.masksToBounds = YES;
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(normalLogin) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(passText.mas_bottom).offset(34);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(150, 50));
    }];
    
    //
    UIButton *figureLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [figureLoginBtn setTitle:@"申请指纹登录" forState:UIControlStateNormal];
    figureLoginBtn.titleLabel.font = [UIFont systemFontOfSize:20.f];
    [figureLoginBtn setTitleColor:[UIColor colorWithRed:92/255.0 green:9/255.0 blue:16/255.0 alpha:1] forState:UIControlStateNormal];
    [self.view addSubview:figureLoginBtn];
    [figureLoginBtn addTarget:self action:@selector(figureLogin) forControlEvents:UIControlEventTouchUpInside];
    [figureLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginBtn.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(self.view.width, 30));
    }];
    
    UIView *buttomView = [UIView new];
    [self.view addSubview:buttomView];
    [buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(figureLoginBtn.mas_bottom).offset(25);
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    UILabel *buttomTitle = [[UILabel alloc]init];
    buttomTitle.text = @"第三方账号登录";
    buttomTitle.textAlignment = NSTextAlignmentCenter;
    buttomTitle.textColor = [UIColor colorWithRed:92/255.0 green:9/255.0 blue:16/255.0 alpha:1];
    [buttomView addSubview:buttomTitle];
    [buttomTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(buttomView);
        make.top.mas_equalTo(0);
        make.width.equalTo(buttomView.mas_width).dividedBy(3);
        make.height.equalTo(buttomView);
    }];
    
    for(int i=0;i<2;i++){
        UIView *line = [UIView new];
        line.backgroundColor = [UIColor colorWithRed:92/255.0 green:9/255.0 blue:16/255.0 alpha:1];
        [buttomView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(buttomView);
            make.height.mas_equalTo(1);
            make.width.equalTo(buttomView.mas_width).dividedBy(4);
            i==0?make.left.equalTo(buttomView.mas_left).offset(0):make.right.equalTo(buttomView.mas_right).offset(0);
        }];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setTitle:@[@"QQ",@"微信"][i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button addTarget:self action:@selector(otherLogin:) forControlEvents:UIControlEventTouchUpInside];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(buttomView.mas_bottom).offset(30);
            make.left.equalTo(self.view.mas_left).offset((self.view.width / 4) * (1+i*2) - 25);
            make.size.mas_offset(CGSizeMake(50, 50));
        }];
    }
    
    
    
}

-(void)getPass:(UIButton *)btn{
    [MyUtil showMessage:@"发送成功"];
    btn.enabled = NO;
    [btn setTitle:[NSString stringWithFormat:@"%lds",(long)count] forState:UIControlStateNormal];
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
}

-(void)countDown{
    count--;
    if(count == 0){
        [_timer invalidate];
        _getPassBtn.enabled = YES;
    }else{
        [_getPassBtn setTitle:[NSString stringWithFormat:@"%lds",(long)count] forState:UIControlStateNormal];
    }
}


#pragma mark - 正常登录
-(void)normalLogin{
    MyTabBarController *TabBarController = [[MyTabBarController alloc]init];
    [self presentViewController:TabBarController animated:YES completion:nil];
}

#pragma mark - 指纹登录
-(void)figureLogin{
    
}

#pragma mark - 第三方登录（qq，微信）
-(void)otherLogin:(UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self qqLogin];
            break;
        case 1:
            [self weixinLogin];
            break;
    
        default:
            break;
    }
}

//qq登录
-(void)qqLogin{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQQ];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        //          获取微博用户名、uid、token等
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
            
        }});
}

//微信登录
-(void)weixinLogin{
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToWechatSession];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:snsPlatform.platformName];
            NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n, message = %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse, response.message);
        }
    });
}
@end

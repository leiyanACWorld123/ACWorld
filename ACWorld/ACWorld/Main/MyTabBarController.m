//
//  MyTabBarController.m
//  ACWorld
//
//  Created by apple on 16/6/3.
//  Copyright © 2016年 雷晏. All rights reserved.
//

#import "MyTabBarController.h"
#import "MessageViewController.h"
#import "WorldViewController.h"
#import "MeetingViewController.h"
#import "MineViewController.h"

@interface MyTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MyTabBarController

-(instancetype)init
{
    if(self = [super init]){
        self.tabBar.barTintColor = [UIColor whiteColor];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
        
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MessageViewController *messageVC = [[MessageViewController alloc]init];
    UINavigationController *messageNav = [[UINavigationController alloc]initWithRootViewController:messageVC];
    messageNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"消息" image:[UIImage imageNamed:@"1-normal"] selectedImage:[UIImage imageNamed:@"1-select"]];

    
    WorldViewController *worldVC = [[WorldViewController alloc]init];
    UINavigationController *worldNav = [[UINavigationController alloc]initWithRootViewController:worldVC];
    worldNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"世界" image:[UIImage imageNamed:@"1-normal"] selectedImage:[UIImage imageNamed:@"1-select"]];

    MeetingViewController *meetingVC = [[MeetingViewController alloc]init];
    UINavigationController *meetingNav = [[UINavigationController alloc]initWithRootViewController:meetingVC];
    meetingNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"遇见" image:[UIImage imageNamed:@"1-normal"] selectedImage:[UIImage imageNamed:@"1-select"]];

    MineViewController *mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    mineNav.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"我的" image:[UIImage imageNamed:@"1-normal"] selectedImage:[UIImage imageNamed:@"1-select"]];

    self.viewControllers = @[messageNav,worldNav,meetingNav,mineNav];
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    NSLog(@"%@",viewController.title);
}

@end

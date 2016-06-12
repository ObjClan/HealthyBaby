//
//  HBTabBarController.m
//  HealthyBaby
//
//  Created by jszx on 16/5/31.
//  Copyright © 2016年 objectlan. All rights reserved.
//

#import "HBTabBarController.h"
#import "HBHomeNavVC.h"
#import "HBMineNavVC.h"

@interface HBTabBarController ()

@end

@implementation HBTabBarController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addTabBar];
    }
    return self;
}
- (void)addTabBar
{
    HBHomeNavVC *homeNavVC = [HBHomeNavVC new];
    
    UITabBarItem *homeItem = [[UITabBarItem alloc] init];
    [homeItem setImage:[[UIImage imageNamed:@"home.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [homeItem setSelectedImage:[[UIImage imageNamed:@"home_select.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    homeItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    homeNavVC.tabBarItem = homeItem;
    
    HBMineNavVC *mineNavVC = [HBMineNavVC new];
    UITabBarItem *myItem = [[UITabBarItem alloc] init];
    [myItem setImage:[[UIImage imageNamed:@"mine.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [myItem setSelectedImage:[[UIImage imageNamed:@"mine_select.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    myItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    mineNavVC.tabBarItem = myItem;
    
    self.viewControllers = @[homeNavVC,mineNavVC];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

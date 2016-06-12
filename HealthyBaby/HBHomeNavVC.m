//
//  HBHomeNavVC.m
//  HealthyBaby
//
//  Created by jszx on 16/5/31.
//  Copyright © 2016年 objectlan. All rights reserved.
//

#import "HBHomeNavVC.h"
#import "HBHomeViewController.h"


@interface HBHomeNavVC ()

@end

@implementation HBHomeNavVC

- (instancetype)init
{
    self = [super initWithRootViewController:[HBHomeViewController new]];
    if (self) {
//        self.navigationBar.barTintColor = [UIColor orangeColor];
        
    }
    return self;
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

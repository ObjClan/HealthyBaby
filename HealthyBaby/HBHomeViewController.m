//
//  HBHomeViewController.m
//  HealthyBaby
//
//  Created by jszx on 16/5/31.
//  Copyright © 2016年 objectlan. All rights reserved.
//

#import "HBHomeViewController.h"
#import "BLKDelegateSplitter.h"
#import "HBHomeBar.h"
#import "HBBannerView.h"

@interface HBHomeViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,HBBannerViewDelegate>
@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic,strong)BLKDelegateSplitter *delegateSplitter;
@property(nonatomic,strong)HBHomeBar *homeNavBar;
@property(nonatomic,strong)HBBannerView *bannerView;
@property(nonatomic,assign)BOOL isInitTableViewOffset;
@end

@implementation HBHomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.tableView = [[UITableView alloc] init];
//    self.tableView.indicatorStyle=UIScrollViewIndicatorStyleBlack;
//    self.tableView.separatorStyle=NO;
   
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.homeNavBar = [[HBHomeBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 64)];
    self.homeNavBar.userInteractionEnabled = NO;
    self.navigationController.navigationBar.hidden = YES;
    self.delegateSplitter = [[BLKDelegateSplitter alloc] initWithFirstDelegate:self.homeNavBar.behaviorDefiner secondDelegate:self];
    self.tableView.delegate = (id<UITableViewDelegate>)self.delegateSplitter;
    [self.view addSubview:self.homeNavBar];
    
    self.tableView.frame = CGRectMake(0, -20, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    
    self.bannerView = [[HBBannerView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), HBHomeBannerHeight)];
    self.bannerView.homeBannerDelegate = self;
    
    [self.bannerView updateBannerImages:[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"1.png"],[UIImage imageNamed:@"2.png"],[UIImage imageNamed:@"3.png"], nil]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 100;
    } else {
        return 1;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *bannerCellId = @"bannerCellId";
    static NSString *contentCellId = @"contentCellId";
    
    UITableViewCell *cell = nil;
    
    
    switch (indexPath.section) {
        case 0:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:bannerCellId];
            if (!cell) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bannerCellId];
                
                [cell.contentView addSubview:self.bannerView];
                
            }
            
            break;
        }
        case 1:
            cell = [UITableViewCell new];
            break;
        case 2:
        {
            cell = [tableView dequeueReusableCellWithIdentifier:contentCellId];
            if (!cell) {
                
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contentCellId];
                UIImageView *iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon.png"]];
                iconImageView.frame = CGRectMake(10, 0, 40, 40);
                [cell.contentView addSubview:iconImageView];
                
                UILabel *usernameLab = [UILabel new];
                usernameLab.text = @"大内高手";
                usernameLab.font = [UIFont systemFontOfSize:16];
                usernameLab.frame = CGRectMake(CGRectGetMaxX(iconImageView.frame) + 10, CGRectGetMinY(iconImageView.frame), 100, 20);
                
                UILabel *distanceLab = [UILabel new];
                distanceLab.text = @"100m";
                distanceLab.font = [UIFont systemFontOfSize:14];
                distanceLab.textColor = [UIColor grayColor];
                distanceLab.frame = CGRectMake(CGRectGetMaxX(usernameLab.frame) + 20, 0, 60, 20);
                [cell.contentView addSubview:distanceLab];
                
                [cell.contentView addSubview:usernameLab];
                
                UILabel *statusLab = [UILabel new];
                statusLab.text = @"感冒，发烧，健康";
                statusLab.textColor = [UIColor grayColor];
                statusLab.frame = CGRectMake(CGRectGetMaxX(iconImageView.frame) + 10, CGRectGetMaxY(distanceLab.frame) + 5, 100, 20);
                [cell.contentView addSubview:statusLab];
                
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            
            break;
        }
            
        default:
            break;
    }
    
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    switch (indexPath.section) {
        case 0:
            height = HBHomeBannerHeight;
            break;
        case 1:
            height = 64;
            break;
        default:
            height = 80;
            break;
    }
    return height;
}

/**
 *  设置tableViewOffset,一定要在tableView数据加载完成后调用
 */

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == ((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row){
        //设置tableViewOffset,一定要在tableView数据加载完成后调用
        if (!self.isInitTableViewOffset) {
            self.isInitTableViewOffset = YES;
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UITableViewScrollPositionNone animated:NO];
        }
        
    }
}

-(void)clickBanner:(int)pageIndex
{
    NSLog(@"%d",pageIndex);
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

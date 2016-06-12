//
//  HBBannerView.h
//  HealthyBaby
//
//  Created by jszx on 16/5/31.
//  Copyright © 2016年 objectlan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HBBannerViewDelegate <NSObject>

-(void)clickBanner:(int)pageIndex;

@end

@interface HBBannerView : UIView

@property(nonatomic,strong)id<HBBannerViewDelegate> homeBannerDelegate;

//设置图片对象（UIImage）,有多少页就设置多少图片
@property(nonatomic, strong, readwrite) NSArray *images;
//返回当前的展示的页码
@property(nonatomic, assign, readonly)  NSInteger currentPage;

//设置timer的轮播间隔时间
@property(nonatomic, assign, readwrite)NSTimeInterval timerInterval;

//点击的时候返回
- (void)clickAction:(void (^)(NSInteger pageIndex))click;
//timer开始与停止
- (void)start;
- (void)stop;

-(void)updateBannerImages:(NSMutableArray*)imageUrls;

-(void)removeCachedImage;
@end

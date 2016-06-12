//
//  HBBannerCoverView.m
//  HealthyBaby
//
//  Created by jszx on 16/6/1.
//  Copyright © 2016年 objectlan. All rights reserved.
//

#import "HBBannerCoverView.h"

@implementation HBBannerCoverView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)drawRect:(CGRect)rect {
    CGFloat coverHeight = 32;
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 矩形
    CGRect Rect= CGRectMake(0, HBHomeBannerHeight - coverHeight/2.0, HBScreenWidth, coverHeight/2.0);
    CGContextSetLineWidth(context, 0);
    CGContextAddRect(context, Rect);
    CGContextClosePath(context);
    //填充颜色
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
    
    // 画椭圆
    CGRect aRect= CGRectMake(-10, HBHomeBannerHeight - coverHeight, HBScreenWidth + 20, coverHeight);
    CGContextSetRGBStrokeColor(context, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(context, 0);
    CGContextAddEllipseInRect(context, aRect);
    CGContextClosePath(context);
    //填充颜色
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillPath(context);
}

@end

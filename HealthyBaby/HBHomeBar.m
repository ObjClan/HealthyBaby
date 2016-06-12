//
//  HBHomeBar.m
//  HealthyBaby
//
//  Created by jszx on 16/5/31.
//  Copyright © 2016年 objectlan. All rights reserved.
//

#import "HBHomeBar.h"
#import "SquareCashStyleBehaviorDefiner.h"
#import "HBNavView.h"

@implementation HBHomeBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addViews];
        
        SquareCashStyleBehaviorDefiner *behaviorDefiner = [[SquareCashStyleBehaviorDefiner alloc] init];
        [behaviorDefiner addSnappingPositionProgress:0.0 forProgressRangeStart:0.0 end:0.5];
        [behaviorDefiner addSnappingPositionProgress:1.0 forProgressRangeStart:0.5 end:1.0];
        behaviorDefiner.snappingEnabled = YES;
        behaviorDefiner.elasticMaximumHeightAtTop = NO;
        self.behaviorDefiner = behaviorDefiner;
    }
    return self;
}

- (void)addViews
{
    self.maximumBarHeight = 64;
    self.minimumBarHeight = 0;
    
    HBNavView *navView = [[HBNavView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), self.maximumBarHeight)];
    navView.backgroundColor = [UIColor orangeColor];
    
    {
    
        BLKFlexibleHeightBarSubviewLayoutAttributes *initLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
        initLayoutAttributes.frame=CGRectMake(0,0, CGRectGetWidth(self.frame), self.maximumBarHeight);
        initLayoutAttributes.alpha=0;
        [navView addLayoutAttributes:initLayoutAttributes forProgress:0.0];
    
        BLKFlexibleHeightBarSubviewLayoutAttributes *middleLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
        middleLayoutAttributes.alpha=0.5;
        middleLayoutAttributes.frame = CGRectMake(0,0, CGRectGetWidth(self.frame), self.maximumBarHeight);
        [navView addLayoutAttributes:middleLayoutAttributes forProgress:0.5];
    
        BLKFlexibleHeightBarSubviewLayoutAttributes *finalLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] init];
        finalLayoutAttributes.frame = CGRectMake(0,0, CGRectGetWidth(self.frame), self.maximumBarHeight);
        finalLayoutAttributes.alpha=1;
        [navView addLayoutAttributes:finalLayoutAttributes forProgress:1.0];
    }
    
    [self addSubview:navView];
}
@end

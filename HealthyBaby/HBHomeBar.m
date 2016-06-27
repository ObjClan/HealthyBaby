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

@interface HBHomeBar()
@property(nonatomic, strong)UIButton *searchBtn;
@property(nonatomic, strong)UIView *locationView;
@property(nonatomic, strong)UIImageView *locationImageView;
@property(nonatomic, strong)UILabel *locationLab;
@property(nonatomic, strong)UIImageView *arrowView;
@end
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
        
        [self addObserver:self forKeyPath:@"progress" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
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
    
    self.searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(280, 30, 25, 25)];
    [self.searchBtn setImage:[UIImage imageNamed:@"search1.png"] forState:UIControlStateNormal];
    
    [self addSubview:self.searchBtn];
    
    self.locationView = [UIView new];
    self.locationView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    self.locationView.layer.cornerRadius = 12.5;
    self.locationView.frame = CGRectMake(100, 30, 130, 25);
    [self addSubview:self.locationView];
    
    self.locationImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"location1.png"]];
    self.locationImageView.frame = CGRectMake(5, 3, 20, 20);
    [self.locationView addSubview:self.locationImageView];
    
    self.locationLab = [UILabel new];
    self.locationLab.text = @"蜀都中心";
    self.locationLab.textColor = [UIColor whiteColor];
    self.locationLab.frame = CGRectMake(CGRectGetMaxX(self.locationImageView.frame) + 2, 0, 68, CGRectGetHeight(self.locationView.frame));
    [self.locationView addSubview:self.locationLab];
    
    self.arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"arrow1.png"]];
    self.arrowView.frame = CGRectMake(CGRectGetMaxX(self.locationLab.frame) + 5, 0, 25, 25);
    [self.locationView addSubview:self.arrowView];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{

    if ([keyPath isEqualToString:@"progress"]) {
        if ([change[@"new"] intValue] == 0) {
            [self.searchBtn setImage:[UIImage imageNamed:@"search1.png"] forState:UIControlStateNormal];
            self.searchBtn.layer.cornerRadius = CGRectGetWidth(self.searchBtn.frame) / 2 ;
            self.locationImageView.image = [UIImage imageNamed:@"location1.png"];
            self.locationLab.textColor = [UIColor whiteColor];
            self.arrowView.image = [UIImage imageNamed:@"arrow1.png"];
            
        } else if ([change[@"new"] intValue] == 1) {
            [self.searchBtn setImage:[UIImage imageNamed:@"search.png"] forState:UIControlStateNormal];
            self.locationImageView.image = [UIImage imageNamed:@"location.png"];
            self.locationLab.textColor = [UIColor blackColor];
            self.arrowView.image = [UIImage imageNamed:@"arrow.png"];
            
        }
        
        self.locationView.backgroundColor = [UIColor colorWithWhite:0 alpha:MIN(1 - [change[@"new"] floatValue], 0.5) ];
        self.searchBtn.backgroundColor = self.locationView.backgroundColor;
    }

}
@end

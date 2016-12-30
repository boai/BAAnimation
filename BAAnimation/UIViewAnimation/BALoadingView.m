//
//  BALoadingView.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/30.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "BALoadingView.h"

@interface BALoadingView ()

@property (nonatomic, strong) UIView *loadingView1;
@property (nonatomic, strong) UIView *loadingView2;
@property (nonatomic, strong) UIView *loadingView3;

@property(nonatomic, strong) UIView *shapeView1;
@property(nonatomic, strong) UIView *shapeView2;
@property(nonatomic, strong) UIView *shapeView3;

@end

@implementation BALoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    if (!_loadingType)
    {
        _loadingType = BALoadingViewTypeBall;
    }
    switch (_loadingType) {
        case BALoadingViewTypeBall:
            self.loadingView1.hidden = NO;
            break;
        case BALoadingViewTypeWin10:
            self.loadingView1.hidden = NO;
            break;
        case BALoadingViewTypeBook:
            self.loadingView1.hidden = NO;
            break;
            
        default:
            break;
    }
    
    [self setupAnimateView];
}

- (void)setupAnimateView
{
    CGFloat shapeViewcornerRadius = 10;
    
    self.shapeView1 = [[UIView alloc] init];
    self.shapeView2 = [[UIView alloc] init];
    self.shapeView3 = [[UIView alloc] init];

    self.shapeView1.backgroundColor = [UIColor redColor];
    self.shapeView2.backgroundColor = [UIColor greenColor];
    self.shapeView3.backgroundColor = [UIColor blueColor];

    self.shapeView1.layer.cornerRadius = shapeViewcornerRadius;
    self.shapeView2.layer.cornerRadius = shapeViewcornerRadius;
    self.shapeView3.layer.cornerRadius = shapeViewcornerRadius;

    
    [self.loadingView1 addSubview:self.shapeView1];
    [self.loadingView1 addSubview:self.shapeView2];
    [self.loadingView1 addSubview:self.shapeView3];

    [self beginAnimation];
}

- (void)beginAnimation
{
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animation];
    positionAnimation.keyPath = @"position.x";
    positionAnimation.values = @[@-5, @0, @10, @40, @70, @80, @75];
    positionAnimation.keyTimes = @[@0, @(5 / 90.0), @(15 / 90.0), @(45 / 90.0), @(75 / 90.0), @(85 / 90.0), @1];
    positionAnimation.additive = YES;
    
    CAKeyframeAnimation *scaleAnimation = [CAKeyframeAnimation animation];
    scaleAnimation.keyPath = @"transform.scale";
    scaleAnimation.values = @[@.7, @.9, @1, @.9, @.7];
    scaleAnimation.keyTimes = @[@0, @(15 / 90.0), @(45 / 90.0), @(75 / 90.0), @1];
    
    CAKeyframeAnimation *alphaAnimation = [CAKeyframeAnimation animation];
    alphaAnimation.keyPath = @"opacity";
    alphaAnimation.values = @[@0, @1, @1, @1, @0];
    alphaAnimation.keyTimes = @[@0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1];
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[positionAnimation, scaleAnimation, alphaAnimation];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    group.repeatCount = HUGE_VALF;
    group.duration = 1.3f;
    
    [self.shapeView1.layer addAnimation:group forKey:@"basic1"];
    group.timeOffset = .43;
    [self.shapeView2.layer addAnimation:group forKey:@"basic2"];
    group.timeOffset = .86;
    [self.shapeView3.layer addAnimation:group forKey:@"basic3"];
    
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat bigSize = 20;
    CGFloat smallSize = 4;
    CGFloat lineSpace = 40;
    CGFloat minY = (CGRectGetHeight(self.bounds) - bigSize) / 2;
    CGFloat minX = (CGRectGetWidth(self.bounds) - 100) / 2;
    
    _loadingView1.frame = self.bounds;
    _loadingView2.frame = self.bounds;
    _loadingView3.frame = self.bounds;

    self.shapeView1.frame = CGRectMake(minX, minY, bigSize, bigSize);
    self.shapeView2.frame = CGRectMake(minX, minY, bigSize, bigSize);
    self.shapeView3.frame = CGRectMake(minX, minY, bigSize, bigSize);

}

- (void)setLoadingType:(BALoadingViewType)loadingType
{
    _loadingType = loadingType;
}

- (UIView *)loadingView1
{
    if (!_loadingView1)
    {
        _loadingView1 = [UIView new];
        
        [self addSubview:_loadingView1];
    }
    return _loadingView1;
}

- (UIView *)loadingView2
{
    if (!_loadingView2)
    {
        _loadingView2 = [UIView new];
        
        [self addSubview:_loadingView2];
    }
    return _loadingView2;
}

- (UIView *)loadingView3
{
    if (!_loadingView3)
    {
        _loadingView3 = [UIView new];
        
        [self addSubview:_loadingView3];
    }
    return _loadingView3;
}

@end

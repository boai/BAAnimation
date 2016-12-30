//
//  BALoadingView.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/30.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "BALoadingView.h"
#import "BAActivityIndicatorView.h"


/**
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


@interface BALoadingView ()

@property (nonatomic, strong) UIView *loadingView1;
@property (nonatomic, strong) UIView *loadingView2;
@property (nonatomic, strong) BAActivityIndicatorView *loadingView3;

@property(nonatomic, strong) UIView *shapeView1;
@property(nonatomic, strong) UIView *shapeView2;
@property(nonatomic, strong) UIView *shapeView3;

@property(nonatomic, strong) UIView *shapeView4;
@property(nonatomic, strong) UIView *shapeView5;
@property(nonatomic, strong) UIView *shapeView6;
@property(nonatomic, strong) UIView *shapeView7;
@property(nonatomic, strong) UIView *shapeView8;

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
    _loadingType = BALoadingViewTypeBall;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:nil];
    [self setupAnimateView];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)handleWillEnterForeground:(NSNotification *)notification
{
    [self beginAnimation];
}

- (void)setupAnimateView
{
    CGFloat shapeViewcornerRadius  = 10;
    CGFloat shapeViewcornerRadius2 = 4;

    self.shapeView1 = [[UIView alloc] init];
    self.shapeView2 = [[UIView alloc] init];
    self.shapeView3 = [[UIView alloc] init];

    self.shapeView4 = [[UIView alloc] init];
    self.shapeView5 = [[UIView alloc] init];
    self.shapeView6 = [[UIView alloc] init];
    self.shapeView7 = [[UIView alloc] init];
    self.shapeView8 = [[UIView alloc] init];

    
    self.shapeView1.backgroundColor = [UIColor redColor];
    self.shapeView2.backgroundColor = [UIColor greenColor];
    self.shapeView3.backgroundColor = [UIColor blueColor];

    self.shapeView4.backgroundColor = [UIColor greenColor];
    self.shapeView5.backgroundColor = [UIColor greenColor];
    self.shapeView6.backgroundColor = [UIColor greenColor];
    self.shapeView7.backgroundColor = [UIColor greenColor];
    self.shapeView8.backgroundColor = [UIColor greenColor];

    self.shapeView1.layer.cornerRadius = shapeViewcornerRadius;
    self.shapeView2.layer.cornerRadius = shapeViewcornerRadius;
    self.shapeView3.layer.cornerRadius = shapeViewcornerRadius;

    self.shapeView4.layer.cornerRadius = shapeViewcornerRadius2;
    self.shapeView5.layer.cornerRadius = shapeViewcornerRadius2;
    self.shapeView6.layer.cornerRadius = shapeViewcornerRadius2;
    self.shapeView7.layer.cornerRadius = shapeViewcornerRadius2;
    self.shapeView8.layer.cornerRadius = shapeViewcornerRadius2;

    
    [self.loadingView1 addSubview:self.shapeView1];
    [self.loadingView1 addSubview:self.shapeView2];
    [self.loadingView1 addSubview:self.shapeView3];
    
    [self.loadingView2 addSubview:self.shapeView4];
    [self.loadingView2 addSubview:self.shapeView5];
    [self.loadingView2 addSubview:self.shapeView6];
    [self.loadingView2 addSubview:self.shapeView7];
    [self.loadingView2 addSubview:self.shapeView8];
    
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
    
    /*! win 10 加载风格动画 */
    CAKeyframeAnimation *positionAnimation2 = [CAKeyframeAnimation animation];
    positionAnimation2.keyPath = @"position.x";
    positionAnimation2.duration = 2.4;
    positionAnimation2.values = @[ @0, @100, @120, @220 ];
    positionAnimation2.keyTimes = @[ @0, @.35, @.65, @1 ];
    positionAnimation2.timingFunctions = @[
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut],
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                           [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    positionAnimation2.additive = YES;
    
    CAKeyframeAnimation *alphaAnimation2 = [CAKeyframeAnimation animation];
    alphaAnimation2.keyPath = @"opacity";
    alphaAnimation2.fillMode = kCAFillModeForwards;
    alphaAnimation2.removedOnCompletion = NO;
    alphaAnimation2.duration = 2.4f;
    alphaAnimation2.values = @[ @0, @1, @1, @1, @0 ];
    alphaAnimation2.keyTimes = @[ @0, @(.5 / 6.0), @(3 / 6.0), @(5.5 / 6.0), @1 ];
    
    CAAnimationGroup *group2 = [CAAnimationGroup animation];
    group2.animations = @[positionAnimation2, alphaAnimation2];
    group2.repeatCount = HUGE_VALF;
    group2.duration = 3.2f;
    
    [self.shapeView4.layer addAnimation:group2 forKey:nil];
    group2.timeOffset = .2;
    [self.shapeView5.layer addAnimation:group2 forKey:nil];
    group2.timeOffset = .4;
    [self.shapeView6.layer addAnimation:group2 forKey:nil];
    group2.timeOffset = .6;
    [self.shapeView7.layer addAnimation:group2 forKey:nil];
    group2.timeOffset = .8;
    [self.shapeView8.layer addAnimation:group2 forKey:nil];
    
    [self.loadingView3 startAnimating];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat bigSize = 20;
    CGFloat smallSize = 8;
    CGFloat lineSpace = 40;
    CGFloat minY = (CGRectGetHeight(self.bounds) - bigSize) / 2;
    CGFloat minX = (CGRectGetWidth(self.bounds) - 100) / 2;
    
    _loadingView1.frame = self.bounds;
    _loadingView2.frame = self.bounds;
//    _loadingView3.frame = self.bounds;

    self.shapeView1.frame = CGRectMake(minX, minY, bigSize, bigSize);
    self.shapeView2.frame = CGRectMake(minX, minY, bigSize, bigSize);
    self.shapeView3.frame = CGRectMake(minX, minY, bigSize, bigSize);

    minY = (CGRectGetHeight(self.bounds) - smallSize) / 2;
    minX = (CGRectGetWidth(self.bounds) - 220) / 2;
    
    self.shapeView4.frame = CGRectMake(minX, minY, smallSize, smallSize);
    self.shapeView5.frame = CGRectMake(minX, minY, smallSize, smallSize);
    self.shapeView6.frame = CGRectMake(minX, minY, smallSize, smallSize);
    self.shapeView7.frame = CGRectMake(minX, minY, smallSize, smallSize);
    self.shapeView8.frame = CGRectMake(minX, minY, smallSize, smallSize);

    minX = self.frame.size.width/2 - CGRectGetWidth(self.loadingView3.bounds)/2;
    minY = self.frame.size.height/2 - CGRectGetHeight(self.loadingView3.bounds)/2;;

    self.loadingView3.frame = CGRectMake(minX, minY, CGRectGetWidth(self.loadingView3.bounds), CGRectGetHeight(self.loadingView3.bounds));
}

- (void)setLoadingType:(BALoadingViewType)loadingType
{
    _loadingType = loadingType;
    switch (_loadingType) {
        case BALoadingViewTypeBall:
            self.loadingView1.hidden = NO;
            self.loadingView2.hidden = YES;
            break;
        case BALoadingViewTypeWin10:
            self.loadingView1.hidden = YES;
            self.loadingView2.hidden = NO;
            break;
        case BALoadingViewTypeBook:
            self.loadingView1.hidden = YES;
            self.loadingView2.hidden = YES;
            self.loadingView3.hidden = NO;
            break;
            
        default:
            break;
    }

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

- (BAActivityIndicatorView *)loadingView3
{
    if (!_loadingView3)
    {
        _loadingView3 = [BAActivityIndicatorView new];
        _loadingView3.style = BAActivityIndicatorViewStyleNormal;
        [_loadingView3 sizeToFit];
        [self addSubview:_loadingView3];
    }
    return _loadingView3;
}

@end

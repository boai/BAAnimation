//
//  BACABasicAnimationDemo.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/21.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "BACABasicAnimationDemo.h"

#define kStartRadius 25
#define kMargin 40
#define kAnimationDuration 0.8

/**
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)


@interface BACABasicAnimationDemo ()<UIApplicationDelegate>

@property (nonatomic, strong) UIView    *playerToolView;
@property (nonatomic, strong) UIView    *backView;
@property (nonatomic, strong) UIView    *startView;


@property (nonatomic, strong) UIButton  *startBtn;       //开始
@property (nonatomic, strong) UIButton  *preBtn;         //上一首
@property (nonatomic, strong) UIButton  *nextBtn;        //下一首
@property (nonatomic, strong) UIButton  *pauseBtn;       //暂停
@property (nonatomic, strong) UISlider  *progressSlider; //进度条

@property (nonatomic, strong) UILabel   *contentLabel;  //介绍标题



@end

@implementation BACABasicAnimationDemo

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor redColor];
    
    self.backView.hidden       = NO;
    self.playerToolView.hidden = YES;
    self.contentLabel.hidden   = NO;
    self.startBtn.hidden       = NO;
}

//响应超出view的事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return YES;
}

#pragma mark - 私有方法
#pragma mark 隐藏详情展示 View
- (void)dissmissBackView
{
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        self.contentLabel.alpha = 0.f;
    } completion:^(BOOL finished) {
        self.contentLabel.hidden = YES;
    }];
    
}

#pragma mark 通过曲线路径将startView移到中间
- (void)startViewToCenter
{
    /*! 设置贝塞尔曲线路径动画 */
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:self.startView.center];

    CGPoint point1 = CGPointMake(self.backView.frame.size.width / 2, self.backView.frame.size.height / 2);
    CGPoint point2 = CGPointMake(self.backView.frame.size.width - kStartRadius, 0);
    CGPoint point3 = CGPointMake(self.backView.frame.size.width * 1.5, self.backView.frame.size.height / 2);

    [path addCurveToPoint:point1 controlPoint1:point2 controlPoint2:point3];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.duration = kAnimationDuration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.startView.layer addAnimation:animation forKey:nil];
    [self performSelector:@selector(startViewChangeAnimation) withObject:nil afterDelay:1.0f];
}

#pragma mark 开始面板变大动画
- (void)startViewChangeAnimation
{
    self.startBtn.hidden = YES;
    
    /*! 变大 */
    CABasicAnimation *animation1 = [CABasicAnimation new];
    animation1.keyPath = @"bounds";
    animation1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 500, 500)];
    
    /*! 变圆 */
    CABasicAnimation *animation2 = [CABasicAnimation new];
    animation2.keyPath = @"cornerRadius";
    animation2.toValue = [NSNumber numberWithFloat:230];
    
    /*! 创建一组动画组 */
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[animation1, animation2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = kAnimationDuration;
    group.delegate = self;
    
    [self.startView.layer addAnimation:group forKey:nil];
    self.backView.layer.masksToBounds = YES;
    
    [self performSelector:@selector(loadPlayerToolViewAnimation) withObject:nil afterDelay:kAnimationDuration];
}

#pragma mark 加载控制板动画
- (void)loadPlayerToolViewAnimation
{
    self.contentLabel.hidden   = YES;
    self.playerToolView.hidden = NO;
    self.preBtn.hidden         = NO;
    self.pauseBtn.hidden       = NO;
    self.nextBtn.hidden        = NO;
    self.progressSlider.hidden = NO;

    self.playerToolView.backgroundColor = [UIColor colorWithRed:248/255.f green:55/255.f blue:158/255.f alpha:1];

    /*! 控制板出现时的转场动画 */
    CATransition *transition = [CATransition new];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromRight;
    transition.duration = kAnimationDuration;
    [self.playerToolView.layer addAnimation:transition forKey:nil];
}

#pragma mark startView变小
- (void)startViewChangeSmaller
{
    /*! 变小 */
    CABasicAnimation *animation1 = [CABasicAnimation new];
    animation1.keyPath = @"bounds";
    animation1.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, kStartRadius * 2, kStartRadius * 2)];

    /*! 变圆 */
    CABasicAnimation *animation2 = [CABasicAnimation new];
    animation2.keyPath = @"cornerRadius";
    animation2.toValue = [NSNumber numberWithFloat:kStartRadius];

    /*! 创建一组动画组 */
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[animation1, animation2];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = kAnimationDuration;
    group.delegate = self;

    [self.startView.layer addAnimation:group forKey:nil];
    self.backView.layer.masksToBounds = NO;

    [self performSelector:@selector(startViewBackAnimation) withObject:nil afterDelay:kAnimationDuration];
}

#pragma mark startView返回动画
- (void)startViewBackAnimation
{
    /*! 设置贝塞尔曲线路径动画 */
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(self.backView.frame.size.width / 2, self.backView.frame.size.height / 2)];
    
    CGPoint point1 = CGPointMake(self.backView.frame.size.width - kStartRadius, 0);
    CGPoint point2 = CGPointMake(self.backView.frame.size.width * 1.5, self.backView.frame.size.height / 2);
    CGPoint point3 = CGPointMake(self.backView.frame.size.width - kStartRadius, 0);
    [path addCurveToPoint:point1 controlPoint1:point2 controlPoint2:point3];
    
    CAKeyframeAnimation *animation = [[CAKeyframeAnimation alloc] init];
    animation.keyPath = @"position";
    animation.path = path.CGPath;
    animation.duration = kAnimationDuration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
    [self.startView.layer addAnimation:animation forKey:nil];
//    self.backView.layer. masksToBounds = YES;
    self.startBtn.hidden = NO;
}

- (void)showStartView
{
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        self.contentLabel.hidden = NO;
        self.contentLabel.alpha = 1.0f;
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - target事件
#pragma mark 点击开始按钮
- (void)clickStartBtn
{
    [self dissmissBackView];

    [self startViewToCenter];
}

#pragma mark 点击暂停 view缩小成原始的startView大小
- (void)clickPauseBtn
{
    NSLog(@"clickPause");
    self.playerToolView.hidden = YES;
//    _backView.backgroundColor = [UIColor blackColor];
    
    [self startViewChangeSmaller];

    [self showStartView];
    self.startView.hidden = NO;
}

#pragma mark - setter/getter
#pragma mark 背景
- (UIView *)backView
{
    if (!_backView)
    {
        CGFloat viewHight = BA_SCREEN_HEIGHT * 0.6;
        CGRect frame = CGRectMake(0, BA_SCREEN_HEIGHT - viewHight, BA_SCREEN_WIDTH, viewHight);
        _backView = [[UIView alloc] initWithFrame:frame];
        _backView.backgroundColor = [UIColor blackColor];
        
        [self.view addSubview:_backView];
    }
    return _backView;
}

#pragma mark 初始化页面
- (UIView *)startView
{
    if (!_startView)
    {
        CGRect frame = CGRectMake(0, 0, kStartRadius * 2, kStartRadius * 2);
        _startView = [UIView new];
        _startView.frame = frame;
        _startView.backgroundColor = [UIColor colorWithRed:88/255.f green:188/255.f blue:228/255.f alpha:1.0f];
        _startView.layer.cornerRadius = kStartRadius;
        
        /*! 起始位置 右上角 */
        _startView.layer.position = CGPointMake(BA_SCREEN_WIDTH - kStartRadius, 0);
        
        [_backView addSubview:_startView];
    }
    return _startView;
}

#pragma mark 展示信息
- (UILabel *)contentLabel
{
    if (!_contentLabel)
    {
        CGRect frame = CGRectMake(10, _backView.frame.size.height/2 - (_backView.frame.size.height * 0.3)/2, _backView.frame.size.width*0.8, _backView.frame.size.height * 0.3);
        _contentLabel = [[UILabel alloc] initWithFrame:frame];
        _contentLabel.backgroundColor = [UIColor clearColor];
        _contentLabel.text = @"欢迎来到 boaihome.com";
        _contentLabel.textColor = [UIColor whiteColor];
        
        [_backView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
//    self.startBtn.frame = CGRectMake(0, 0, self.startView.frame.size.height , self.startView.frame.size.width);
    
}

#pragma mark 开始按钮
- (UIButton *)startBtn
{
    if (!_startBtn)
    {
        _startBtn = [[UIButton alloc] initWithFrame:_startView.bounds];
        [_startBtn setImage:[UIImage imageNamed:@"ic_play_white.png"] forState:UIControlStateNormal];
        [_startBtn addTarget:self action:@selector(clickStartBtn) forControlEvents:UIControlEventTouchUpInside];
        [_startView addSubview:self.startBtn];
    }
    return _startBtn;
}

#pragma mark playerToolView
- (UIView *)playerToolView
{
    if (!_playerToolView)
    {
        CGRect frame = _backView.frame;
        _playerToolView = [[UIView alloc] initWithFrame:frame];
        _playerToolView.backgroundColor = [UIColor colorWithRed:58/255.f green:185/255.f blue:218/255.f alpha:1];
        
        [self.view addSubview:_playerToolView];
    }
    return _playerToolView;
}

#pragma mark 进度条
- (UISlider*)progressSlider
{
    if (!_progressSlider)
    {
        _progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, _playerToolView.frame.size.width * 0.9, 20)];
        _progressSlider.center = CGPointMake(_playerToolView.frame.size.width/2, _playerToolView.frame.size.height/2 + kMargin/4);
        _progressSlider.thumbTintColor = [UIColor whiteColor];
        _progressSlider.minimumTrackTintColor = [UIColor whiteColor];
        _progressSlider.maximumTrackTintColor = [UIColor whiteColor];
        
        [_playerToolView addSubview:_progressSlider];
    }
    return _progressSlider;
}

#pragma mark 前进
- (UIButton *)preBtn
{
    if (!_preBtn)
    {
        _preBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _preBtn.center = CGPointMake(_playerToolView.frame.size.width/2 - kMargin*2, _playerToolView.frame.size.height/2 - kMargin * 0.8);
        [_preBtn setImage:[UIImage imageNamed:@"ic_skip_previous.png"] forState:UIControlStateNormal];
        [_playerToolView addSubview:_preBtn];
    }
    return _preBtn;
}


#pragma mark 下一首
- (UIButton *)nextBtn
{
    if (!_nextBtn)
    {
        _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _nextBtn.center = CGPointMake(_playerToolView.frame.size.width/2 + kMargin*2, _playerToolView.frame.size.height/2 - kMargin * 0.8);
        [_nextBtn setImage:[UIImage imageNamed:@"ic_skip_next.png"] forState:UIControlStateNormal];
        [_playerToolView addSubview:_nextBtn];
    }
    return _nextBtn;
}

#pragma mark 暂停
- (UIButton *)pauseBtn
{
    if (!_pauseBtn)
    {
        _pauseBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _pauseBtn.center = CGPointMake(_playerToolView.frame.size.width/2, _playerToolView.frame.size.height/2 - kMargin * 0.8);
        [_pauseBtn setImage:[UIImage imageNamed:@"ic_stop.png"] forState:UIControlStateNormal];
//        [_pauseBtn setImage:[UIImage imageNamed:@"ic_play_white"] forState:UIControlStateSelected];

        [_pauseBtn addTarget:self action:@selector(clickPauseBtn) forControlEvents:UIControlEventTouchUpInside];
        [_playerToolView addSubview:_pauseBtn];
    }
    return _pauseBtn;
}























@end

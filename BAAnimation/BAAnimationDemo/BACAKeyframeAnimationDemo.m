//
//  BACAKeyframeAnimationDemo.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/29.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "BACAKeyframeAnimationDemo.h"
#import "BALoadingView.h"

/**
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)



@interface BACAKeyframeAnimationDemo ()

/*!  */
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) BALoadingView *loadingView1;
@property (nonatomic, strong) BALoadingView *loadingView2;
@property (nonatomic, strong) BALoadingView *loadingView3;

@end

@implementation BACAKeyframeAnimationDemo

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _lineView = [UIView new];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_lineView];
    
    if (0 == _animationType)
    {
        self.loadingView1.hidden = NO;
        self.loadingView2.hidden = YES;
        self.loadingView3.hidden = YES;
    }
    else if (1 == _animationType)
    {
        self.loadingView1.hidden = YES;
        self.loadingView2.hidden = NO;
        self.loadingView3.hidden = YES;
    }
    else if (2 == _animationType)
    {
        self.loadingView1.hidden = YES;
        self.loadingView2.hidden = YES;
        self.loadingView3.hidden = NO;
    }
}

#pragma mark - setter / getter
- (BALoadingView *)loadingView1
{
    if (!_loadingView1)
    {
        _loadingView1 = [[BALoadingView alloc] init];
        _loadingView1.backgroundColor = [UIColor clearColor];
        _loadingView1.loadingType = BALoadingViewTypeBall;
//        _loadingView2.ballSize = 50;
        /*! 可以自定义小球颜色 */
//        _loadingView1.ballColorsArray = @[[UIColor yellowColor], [UIColor redColor], [UIColor cyanColor]];

        [self.view addSubview:_loadingView1];
    }
    return _loadingView1;
}

- (BALoadingView *)loadingView2
{
    if (!_loadingView2)
    {
        _loadingView2 = [[BALoadingView alloc] init];
        _loadingView2.backgroundColor = [UIColor clearColor];
        _loadingView2.loadingType = BALoadingViewTypeWin10;
//        _loadingView2.themColor = [UIColor redColor];
//        _loadingView2.ballSize = 15;
        
        [self.view addSubview:_loadingView2];
    }
    return _loadingView2;
}

- (BALoadingView *)loadingView3
{
    if (!_loadingView3)
    {
        _loadingView3 = [[BALoadingView alloc] init];
        _loadingView3.backgroundColor = [UIColor clearColor];
        _loadingView3.loadingType = BALoadingViewTypeBook;
        _loadingView3.themColor = [UIColor redColor];
        [self.view addSubview:_loadingView3];
    }
    return _loadingView3;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    CGFloat lodingViewSizeWidth  = 200;
    CGFloat lodingViewSizeHeight = BA_SCREEN_HEIGHT * 0.15;
    CGFloat lodingViewSpace = 10;

    _lineView.frame = CGRectMake(self.view.center.x - 0.5, 0, 1, BA_SCREEN_HEIGHT);
    _loadingView1.frame = CGRectMake(self.view.center.x - lodingViewSizeWidth/2, 64 + lodingViewSpace, lodingViewSizeWidth, lodingViewSizeHeight);
    _loadingView2.frame = CGRectMake(self.view.center.x - lodingViewSizeWidth/2, CGRectGetMaxY(_loadingView1.frame) + lodingViewSpace, lodingViewSizeWidth, lodingViewSizeHeight);
    _loadingView3.frame = CGRectMake(self.view.center.x - lodingViewSizeWidth/2, CGRectGetMaxY(_loadingView2.frame) + lodingViewSpace, lodingViewSizeWidth, lodingViewSizeHeight);

}


@end

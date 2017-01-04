//
//  BADownloadViewDemo.m
//  BAAnimation
//
//  Created by 博爱 on 2017/1/4.
//  Copyright © 2017年 DS-Team. All rights reserved.
//

#import "BADownloadViewDemo.h"
#import "BALoadingWaveView.h"
#import "BAAnimationHeader.h"

@interface BADownloadViewDemo ()

@property (nonatomic, strong) BALoadingWaveView *loadingView;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation BADownloadViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"下载动画-水波纹";
    
    self.loadingView.hidden = NO;
    self.slider.hidden = NO;


}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.loadingView.frame = CGRectMake(50, 100, 150, 150);
    self.slider.frame = CGRectMake(50, 300, self.view.frame.size.width - 50 * 2, 30);
    
    CGPoint center = self.loadingView.center;
    center.x = CGRectGetMidX(self.view.bounds);
    self.loadingView.center = center;
}

- (void)changeProgress:(UISlider *)slider
{
    self.loadingView.progress = slider.value;
}

- (BALoadingWaveView *)loadingView
{
    if (!_loadingView)
    {
        self.loadingView = [[BALoadingWaveView alloc] init];
        self.loadingView.waveHeight = 5.0f;
        self.loadingView.speed = 1.0f;
        [self.view addSubview:self.loadingView];
    }
    return _loadingView;
}

- (UISlider *)slider
{
    if (!_slider)
    {
        self.slider = [[UISlider alloc] init];
        [self.slider addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:self.slider];
    }
    return _slider;
}


@end

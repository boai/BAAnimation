//
//  BACAKeyframeAnimationDemo.m
//  BAAnimation
//
//  Created by 博爱 on 2016/12/29.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import "BACAKeyframeAnimationDemo.h"
#import "BALoadingView.h"


@interface BACAKeyframeAnimationDemo ()

@property (nonatomic, strong) BALoadingView *lodingView;

@end

@implementation BACAKeyframeAnimationDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor yellowColor];
    
    if (0 == _animationType)
    {
        self.lodingView.hidden = NO;
//        self.loadingView1.hidden = NO;
//        self.loadingView2.hidden = YES;
//        self.loadingView3.hidden = YES;
    }
    else if (1 == _animationType)
    {
//        self.loadingView1.hidden = YES;
//        self.loadingView2.hidden = NO;
//        self.loadingView3.hidden = YES;
    }
    else if (2 == _animationType)
    {
//        self.loadingView1.hidden = YES;
//        self.loadingView2.hidden = YES;
//        self.loadingView3.hidden = NO;
    }

}

#pragma mark - setter / getter
- (BALoadingView *)lodingView
{
    if (!_lodingView)
    {
        _lodingView = [[BALoadingView alloc] init];
        _lodingView.backgroundColor = [UIColor whiteColor];
        _lodingView.loadingType = BALoadingViewTypeBall;
        
        [self.view addSubview:_lodingView];
    }
    return _lodingView;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    _lodingView.frame = CGRectMake(self.view.center.x - 100, self.view.center.y - 64, 200, 200);

}


@end

//
//  BALoadingWaveView.h
//  BAAnimation
//
//  Created by 博爱 on 2017/1/3.
//  Copyright © 2017年 DS-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BALoadingWaveView : UIView

@property (nonatomic, assign) CGFloat progress;
/*! 波动的速度 */
@property (nonatomic, assign) CGFloat speed;
@property (nonatomic, strong) UIColor *waveColor;
@property (nonatomic, assign) CGFloat waveHeight;

@end

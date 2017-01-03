//
//  BAActivityIndicatorView.h
//  BAAnimation
//
//  Created by 博爱 on 2016/12/30.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BAActivityIndicatorViewStyle) {
    BAActivityIndicatorViewStyleNormal = 0,
    BAActivityIndicatorViewStyleSmall
};

@interface BAActivityIndicatorView : UIView

@property (nonatomic, assign) BAActivityIndicatorViewStyle style;
/*! 默认为YES */
@property(nonatomic, assign) BOOL hidesWhenStopped;


- (void)startAnimating;
- (void)stopAnimating;
- (BOOL)isAnimating;

- (instancetype)initWithStyle:(BAActivityIndicatorViewStyle)style;

/*!
 * 手动控制动画进度（也即配合下拉刷新使用时下拉过程的动画）
 * @param currentOffsetY 当前列表的contentOffset，已经除去contentInset.top的影响，所以0就表示列表处于顶部
 * @param distanceForStartRefresh 整个下拉刷新要拉动多少距离才会真正触发下拉刷新，这个距离也是manualAnimation刚好完成的位置
 * @param distanceForCompleteAnimation 下拉到开始做动画的时候，一直到动画完全走完，这个过程要经历的距离。值越大表示动画的步进越小，值越小表示步进越大，也即拉一点点就能让动画从头走到尾了
 * @warning distanceForCompleteAnimation的值要比distanceForStartRefresh小
 */
- (void)ba_manualAnimationWithCurrentOffsetY:(CGFloat)currentOffsetY
                  distanceForStartRefresh:(CGFloat)distanceForStartRefresh
             distanceForCompleteAnimation:(CGFloat)distanceForCompleteAnimation;

@end

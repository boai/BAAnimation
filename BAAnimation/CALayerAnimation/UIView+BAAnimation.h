//
//  UIView+BAAnimation.h
//  BAAnimation
//
//  Created by 博爱 on 2016/12/19.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface UIView (BAAnimation)

/*!
 *  缩放显示动画
 *
 *  @param duration    持续时间，默认：1.0f
 *  @param scaleRatio  缩放比率，默认：1.6f
 *  @param finishBlock 缩放完成回调
 */
- (void)ba_animation_scaleShowWithDuration:(CGFloat)duration
                                     ratio:(CGFloat)scaleRatio
                               finishBlock:(void(^)())finishBlock;

/*!
 *  缩放消失动画
 *
 *  @param duration    持续时间，默认：1.0f
 *  @param scaleRatio  缩放比率，默认：1.6f
 *  @param finishBlock 缩放完成回调
 */
- (void)ba_animation_scaleDismissWithDuration:(CGFloat)duration
                                        ratio:(CGFloat)scaleRatio
                                  finishBlock:(void(^)())finishBlock;

/*!
 *  透明度动画
 *
 *  @param duration    持续时间，默认：1.5f
 *  @param startAlpha  开始的 alpha，默认：0.2f
 *  @param finishAlpha 结束的 alpha，默认：1.0f
 */
- (void)ba_animation_alphaWithDuration:(CGFloat)duration
                            startAlpha:(CGFloat)startAlpha
                           finishAlpha:(CGFloat)finishAlpha;

/*!
 *  转场动画
 *
 *  @param duration      持续时间，默认：1.5f
 *  @param startOptions  开始转场动画样式
 *  @param finishOptions 结束转场动画样式
 *  @param finishBlock   转场结束回调
 */
- (void)ba_animation_transitionWithDuration:(CGFloat)duration
                               startOptions:(UIViewAnimationOptions)startOptions
                              finishOptions:(UIViewAnimationOptions)finishOptions
                                finishBlock:(void(^)())finishBlock;

/*!
 *  改变 frame 动画
 *
 *  @param duration      持续时间，默认：1.5f
 *  @param originalFrame 原始 frame
 *  @param newFrame      更改后的 frame
 *  @param finishBlock   结束回调
 */
- (void)ba_animation_changFrameWithDuration:(CGFloat)duration
                              originalFrame:(CGRect)originalFrame
                                   newFrame:(CGRect)newFrame
                                finishBlock:(void(^)())finishBlock;

/*!
 *  改变 Bounds 动画
 *
 *  @param duration       持续时间，默认：1.5f
 *  @param originalBounds 原始 Bounds
 *  @param newBounds      更改后的 Bounds
 *  @param finishBlock    结束回调
 */
- (void)ba_animation_changBoundsWithDuration:(CGFloat)duration
                             originalBounds:(CGRect)originalBounds
                                  newBounds:(CGRect)newBounds
                                finishBlock:(void(^)())finishBlock;

/*!
 *  改变 Center 动画
 *
 *  @param duration       持续时间，默认：1.5f
 *  @param originalCenter 原始 Center
 *  @param newCenter      更改后的 Center
 *  @param finishBlock    结束回调
 */
- (void)ba_animation_changCenterWithDuration:(CGFloat)duration
                              originalCenter:(CGPoint)originalCenter
                                   newCenter:(CGPoint)newCenter
                                 finishBlock:(void(^)())finishBlock;

/*!
 *  弹簧动画
 *
 *  @param duration              持续时间，默认：1.5f
 *  @param damping               弹性比率
 *  @param initialSpringVelocity 初始弹簧速度
 *  @param startOptions          开始动画样式
 *  @param finishOptions         开始动画样式
 *  @param startBlock            开始动画回调
 *  @param finishBlock           结束动画回调
 */
- (void)ba_animation_springWithDuration:(CGFloat)duration
                                damping:(CGFloat)damping
                  initialSpringVelocity:(CGFloat)initialSpringVelocity
                           startOptions:(UIViewAnimationOptions)startOptions
                          finishOptions:(UIViewAnimationOptions)finishOptions
                             startBlock:(void(^)())startBlock
                            finishBlock:(void(^)())finishBlock;
@end



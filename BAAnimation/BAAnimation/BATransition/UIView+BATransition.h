//
//  UIView+BATransition.h
//  BAAnimation
//
//  Created by 博爱 on 2017/1/5.
//  Copyright © 2017年 DS-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

/*! Common transition types. */
typedef NS_ENUM(NSUInteger, BATransitionType) {
    /*! 淡入淡出 */
    BATransitionTypeFade = 0,
    /*! 推挤 */
    BATransitionTypePush,
    /*! 揭开 */
    BATransitionTypeReveal,
    /*! 覆盖 */
    BATransitionTypeMoveIn,
    /*! 立方体 */
    BATransitionTypeCube,
    /*! 吮吸 */
    BATransitionTypeSuckEffect,
    /*! 翻转 */
    BATransitionTypeOglFlip,
    /*! 波纹 */
    BATransitionTypeRippleEffect,
    /*! 翻页 */
    BATransitionTypePageCurl,
    /*! 反翻页 */
    BATransitionTypePageUnCurl,
    /*! 开镜头 */
    BATransitionTypeCameraIrisHollowOpen,
    /*! 关镜头 */
    BATransitionTypeCameraIrisHollowClose,
};

/*! Common transition subtypes. */
typedef NS_ENUM(NSUInteger, BATransitionSubtype) {
    BATransitionSubtypeFromRight = 0,
    BATransitionSubtypeFromLeft,
    BATransitionSubtypeFromTop,
    BATransitionSubtypeFromBottom
};

/*!  Timing function names.  */
typedef NS_ENUM(NSUInteger, BATransitionTimingFunctionType) {
    /*! 默认 */
    BATransitionTimingFunctionTypeDefault = 0,
    /*! 线性,即匀速 */
    BATransitionTimingFunctionTypeLinear,
    /*! 先慢后快 */
    BATransitionTimingFunctionTypeEaseIn,
    /*! 先快后慢 */
    BATransitionTimingFunctionTypeEaseOut,
    /*! 先慢后快再慢 */
    BATransitionTimingFunctionTypeEaseInEaseOut
};


@interface UIView (BATransition)

/*!
 *  CATransition动画实现
 *
 *  @param type                转场动画类型【过渡效果】，默认：BATransitionTypeFade
 *  @param subType             转场动画将去的方向，默认：BATransitionSubtypeFromRight
 *  @param duration            转场动画持续时间，默认：0.8f
 *  @param timingFunction      计时函数，从头到尾的流畅度，默认：BATransitionTimingFunctionTypeDefault
 *  @param removedOnCompletion 在动画执行完时是否被移除，默认：YES
 *  @param forView             添加动画（转场动画是添加在层上的动画）
 */
- (void)ba_transitionWithType:(BATransitionType)type
                      subType:(BATransitionSubtype)subType
                     duration:(CFTimeInterval)duration
               timingFunction:(BATransitionTimingFunctionType)timingFunction
          removedOnCompletion:(BOOL)removedOnCompletion
                      forView:(UIView *)forView;

/*!
 *  UIView实现动画
 *
 *  @param duration       转场动画持续时间，默认：0.8f
 *  @param animationCurve 动画曲线，默认：UIViewAnimationCurveEaseInOut
 *  @param transition     动画过渡，默认：UIViewAnimationTransitionNone
 *  @param forView        添加动画（转场动画是添加在层上的动画）
 */
- (void)ba_transitionViewWithDuration:(CFTimeInterval)duration
                       animationCurve:(UIViewAnimationCurve)animationCurve
                           transition:(UIViewAnimationTransition)transition
                              forView:(UIView *)forView;

@end

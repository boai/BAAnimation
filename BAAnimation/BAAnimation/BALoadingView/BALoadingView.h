//
//  BALoadingView.h
//  BAAnimation
//
//  Created by 博爱 on 2016/12/30.
//  Copyright © 2016年 DS-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, BALoadingViewType) {
    /*! 三个小球横向滚动 */
    BALoadingViewTypeBall = 0,
    /*! 三个小球旋转 */
    BALoadingViewTypeBallRotation,
    /*! win 10 加载动画 */
    BALoadingViewTypeWin10,
    /*! QQ 翻页加载动画 */
    BALoadingViewTypeBook
};

@interface BALoadingView : UIView

/*! 加载动画的样式 */
@property (nonatomic, assign) BALoadingViewType loadingType;

/*! 仅限样式1 的颜色数组，默认为：@[[UIColor greenColor], [UIColor redColor], [UIColor blueColor]];
 */
@property (nonatomic, strong) NSArray <UIColor *>*ballColorsArray;
/*! 仅限样式 2、样式 3、样式 4 的主题颜色，默认：2为红色，3为绿色，4为灰色 */
@property (nonatomic, strong) UIColor *themColor;

/*! 仅限样式 1 和 样式 2 的小球的大小【0-30之间最佳】，默认：20 */
@property (nonatomic, assign) CGFloat ballSize;



@end

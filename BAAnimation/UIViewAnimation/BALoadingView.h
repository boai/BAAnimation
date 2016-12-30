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
    /*! win 10 加载动画 */
    BALoadingViewTypeWin10,
    /*! QQ 翻页加载动画 */
    BALoadingViewTypeBook
};

@interface BALoadingView : UIView

@property (nonatomic, assign) BALoadingViewType loadingType;


@property (nonatomic, strong) NSArray <UIColor *>*ballColorsArray;
@property (nonatomic, strong) UIColor *themColor;



@end

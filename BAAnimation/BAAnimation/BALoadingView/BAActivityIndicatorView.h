
/*!
 *  @header BAKit.h
 *          BABaseProject
 *
 *  @brief  BAKit
 *
 *  @author 博爱
 *  @copyright    Copyright © 2016年 博爱. All rights reserved.
 *  @version    V1.0
 */

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖镇楼                  BUG辟易
//          佛曰:
//                  写字楼里写字间，写字间里程序员；
//                  程序人员写程序，又拿程序换酒钱。
//                  酒醒只在网上坐，酒醉还来网下眠；
//                  酒醉酒醒日复日，网上网下年复年。
//                  但愿老死电脑间，不愿鞠躬老板前；
//                  奔驰宝马贵者趣，公交自行程序员。
//                  别人笑我忒疯癫，我笑自己命太贱；
//                  不见满街漂亮妹，哪个归得程序员？

/*
 
 *********************************************************************************
 *
 * 在使用BAKit的过程中如果出现bug请及时以以下任意一种方式联系我，我会及时修复bug
 *
 * QQ     : 可以添加ios开发技术群 479663605 在这里找到我(博爱1616【137361770】)
 * 微博    : 博爱1616
 * Email  : 137361770@qq.com
 * GitHub : https://github.com/boai
 * 博客    : http://boaihom.com
 
 *********************************************************************************
 
 */

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

//
//  BAAnimationHeader.h
//  BAAnimation
//
//  Created by 博爱 on 2017/1/4.
//  Copyright © 2017年 DS-Team. All rights reserved.
//

#ifndef BAAnimationHeader_h
#define BAAnimationHeader_h

/*!
 *  获取屏幕宽度和高度
 */
#define BA_SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define BA_SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)




#endif /* BAAnimationHeader_h */

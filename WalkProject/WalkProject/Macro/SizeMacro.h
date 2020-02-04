//
//  SizeMacro.h
//  JJ
//
//  Created by meimi on 2018/8/8.
//  Copyright © 2018年 meimi. All rights reserved.
//

#ifndef SizeMacro_h
#define SizeMacro_h

//  屏幕尺寸(宽 + 高)
#define kScreenBounds    [UIScreen mainScreen].bounds
//  屏幕宽
#define kScreenWidth    [UIScreen mainScreen].bounds.size.width
//  屏幕高
#define kScreenHeight    [UIScreen mainScreen].bounds.size.height
// 屏幕中心点
#define kScreenCenter   CGPointMake(kScreenWidth / 2, kScreenHeight / 2)

// status bar height.

#define  kStatusBarHeight      (IS_iPhoneX ? 44.f : 20.f)

// Navigation bar height.

#define  kNavigationBarHeight  44.f

// Tabbar height.

#define  kTabbarHeight        (IS_iPhoneX ? (49.f+34.f) : 49.f)

// Tabbar safe bottom margin.

#define  kTabbarSafeBottomMargin        (IS_iPhoneX ? 34.f : 0.f)

// Status bar & navigation bar height.

#define  kStatusBarAndNavigationBarHeight  (IS_iPhoneX ? 88.f : 64.f)

#define  kBottomHomeBarHeight           (IS_iPhoneX ? 34.f : 0.f)

// 根据6s设计稿等比例适配
#define k6sWidth(w)         ((w) * kScreenWidth / 375)
#define k6sHeight(h)         ((h) * kScreenHeight / 667)

#endif /* SizeMacro_h */

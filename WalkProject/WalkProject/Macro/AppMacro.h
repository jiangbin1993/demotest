//
//  AppMacro.h
//  JJ
//
//  Created by meimi on 2018/8/9.
//  Copyright © 2018年 meimi. All rights reserved.
//

#ifndef AppMacro_h
#define AppMacro_h

#define IS_RETINA                       ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_MAX_LENGTH               (MAX(kScreenWidth, kScreenHeight))
#define SCREEN_MIN_LENGTH               (MIN(kScreenWidth, kScreenHeight))

#define IS_IPHONE_4_OR_LESS             (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5_SIZE                (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_5_OR_LESS             (IS_IPHONE && SCREEN_MAX_LENGTH <= 568.0)
#define IS_IPHONE_6_SIZE                (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_PLUS_SIZE             (IS_IPHONE && SCREEN_MAX_LENGTH >= 736.0)

// iphone X  iphone XS   iphone XR  iphone XS max
#define IS_iPhoneX ((IS_IPHONE && SCREEN_MAX_LENGTH == 812))

//图片
#define ImageNamed(name)                [UIImage imageNamed:name]


#pragma mark ---------app需要的字段----------------

#define kGetLocalContent(s) [[NSUserDefaults standardUserDefaults] objectForKey:(s)]

// 字符串的安全处理
#define SafeString(string) !IsStrEmpty((string)) ? (string) : @""

// 判断字符串是否为空
#define IsStrEmpty(_ref)    (((_ref) == nil) || ([(_ref) isEqual:[NSNull null]]) ||([(_ref)isEqualToString:@""]))

// 最上层控制器宏
#define kTopVc  [UIViewController topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController]

#endif /* AppMacro_h */

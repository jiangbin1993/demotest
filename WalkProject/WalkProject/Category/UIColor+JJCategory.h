//
//  UIColor+JJCategory.h
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (JJCategory)

/**
 十六进制转化为颜色
 @param color 十六进制字符串
*/
+ (UIColor *) colorWithHexString: (NSString *)color;

/**
 十六进制转化为颜色
 @param color 十六进制字符串
 @param alpha 不透明度
 */
+ (UIColor *) colorWithHexString: (NSString *)color alpha:(CGFloat)alpha;

/**
 r g b a 颜色转化
*/
+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;

/**
 得到一个颜色的原始值 RGBA
 
 @param originColor 传入颜色
 @return 颜色值数组
 */
+ (NSArray *)getRGBDictionaryByColor:(UIColor *)originColor;

/**
 得到两个值的色差
 
 @param beginColor 起始颜色
 @param endColor 终止颜色
 @return 色差数组
 */
+ (NSArray *)transColorBeginColor:(UIColor *)beginColor andEndColor:(UIColor *)endColor;

/**
 传入两个颜色和系数得到过渡颜色
 
 @param beginColor 开始颜色
 @param coe 系数（0->1）
 @param endColor 终止颜色
 @return 过度颜色
 */

+ (UIColor *)getColorWithColor:(UIColor *)beginColor andCoe:(double)coe  andEndColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END

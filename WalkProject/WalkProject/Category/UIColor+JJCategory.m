//
//  UIColor+JJCategory.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "UIColor+JJCategory.h"

@implementation UIColor (JJCategory)

/**
 十六进制转化为颜色
 @param color 十六进制字符串
 */
+ (UIColor *) colorWithHexString: (NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

/**
 十六进制转化为颜色
 @param color 十六进制字符串
 @param alpha 不透明度
 */
+ (UIColor *) colorWithHexString: (NSString *)color alpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}
    
/**
 r g b a 颜色转化
 */
+ (UIColor *)colorWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha{
    UIColor *color = [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
    return color;
}


/**
 得到一个颜色的原始值 RGBA
 
 @param originColor 传入颜色
 @return 颜色值数组
 */
+ (NSArray *)getRGBDictionaryByColor:(UIColor *)originColor {
    CGFloat r = 0,g = 0,b = 0,a = 0;
    if ([self respondsToSelector:@selector(getRed:green:blue:alpha:)]) {
        [originColor getRed:&r green:&g blue:&b alpha:&a];
    }
    else {
        const CGFloat *components = CGColorGetComponents(originColor.CGColor);
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }
    return @[@(r),@(g),@(b)];
}


/**
 得到两个值的色差
 
 @param beginColor 起始颜色
 @param endColor 终止颜色
 @return 色差数组
 */
+ (NSArray *)transColorBeginColor:(UIColor *)beginColor andEndColor:(UIColor *)endColor {
    NSArray<NSNumber *> *beginColorArr = [self getRGBDictionaryByColor:beginColor];
    NSArray<NSNumber *> *endColorArr = [self getRGBDictionaryByColor:endColor];
    return @[@([endColorArr[0] doubleValue] - [beginColorArr[0] doubleValue]),@([endColorArr[1] doubleValue] - [beginColorArr[1] doubleValue]),@([endColorArr[2] doubleValue] - [beginColorArr[2] doubleValue])];
}

/**
 传入两个颜色和系数
 
 @param beginColor 开始颜色
 @param coe 系数（0->1）
 @param endColor 终止颜色
 @return 过度颜色
 */

+ (UIColor *)getColorWithColor:(UIColor *)beginColor andCoe:(double)coe  andEndColor:(UIColor *)endColor {
    NSArray *beginColorArr = [self getRGBDictionaryByColor:beginColor];
    NSArray *marginArray = [self transColorBeginColor:beginColor andEndColor:endColor];
    double red = [beginColorArr[0] doubleValue] + coe * [marginArray[0] doubleValue];
    double green = [beginColorArr[1] doubleValue] + coe * [marginArray[1] doubleValue];
    double blue = [beginColorArr[2] doubleValue] + coe * [marginArray[2] doubleValue];
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
}

@end

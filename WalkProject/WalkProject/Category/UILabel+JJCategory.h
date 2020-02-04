//
//  UILabel+JJCategory.h
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    JJLabelLineStyleBottom, // 下划线
    JJLabelLineStyleMiddle, // 中间横线
    JJLabelLineStyleSlash // 斜线
} JJLabelLineStyle;

@interface UILabel (JJCategory)


/**
 快速创建一个包含字体颜色和字体的label
 
 @param color 字体颜色
 @param font 字体
 @return label
 */
+ (UILabel *)labelWithColor:(UIColor *)color font:(UIFont *)font;

/**
 快速创建label label和文字宽度一致
 
 @param title 文字
 @param color 字体颜色
 @param font 字体
 @return label
 */
+ (UILabel *)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;

/**
 快速创建一个带划线的label
 
 @param style 划线风格 JJLabelLineStyleBottom 下划线 JJLabelLineStyleMiddle 中间横线 JJLabelLineStyleSlash 斜线
 @param title 文字
 @param color 字体颜色
 @param font 字体
 @return label
 */
+ (UILabel *)labelWithLineAndStyle:(JJLabelLineStyle)style AndTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font;


/**
 为label添加划线和文字
 
 @param style 划线风格 JJLabelLineStyleBottom 下划线 JJLabelLineStyleMiddle 中间横线 JJLabelLineStyleSlash 斜线
 @param title 文字
 */
- (void)addLineWithStyle:(JJLabelLineStyle)style andTitle:(NSString *)title;


/**
 *  改变行间距
 */
- (void)changeLineSpace:(float)space;

/**
 *  改变字间距
 */
- (void)changeWordSpace:(float)space;

/**
 *  改变行间距和字间距
 */
- (void)changeSpaceWithLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end

NS_ASSUME_NONNULL_END

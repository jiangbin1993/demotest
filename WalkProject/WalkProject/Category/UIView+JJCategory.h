//
//  UIView+JJExtension.h
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (JJCategory)

/**
 *  判断是否显示在主窗口上面
 *
 *  @return 是否
 */
- (BOOL)isShowOnWindow;

/// 获取某个类的子视图
/// @param className 类名

- (UIView *)getSubviewWithClassName:(NSString *)className;

- (UIViewController *)parentController;


- (void)setCornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity;


/// 设置阴影
/// @param color 阴影颜色
/// @param offset 偏移量
/// @param opacity 透明度
/// @param shadowRadius 圆角
- (void)setShadowWithColor:(UIColor *)color offset:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)shadowRadius;


/**
 设置某个或某几个角的圆角

 @param corners 哪些角
 @param size 切的尺寸
 */
- (void)setCornerRadiusbyRoundCorners:(UIRectCorner)corners size:(CGSize)size;


/**
 添加从左到右的渐变色

 @param leftColor 左边起点颜色
 @param rightColor 右边终点颜色
 */
- (void)addGradientColorWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor;

/**
 在view上添加从左到右的主题色渐变色
 */
- (void)addThemeColorGradientColorLeftToRightOnView;


/**
 在view上的某个区域添加从左到右的主题色渐变色
 
 @param frame 区域
 @param cornerRadius 圆角
 */
- (void)addThemeColorGradientColorLeftToRightOnViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius;


@end

NS_ASSUME_NONNULL_END

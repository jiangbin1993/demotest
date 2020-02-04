//
//  UIView+JJExtension.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "UIView+JJCategory.h"
#import <objc/runtime.h>

@implementation UIView (JJCategory)

#ifdef DEBUG

// 运行时交换销毁方法，打印当前类被销毁，便于内存管理调试
+ (void)load {
    [super load];
    Method originalM = class_getInstanceMethod([self class], NSSelectorFromString(@"dealloc"));
    Method exchangeM = class_getInstanceMethod([self class], @selector(jjDealloc));
    /** 交换方法 */
    method_exchangeImplementations(originalM, exchangeM);
}

- (void)jjDealloc {
    // 屏蔽掉一些基本的系统类
    if (!([self isMemberOfClass:[UIImageView class]] || [self isMemberOfClass:[UILabel class]] || [self isMemberOfClass:[UITextField class]] || [self isMemberOfClass:[UITextView class]] || [self isMemberOfClass:[UIView class]] || [self isMemberOfClass:[UIButton class]] || [self isMemberOfClass:NSClassFromString(@"UIButtonLabel")] || [self isMemberOfClass:NSClassFromString(@"_UITextFieldContentView")])) {
        NSLog(@"view====%@被销毁", [self class]);
    }
    [self jjDealloc];
}

#else

#endif

- (BOOL)isShowOnWindow
{
    //主窗口
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    
    //相对于父控件转换之后的rect
    CGRect newRect = [keyWindow convertRect:self.frame fromView:self.superview];
    //主窗口的bounds
    CGRect winBounds = keyWindow.bounds;
    //判断两个坐标系是否有交汇的地方，返回bool值
    BOOL isIntersects =  CGRectIntersectsRect(newRect, winBounds);
    if (self.hidden != YES && self.alpha >0.01 && self.window == keyWindow && isIntersects) {
        return YES;
    }else{
        return NO;
    }
}


/// 获取某个类的子视图
/// @param className 类名
- (UIView *)getSubviewWithClassName:(NSString *)className {
    NSArray *subviews = [self subviews];
    for (UIView *subview in subviews) {
        if ([subview isMemberOfClass:NSClassFromString(className)]) {
            return subview;
        }
    }
    return nil;
}

- (UIViewController *)parentController
{
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

- (void)setCornerRadius:(CGFloat)radius withShadow:(BOOL)shadow withOpacity:(CGFloat)opacity {
    self.layer.cornerRadius = radius;
    if (shadow) {
        self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        self.layer.shadowOpacity = opacity;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowRadius = 4;
        self.layer.shouldRasterize = YES;
        self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:radius] CGPath];
    }
    self.layer.masksToBounds = !shadow;
}

/// 设置阴影
/// @param color 阴影颜色
/// @param offset 偏移量
/// @param opacity 透明度
/// @param shadowRadius 圆角
- (void)setShadowWithColor:(UIColor *)color offset:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)shadowRadius {
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOffset = offset;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowRadius = shadowRadius;
    self.layer.masksToBounds = NO;
}


- (void)setCornerRadiusbyRoundCorners:(UIRectCorner)corners size:(CGSize)size {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}


/**
 添加从左到右的渐变色
 
 @param leftColor 左边起点颜色
 @param rightColor 右边终点颜色
 */
- (void)addGradientColorWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor {
    [self addGradientColorWithLeftColor:leftColor rightColor:rightColor frame:self.bounds cornerRadius:0];
}

/**
 添加从左到右的渐变色
 
 @param leftColor 左边起点颜色
 @param rightColor 右边终点颜色
 @param frame 区域
 */
- (void)addGradientColorWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor frame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)leftColor.CGColor, (__bridge id)rightColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = frame;
    gradientLayer.cornerRadius = cornerRadius;
    gradientLayer.zPosition = -5;
    [self.layer insertSublayer:gradientLayer atIndex:0];
}

/**
 在view上添加从左到右的主题色渐变色
 */
- (void)addThemeColorGradientColorLeftToRightOnView {
//    [self addGradientColorWithLeftColor:[UIColor colorWithHexString:@"FD417A"] rightColor:kTxtColorFF0C15];
}

/**
 在view上的某个区域添加从左到右的主题色渐变色
 
 @param frame 区域
 @param cornerRadius 圆角
 */
- (void)addThemeColorGradientColorLeftToRightOnViewWithFrame:(CGRect)frame cornerRadius:(CGFloat)cornerRadius {
//    [self addGradientColorWithLeftColor:[UIColor colorWithHexString:@"FD417A"] rightColor:kTxtColorFF0C15 frame:frame cornerRadius:cornerRadius];
}

@end

//
//  UILabel+JJCategory.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "UILabel+JJCategory.h"

@implementation UILabel (JJCategory)

/**
 快速创建一个包含字体颜色和字体的label

 @param color 字体颜色
 @param font 字体
 @return label
 */
+ (UILabel *)labelWithColor:(UIColor *)color font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.font = font;
    return label;
}

/**
 快速创建label label和文字宽度一致

 @param title 文字
 @param color 字体颜色
 @param font 字体
 @return label
 */
+ (UILabel *)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] init];
    label.textColor = color;
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label;
}


/**
 快速创建一个带划线的label

 @param style 划线风格 JJLabelLineStyleBottom 下划线 JJLabelLineStyleMiddle 中间横线 JJLabelLineStyleSlash 斜线
 @param title 文字
 @param color 字体颜色
 @param font 字体
 @return label
 */
+ (UILabel *)labelWithLineAndStyle:(JJLabelLineStyle)style AndTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    UILabel *underlineLabel = [[UILabel alloc] init];
    underlineLabel.textColor = color;
    [underlineLabel addLineWithStyle:style andTitle:title];
    [underlineLabel sizeToFit];
    return underlineLabel;
}


/**
 为label添加划线和文字

 @param style 划线风格 JJLabelLineStyleBottom 下划线 JJLabelLineStyleMiddle 中间横线 JJLabelLineStyleSlash 斜线
 @param title 文字
 */
- (void)addLineWithStyle:(JJLabelLineStyle)style andTitle:(NSString *)title {
    // 下划线
    NSDictionary *attribtDic = nil;
    if (style == JJLabelLineStyleBottom) {
        attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    } else if (style == JJLabelLineStyleMiddle) {
        // 中间划线
        attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    } else {
        // 斜线

    }
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc] initWithString:title attributes:attribtDic];
    //赋值
    self.attributedText = attribtStr;
}


/**
 *  改变行间距
 */
- (void)changeLineSpace:(float)space {
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
}

/**
 *  改变字间距
 */
- (void)changeWordSpace:(float)space {
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
}

/**
 *  改变行间距和字间距
 */
- (void)changeSpaceWithLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = self.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    self.attributedText = attributedString;
}

@end

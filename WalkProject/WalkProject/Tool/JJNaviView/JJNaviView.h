//
//  JJNaviView.h
//  JJBaseExample
//
//  Created by meimi on 2018/1/23.
//  Copyright © 2018年 meimi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JJLEFTTYPEONLYIMAGE,//只有图片
    JJLEFTTYPEONLYTEXT,//只有文字
    JJLEFTTYPEIMAGETEXT,//图片+文字
} JJLEFTTYPE;

@interface JJNaviView : UIView

//电池条view
@property (nonatomic) UIView *batteryView;
//顶栏
@property (nonatomic) UIView *topView;
//标题view
@property (nonatomic) UIView *titleView;
//标题Label
@property (nonatomic) UILabel *titleLabel;
//顶栏左侧view
@property (nonatomic) UIView *leftView;
//顶栏左侧view中icon
@property (nonatomic) UIImageView *leftImageView;
//顶栏左侧view中text
@property (nonatomic) UILabel *leftLabel;
//顶栏右侧view
@property (nonatomic) UIView *rightView;
//顶栏右侧view中icon
@property (nonatomic) UIImageView *rightImageView;
//顶栏右侧view中text
@property (nonatomic) UILabel *rightLabel;
//导航栏底部的线
@property (nonatomic, strong) UIView *lineView;

/*
 导航栏另一种样式
 左边标题的样式
 */
//标题
@property (nonatomic, strong) UILabel * leftTitleLabel;

@property (nonatomic, copy) void(^LeftClickCallBack) (void);

@property (nonatomic, copy) void(^RightClickCallBack) (void);


/**
 * 设置左视图
 */
- (void)showLeft:(JJLEFTTYPE)type;

/**
 * 设置右视图
 */
- (void)showRight:(JJLEFTTYPE)type;

/**
 * 设置标题
 */
- (void)setTitle:(NSString *)title;

/**
 * 设置导航栏左侧的大标题
 */
- (void)setLeftTitle:(NSString *)title;

/**
 * 展示导航栏下分割线
 */
- (void)showLineView;

/**
 * 展示导航栏右侧➕按钮
 */
- (void)showRightAddImageView;

/**
 * 展示导航栏右侧解绑按钮
 */
- (void)showRightUntieButton;

/**
 * 展示导航栏右侧搜索按钮
 */
- (void)showRightSearchImageView;


/**
 * 展示导航栏左侧分类按钮
 */
- (void)showleftCategoryImageView;


/**
 * 展示导航栏右侧购物车按钮
 */
- (void)showRightShopCarImageView;

/**
 * 展示导航栏右侧白色购物车按钮
 */
- (void)showRightWhiteCartImageView;

/**
 * 展示导航栏左侧黑底白色返回按钮
 */
- (void)showleftBlackBackgroundWhiteBackImageView;

/**
 * 展示导航栏右侧黑底白色分享按钮
 */
- (void)showRightShareImageView;

/**
 * 活动页的分享按钮
 */
- (void)showRightActivityShareImageView;

/**
 * 展示导航栏左侧黑色返回按钮
 */
- (void)showleftBlackBackImageView;

/**
 * 展示导航栏右侧黑色分享按钮
 */
- (void)showRightBlackShareImageView;

/**
 * 展示导航栏左侧白色返回按钮
 */
- (void)showleftWhiteBackImageView;


/**
 * 展示导航栏左侧取消按钮
 */
- (void)showLeftCancelButton;

/**
 * 展示品牌商列表导航栏左侧返回按钮
 */
- (void)showLeftBackButton;

/**
 * 展示客服热线右侧电话按钮
 */
- (void)showRightPhoneButton;

/// 右侧白色分享按钮
- (void)showRightWhiteShareImageView;

@end

//
//  JJNaviView.m
//  JJBaseExample
//
//  Created by meimi on 2018/1/23.
//  Copyright © 2018年 meimi. All rights reserved.
//

#import "JJNaviView.h"

#define FONT_LEFTLABEL [UIFont fontWithName:@"Helvetica" size:15]
#define FONT_TITLELABEL [UIFont fontWithName:@"Helvetica" size:17]
#define FONT_RIGHTLABEL [UIFont fontWithName:@"Helvetica" size:15]
//导航栏标题颜色
#define COLOR_NAVI_TITLE [UIColor qmui_colorWithHexString:@"#333333"]
//导航栏底部线条颜色
#define COLOR_NAVI_LINE kLineColorGray

@interface JJNaviView ()

@end

@implementation JJNaviView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self batteryView];
        [self topView];
        [self titleView];
        [self titleLabel];
        [self leftView];
        [self rightView];
        [self lineView];
    }
    return self;
}

#pragma mark - lazy loading -----------------------

- (UIView *)batteryView {
    if (!_batteryView) {
        _batteryView = [[UIView alloc] init];
        _batteryView.backgroundColor = [UIColor clearColor];
        [self addSubview:_batteryView];
        [_batteryView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(kStatusBarHeight);
        }];
    }
    return _batteryView;
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc] init];
        _topView.backgroundColor = [UIColor clearColor];
        [self addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(44);
        }];
    }
    return _topView;
}

- (UIView *)titleView{
    if (!_titleView) {
        _titleView = [[UIView alloc] initWithFrame:CGRectMake(70, 0, SCREEN_WIDTH - 140, 44)];
        [self.topView addSubview:_titleView];
        _titleView.backgroundColor = [UIColor clearColor];
    }
    return _titleView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 140, 44)];
        [self.titleView addSubview:_titleLabel];
        _titleLabel.font = FONT_TITLELABEL;
        _titleLabel.textColor = COLOR_NAVI_TITLE;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIView *)leftView{
    if (!_leftView) {
        _leftView = [[UIView alloc] init];
        [self.topView addSubview:_leftView];
        [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self.titleView.mas_left).mas_equalTo(0);
        }];
    }
    return _leftView;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, 55, 44)];
        [self.leftView addSubview:_leftLabel];
        _leftLabel.font = FONT_LEFTLABEL;
        _leftLabel.textColor = COLOR_NAVI_TITLE;
        _leftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _leftLabel;
}

- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 11.5, 14, 21)];
        [self.leftView addSubview:_leftImageView];
        _leftImageView.image = [UIImage imageNamed:@"back"];
        _leftImageView.contentMode = UIViewContentModeScaleAspectFit;
        
    }
    return _leftImageView;
}

- (UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
        [self.topView addSubview:_rightView];
        [_rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(self.titleView.mas_right).mas_equalTo(0);
        }];
    }
    return _rightView;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 55, 44)];
        [self.rightView addSubview:_rightLabel];
        _rightLabel.font = FONT_RIGHTLABEL;
        _rightLabel.textColor = COLOR_NAVI_TITLE;
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}

- (UIImageView *)rightImageView{
    if (!_rightImageView) {
        _rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(44, 11.5, 14, 21)];
        [self.rightView addSubview:_rightImageView];
        _rightImageView.image = [UIImage imageNamed:@"noImage"];
    }
    return _rightImageView;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        [self addSubview:_lineView];
        _lineView.backgroundColor = COLOR_NAVI_LINE;
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(1);
        }];
        _lineView.hidden = YES;
    }
    return _lineView;
}

- (UILabel *)leftTitleLabel {
    if (!_leftTitleLabel) {
        _leftTitleLabel = [UILabel labelWithTitle:nil color:kTxtColor333333 font:font24];
        [self.topView addSubview:_leftTitleLabel];
        [_leftTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-100);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _leftTitleLabel;
}

#pragma mark - method -----------------------

- (void)showLeft:(JJLEFTTYPE)type{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftTapAction)];
    [self.leftView addGestureRecognizer:tap];
    
    switch (type) {
        case JJLEFTTYPEONLYTEXT:
        {
            [self leftLabel];
        }
            break;
        case JJLEFTTYPEONLYIMAGE:
        {
            [self leftImageView];
        }
            break;
        case JJLEFTTYPEIMAGETEXT:
        {
            [self leftImageView];
            self.leftLabel.frame = CGRectMake(30, 0, 40, 44);
        }
            break;
        default:
            break;
    }
}

- (void)showRight:(JJLEFTTYPE)type{
    UITapGestureRecognizer *tapRight = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightTapAction)];
    [self.rightView addGestureRecognizer:tapRight];
    
    switch (type) {
        case JJLEFTTYPEONLYTEXT:
        {
            [self rightLabel];
        }
            break;
        case JJLEFTTYPEONLYIMAGE:
        {
            [self rightImageView];
        }
            break;
        case JJLEFTTYPEIMAGETEXT:
        {
            [self rightImageView];
            self.rightLabel.frame = CGRectMake(0, 0, 40, 44);
        }
            break;
        default:
            break;
    }
}

- (void)setTitle:(NSString *)title {
    self.titleLabel.text = title;
}

- (void)setLeftTitle:(NSString *)title {
    self.leftView.hidden = YES;
    self.leftTitleLabel.text = title;
}

- (void)leftTapAction{
    if (!self.LeftClickCallBack) {
        [[self parentController].navigationController popViewControllerAnimated:YES];
    }else{
        _LeftClickCallBack();
    }
}

- (void)rightTapAction{
    if (_RightClickCallBack) {
        _RightClickCallBack();
    }
}

- (void)showLineView {
    self.lineView.hidden = NO;
}

- (void)showRightAddImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"mine_card_add"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(19);
    }];
}

- (void)showRightSearchImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"noImage"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-24);
        make.width.height.mas_equalTo(17);
    }];
}

- (void)showRightUntieButton {
    [self showRight:JJLEFTTYPEONLYTEXT];
    self.rightLabel.text = @"解绑";
}

- (void)showleftCategoryImageView{
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.leftImageView.image = [UIImage imageNamed:@"home_top_classify"];
    [self.leftImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(15);
        make.width.height.mas_equalTo(25);
    }];
}


- (void)showRightShopCarImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"home_top_vehicle"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(25);
    }];
}

- (void)showRightWhiteCartImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"mall_cart"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(25);
    }];
}

- (void)showleftBlackBackgroundWhiteBackImageView{
    self.leftImageView.image = [UIImage imageNamed:@"back_btn"];
    [self.leftImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(31);
    }];
}

- (void)showRightShareImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"details_top_share"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.height.mas_equalTo(31);
    }];
}

// 活动页的分享按钮
- (void)showRightActivityShareImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"activity_top_share_button"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(18);
    }];
}

- (void)showleftBlackBackImageView {
    self.leftImageView.image = [UIImage imageNamed:@"back"];
    [self.leftImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(12);
        make.width.mas_equalTo(14);
        make.height.mas_equalTo(21);
    }];
}

- (void)showRightBlackShareImageView {
    self.rightImageView.image = [UIImage imageNamed:@"details_top_share_black"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-10);
        make.width.height.mas_equalTo(20);
    }];
}

- (void)showleftWhiteBackImageView {
    self.leftImageView.image = [UIImage imageNamed:@"back_white"];
}

- (void)showLeftCancelButton {
    [self showLeft:JJLEFTTYPEONLYTEXT];
    [self.leftImageView removeFromSuperview];
    self.leftLabel.text = @"取消";
}

- (void)showLeftBackButton {
    [self showLeft:JJLEFTTYPEONLYIMAGE];
    self.leftImageView.image = [UIImage imageNamed:@"back_btn"];
    [self.leftImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.width.height.mas_equalTo(30);
    }];
}

- (void)showRightPhoneButton {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"phone"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(17);
    }];
}


// 右侧白色分享按钮
- (void)showRightWhiteShareImageView {
    [self showRight:JJLEFTTYPEONLYIMAGE];
    self.rightImageView.image = [UIImage imageNamed:@"share_white"];
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
        make.right.mas_equalTo(-15);
        make.width.height.mas_equalTo(18);
    }];
}

@end

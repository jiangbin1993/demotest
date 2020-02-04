//
//  JJNoDataView.m
//  JJ
//
//  Created by meimi on 2018/9/11.
//  Copyright © 2018年 meimicompany. All rights reserved.
//

#import "JJNoDataView.h"

@interface JJNoDataView ()



@end

@implementation JJNoDataView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self statusImageView];
        [self warningLabel];
        [self button];
        [self.button addTarget:self action:@selector(buttonClickedAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)buttonClickedAction {
    if (_ButtonClickedCallBack) {
        _ButtonClickedCallBack();
    }
}


- (void)showWithType:(JJNoDataType)type {
    
    self.hidden = NO;
    self.button.hidden = YES;

    switch (type) {
        case JJNoDataTypeNoData:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoGood"];
            self.warningLabel.text = @"这里空空的~";
        }
            break;
        case JJNoDataTypeNoAddress:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoAddress"];
            self.warningLabel.text = @"还没有收货地址呢～";
            self.button.hidden = NO;
            [self.button setTitle:@"+ 新增收货地址" forState:UIControlStateNormal];
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(k6sWidth(200));
            }];
        }
            break;
        case JJNoDataTypeNoNetwork:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoNetwork"];
            self.warningLabel.text = @"网络正在开小差";
            
            self.button.hidden = NO;
            [self.button setTitle:@"点击刷新" forState:UIControlStateNormal];
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(k6sWidth(150));
            }];
        }
            break;
        case JJNoDataTypeSearchResultNull:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoGood"];
            self.warningLabel.text = @"没有搜到相关宝贝呢";
        }
            break;
        case JJNoDataTypeMallOrderNull:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoOrder"];
            self.warningLabel.text = @"订单空空如也";
        }
            break;
        case JJNoDataTypeMyCollectNoGoods:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoGood"];
            self.warningLabel.text = @"还没有收藏任何商品呢";
        }
            break;
        
        case JJNoDataTypeNoBankCard:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoCard"];
            self.warningLabel.text = @"还未绑定银行卡哦";
            
            self.button.hidden = NO;
            [self.button setTitle:@"+ 添加银行卡" forState:UIControlStateNormal];
            [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(k6sWidth(200));
            }];
        }
            break;
        case JJNoDataTypeNoFootprintGoods:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoGood"];
            self.warningLabel.text = @"足迹为空";
        }
            break;
        case JJNoDataTypeNoHistoryBill:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoOrder"];
            self.warningLabel.text = @"暂无历史账单";
        }
            break;
        case JJNoDataTypeNoNews:
        {
            self.statusImageView.image = [UIImage imageNamed:@"NoGood"];
            self.warningLabel.text = @"没有消息";
        }
            break;
        case JJNoDataTypeNoComment: {
            self.statusImageView.image = [UIImage imageNamed:@"NoGood"];
            self.warningLabel.text = @"暂无评论哦";
        }
            break;
        case JJNoDataTypeNoExpress: {
            self.statusImageView.image = [UIImage imageNamed:@"NoExpress"];
            self.warningLabel.text = @"暂无物流信息哦";
        }
            break;
    }
}

- (void)hideAction {
    self.hidden = YES;
}

- (UIImageView *)statusImageView {
    if (!_statusImageView) {
        _statusImageView = [[UIImageView alloc] init];
        [self addSubview:_statusImageView];
        [_statusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(-k6sWidth(120));
            make.width.mas_equalTo(k6sWidth(372));
            make.height.mas_equalTo(k6sWidth(150));
        }];
    }
    return _statusImageView;
}

- (UILabel *)warningLabel {
    if (!_warningLabel) {
        _warningLabel = [UILabel labelWithTitle:nil color:[UIColor qmui_colorWithHexString:@"#999999"] font:font14];
        [self addSubview:_warningLabel];
        [_warningLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(k6sWidth(15));
            make.right.mas_equalTo(-k6sWidth(15));
            make.top.mas_equalTo(self.statusImageView.mas_bottom).mas_equalTo(k6sWidth(23));
        }];
        _warningLabel.numberOfLines = 0;
        _warningLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _warningLabel;
}

- (QMUIButton *)button {
    if (!_button) {
        _button = [[QMUIButton alloc] init];
        [self addSubview:_button];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(self.warningLabel.mas_bottom).mas_equalTo(k6sWidth(46));
            make.width.mas_equalTo(k6sWidth(150));
            make.height.mas_equalTo(k6sWidth(44));
        }];
        [_button setTitleColor:[UIColor qmui_colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        _button.titleLabel.font = PingFangMediumFont(15);
        _button.cornerRadius = k6sWidth(22);
        _button.layer.borderWidth = 1;
        _button.layer.borderColor = [UIColor colorWithHexString:@"CCCCCC"].CGColor;
    }
    return _button;
}

@end

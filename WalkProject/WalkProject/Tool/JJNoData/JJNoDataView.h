//
//  JJNoDataView.h
//  JJ
//
//  Created by meimi on 2018/9/11.
//  Copyright © 2018年 meimicompany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    JJNoDataTypeNoData,                // 没有数据
    JJNoDataTypeNoAddress,             // 没有地址
    JJNoDataTypeNoNetwork,             // 没有网络
    JJNoDataTypeSearchResultNull,      // 搜索结果为空
    JJNoDataTypeMallOrderNull,         // 商城订单为空
    JJNoDataTypeMyCollectNoGoods,      // 收藏为空
    JJNoDataTypeShoppingCartNoGoods,   // 购物车为空
    JJNoDataTypeNoBankCard,            // 没有银行卡
    JJNoDataTypeNoFootprintGoods,      // 没有足迹
    JJNoDataTypeNoHistoryBill,         // 没有历史账单
    JJNoDataTypeNoInstalmentRecord,    // 没有粉漆记录
    JJNoDataTypeNoNews,                // 消息为空
    JJNoDataTypeNoComment,             // 评论为空
    JJNoDataTypeNoExpress,             // 没有物流信息
} JJNoDataType;

@interface JJNoDataView : UIView

@property (nonatomic, strong) UIImageView * statusImageView;

@property (nonatomic, strong) UILabel * warningLabel;

@property (nonatomic, strong) QMUIButton * button;

- (void)showWithType:(JJNoDataType)type;

- (void)hideAction;

@property (nonatomic, copy) void(^ButtonClickedCallBack) (void);

@end

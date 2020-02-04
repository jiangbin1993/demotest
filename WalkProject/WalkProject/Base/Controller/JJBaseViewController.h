//
//  JJBaseViewController.h
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JJNaviView.h"
#import "JJNoDataView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JJBaseViewController : UIViewController

// 是否正在刷新
@property (nonatomic, assign) BOOL isRefreshing;
// 是否正在加载
@property (nonatomic, assign) BOOL isLoading;

/* 自定义导航栏 */
@property (nonatomic, strong) JJNaviView * naviView;

/* 空数据界面 */
@property (nonatomic, strong) JJNoDataView * noDataView;

/* 返回到固定界面 */
- (void)popToController:(NSString*)controllerName;

/* 返回到上一页 */
- (void)backPreviousController;

@end

NS_ASSUME_NONNULL_END

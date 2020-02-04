//
//  JJShowNoDataTool.m
//  WeeklyInstallment
//
//  Created by JJ on 2018/12/12.
//  Copyright © 2018年 meimicompany. All rights reserved.
//

#import "JJShowNoDataTool.h"

@implementation JJShowNoDataTool


+ (void)showNoDataViewOnView:(UIView *)view andType:(JJNoDataType)type {
    if ([[view viewWithTag:noDataViewTag] isKindOfClass:[JJNoDataView class]]) {
        JJNoDataView *noDataView = [view viewWithTag:noDataViewTag];
        [noDataView showWithType:type];
        [view bringSubviewToFront:noDataView];
        noDataView.hidden = NO;
    } else {
        JJNoDataView *noDataView = [[JJNoDataView alloc] init];
        [view addSubview:noDataView];
        [noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(view.frame.size.width);
            make.height.mas_equalTo(view.frame.size.height);
        }];
        noDataView.tag = noDataViewTag;
        [noDataView showWithType:type];
        [view bringSubviewToFront:noDataView];
        noDataView.hidden = NO;
    }
}

+ (void)showNoDataViewOnView:(UIView *)view andType:(JJNoDataType)type andClicked:(void(^)(void))clickedCallBack {
    if ([[view viewWithTag:noDataViewTag] isKindOfClass:[JJNoDataView class]]) {
        JJNoDataView *noDataView = [view viewWithTag:noDataViewTag];
        [noDataView showWithType:type];
        [view bringSubviewToFront:noDataView];
        noDataView.hidden = NO;
    } else {
        JJNoDataView *noDataView = [[JJNoDataView alloc] init];
        noDataView.tag = noDataViewTag;
        [view addSubview:noDataView];
        [noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
            make.width.mas_equalTo(view.frame.size.width);
            make.height.mas_equalTo(view.frame.size.height);
        }];
        [noDataView setButtonClickedCallBack:^{
            clickedCallBack();
        }];
        [noDataView showWithType:type];
        [view bringSubviewToFront:noDataView];
        noDataView.hidden = NO;
    }
}

+ (void)hideNoDataViewOnView:(UIView *)view {
    if ([[view viewWithTag:noDataViewTag] isKindOfClass:[JJNoDataView class]]) {
        JJNoDataView *noDataView = [view viewWithTag:noDataViewTag];
        noDataView.hidden = YES;
    }
}

+ (JJNoDataView *)getNoDataViewOnView:(UIView *)view {
    return [view viewWithTag:noDataViewTag];
}

@end

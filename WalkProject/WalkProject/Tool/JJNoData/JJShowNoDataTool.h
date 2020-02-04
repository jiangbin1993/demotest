//
//  JJShowNoDataTool.h
//  WeeklyInstallment
//
//  Created by JJ on 2018/12/12.
//  Copyright © 2018年 meimicompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JJNoDataView.h"

#define noDataViewTag 989

NS_ASSUME_NONNULL_BEGIN

@interface JJShowNoDataTool : NSObject

//tag = 989
+ (void)showNoDataViewOnView:(UIView *)view andType:(JJNoDataType)type;

+ (void)showNoDataViewOnView:(UIView *)view andType:(JJNoDataType)type andClicked:(void(^)(void))clickedCallBack;

+ (void)hideNoDataViewOnView:(UIView *)view;

+ (JJNoDataView *)getNoDataViewOnView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END

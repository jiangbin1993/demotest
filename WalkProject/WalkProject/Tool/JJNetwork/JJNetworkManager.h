//
//  JJNetworkManager.h
//  GaoShanFarm
//
//  Created by meimi on 2018/8/10.
//  Copyright © 2018年 james. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJNetworkManager : NSObject

+ (instancetype)sharedInstance;


/**
 * 拥有loading动画，错误提示
 * @param api 请求api
 * @param successBlock 成功返回Dictionary的block
 * @param failedBlock 失败返回Dictionary的block
 */
- (void)jj_requestWithApi:(__kindof YTKRequest *)api andSuccessBlock:(void(^)(NSDictionary *dictionary,NSString *errNo))successBlock andFailedBlock:(void(^)(id obj))failedBlock;

/**
 * 请求原始数据
 * 拥有错误提示
 * 成功返回完整的数据
 * @param api 请求api
 * @param successBlock 成功返回Dictionary的block
 * @param failedBlock 失败返回block
 */

- (void)jj_requestOriginalDataWithApi:(__kindof YTKRequest *)api successBlock:(void (^)(NSDictionary *dictionary))successBlock failedBlock:(void (^)(id obj))failedBlock;

/**
  取消所有网络请求
 */
+ (void)cancelAllRequest;

@end

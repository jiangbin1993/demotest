//
//  JJAppManager.h
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworkReachabilityManager.h>
//#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJAppManager : NSObject

// 网络状态
@property (nonatomic, assign) AFNetworkReachabilityStatus networkStatus;

// 首页是否准备好
@property (nonatomic, assign) BOOL homePrepare;

// 版本号
@property (nonatomic, strong) NSString * version;

// app在前台时的开始时间（用于统计活跃时长）
@property (nonatomic, strong) NSString * startTime;

/**
 单例
 */
+ (instancetype)shareInstance;

/**
 获取bundleId
 */
+ (NSString *)bundleId;

/**
 获取idfa
 */
+ (NSString *)idfa;

/**
 * 获取手机型号
 */
+ (NSString *)deviceName;

/**
 获取当前版本号
 */
+ (NSString *)appVersion;

/**
 获取当前时间戳 毫秒级13位
 */
+ (NSInteger)getNowTimeTimestamp;

/**
 检查是否是真机
 */
+ (BOOL)checkIfRealDevice;

/**
 * 上传idfa
 */
+ (void)uploadIdfa;

/// 统计活跃时长开始
- (void)activityRecordStart;


/// 统计活跃时长结束
- (void)activityRecordEndCallback:(void(^)(void))callback;

@end

NS_ASSUME_NONNULL_END

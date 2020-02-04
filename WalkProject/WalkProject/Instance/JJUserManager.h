//
//  JJUserManager.h
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JJUserManager : NSObject

+ (instancetype)shareInstance;

/**
 账号密码登录

 @param account 账号
 @param password 密码
 @param successBlock 成功回调
 @param failBlock 失败回调
 */
- (void)accountLoginWithAccount:(NSString *)account password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock:(void(^)(void))failBlock;

- (void)updateUserInfoWithDic:(NSDictionary *)dic;

- (void)loginOut;

- (void)writeUserInfoToDisk;

- (void)clearUserInfo;

@end

NS_ASSUME_NONNULL_END

//
//  JJUserManager.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "JJUserManager.h"

@implementation JJUserManager

+ (instancetype)shareInstance {
    static JJUserManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JJUserManager alloc] init];
    });
    return instance;
}

- (void)updateUserInfoWithDic:(NSDictionary *)dic {
    NSDictionary *userInfo = dic[@"userInfo"];
    
//    if (dic[@"token"]) {
//        self.token = dic[@"token"];
//    } else {
//        self.token = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
//    }
    
    [self writeUserInfoToDisk];
}

// 把用户信息写到本地文件
- (void)writeUserInfoToDisk {
//    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"loginStatus"];
//    [[NSUserDefaults standardUserDefaults] setObject:self.token forKey:@"token"];
//    [[NSUserDefaults standardUserDefaults] setObject:self.userId forKey:@"userId"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)loginOut {
//    SAIFURONGLogoutApiSAIFURONG *api = [[SAIFURONGLogoutApiSAIFURONG alloc] init];
//
//    [[SAIFURONGNetworkManager sharedInstance] jj_requestWithApi:api andSuccessBlock:^(NSDictionary *dictionary, NSString *errNo) {
//        if ([errNo isEqualToString:@"0"]) {
//            // 七鱼客服退出
//            [SAIFURONGQiyuManager logout];
//            // 清除本地用户信息
//            [self clearUserInfo];
//
//            [AppDispatchManager toLoginController];
//        }
//
//    } andFailedBlock:^(id obj) {
//
//    }];
}

- (void)clearUserInfo {
//    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"loginStatus"];
//    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
    
    //退出登录之后要设置这个为no，不然弹窗就不弹了
//    self.token = nil;
//    self.nickname = nil;
//    self.phone = nil;
//    self.creditStatus = @"0";
//    self.userId = nil;
//    self.newUser = 0;
//    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

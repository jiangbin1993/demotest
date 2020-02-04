//
//  JJNetworkManager.m
//  GaoShanFarm
//
//  Created by meimi on 2018/8/10.
//  Copyright © 2018年 james. All rights reserved.
//

#import "JJNetworkManager.h"
#import "JJRequestModel.h"
#import "AppDelegate.h"
#import "JJLoginViewController.h"
#import "JJBaseNavigationController.h"

static JJNetworkManager *_instance = nil;

@implementation JJNetworkManager

+ (instancetype)sharedInstance{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [super allocWithZone:zone];
        }
    });
    return _instance;
}



/**
 * 拥有错误提示
 * @param api 请求api
 * @param successBlock 成功返回Dictionary和错误码的block
 * @param failedBlock 失败返回Dictionary的block
 */
- (void)jj_requestWithApi:(__kindof YTKRequest *)api andSuccessBlock:(void (^)(NSDictionary *, NSString *))successBlock andFailedBlock:(void (^)(id))failedBlock {
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        JJRequestModel *baseModel = [[JJRequestModel alloc] initWithDictionary:request.responseObject error:nil];
        NSLog(@"请求成功==============================\n %@  %@", request, baseModel);
        if (successBlock) {
            successBlock(baseModel.data, baseModel.l_errno);
        }
        
        if (![baseModel.l_errno isEqualToString:@"0"]) {
            [QMUITips showError:baseModel.errmsg];
        }
        
        if ([baseModel.l_errno isEqualToString:@"501"]) {
            [[JJUserManager shareInstance] clearUserInfo];
            // 请登录
            [JJAppDispatchManager toLoginController];
        }
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"请求出错==============================\n %@ ", request);
        
        [QMUITips showError:@"网络或服务器错误！" inView:[UIApplication sharedApplication].delegate.window hideAfterDelay:2.f];
        if(failedBlock) {
            failedBlock(nil);
        }
    }];
}

- (void)jj_requestOriginalDataWithApi:(__kindof YTKRequest *)api successBlock:(void (^)(NSDictionary *dictionary))successBlock failedBlock:(void (^)(id obj))failedBlock {
    [api startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        
        NSLog(@"请求成功==========%@",request);
        if (successBlock) {
            successBlock(request.responseObject);
        }
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"请求出错===================%@",request);
        [QMUITips showError:@"网络或服务器错误！" inView:[UIApplication sharedApplication].delegate.window hideAfterDelay:2.f];
        if(failedBlock) {
            failedBlock(nil);
        }
    }];
}


+ (void)cancelAllRequest {
    [[YTKNetworkAgent sharedAgent] cancelAllRequests];
}

@end

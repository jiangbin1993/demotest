//
//  JJThirdPartyConfigManager.m
//  JJ
//
//  Created by jiangbin on 2019/11/28.
//  Copyright © 2019 meimicompany. All rights reserved.
//

#import "JJThirdPartyConfigManager.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
//#import <UMCommon/UMCommon.h>
//#import <UMAnalytics/MobClick.h>
//#import "JPushManager.h" // 极光推送都用这个工具文件管理了
//#import "JJQiyuManager.h"
//#import <AlipaySDK/AlipaySDK.h>
//#import "JJCommentReplyViewController.h"
//#import "JLRoutes.h"
#import <objc/runtime.h>
//#import "JJNavigationViewController.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>

@implementation JJThirdPartyConfigManager

+ (instancetype)shareManager {
    static JJThirdPartyConfigManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JJThirdPartyConfigManager alloc] init];
    });
    return instance;
}


/// 第三方配置
/// @param launchOptions 启动配置
/// @param type 配置的阶段
- (void)initThirdPartyWithLaunchOptions:(nullable NSDictionary *)launchOptions type:(JJThirdParseConfigPhase)type {
    
    switch (type) {
        case JJThirdParseConfigPhaseAppWillFinishLaunch:
        {
            [self initThirdPartyWhenAppWillFinishLaunchWithLaunchOptions:launchOptions];
        }
            break;
            
        case JJThirdParseConfigPhaseAppDidFinishLaunch:
        {
            [self initThirdPartyWhenAppDidFinishLaunchWithLaunchOptions:launchOptions];
        }
            break;
            
        case JJThirdParseConfigPhaseHomeAppear:
        {
            [self initThirdPartyWhenHomeAppear];
        }
            break;
    }
    
}

// app将要完成启动时配置三方
- (void)initThirdPartyWhenAppWillFinishLaunchWithLaunchOptions:(NSDictionary *)launchOptions {
    // 配置网络请求库
    [self configYTKNetwork];
    // 监测网络状态
    [self observeNetworkState];
}

// app已经完成启动时配置三方
- (void)initThirdPartyWhenAppDidFinishLaunchWithLaunchOptions:(NSDictionary *)launchOptions {
    // wechat
//    [WXApi registerApp:WX_APPID];
    // 极光推送
//    [[JPushManager shareManager] configJPushWithOptions:launchOptions];
    //路由
//    [self registerRouteWithScheme:@"MeimiShopAgain"];
    
    // 友盟 为防止测试污染只统计发布环境的
#ifdef DEBUG
    
#else
//    [self configUMSDK];
#endif
}

// 首页出现时配置三方
- (void)initThirdPartyWhenHomeAppear {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 设置键盘第三方
        [self configKeyboardManager];
        //七鱼客服
//        [JJQiyuManager config];
        // 配置SDWebImage框架
        [self configSDWebImage];
    });
}

// 配置网络请求
- (void)configYTKNetwork {
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = BASE_URL;
}

// 配置SDWebImage框架
- (void)configSDWebImage {
    // 设置sdwebimage在内存中最大像素缓存数量
    [SDImageCache sharedImageCache].maxMemoryCost = 1000 * 1000 * 20;
    // 设置SDWebImage在磁盘中的最大缓存图片大小为100M
    [SDImageCache sharedImageCache].config.maxCacheSize = 1024 * 1024 * 100;
}

// 键盘
- (void)configKeyboardManager {
    IQKeyboardManager *keyboardManager = [IQKeyboardManager sharedManager]; // 获取类库的单例变量
    keyboardManager.enable = YES; // 控制整个功能是否启用
    keyboardManager.shouldResignOnTouchOutside = YES; // 控制点击背景是否收起键盘
    //    keyboardManager.toolbarManageBehaviour = IQAutoToolbarBySubviews; // 有多个输入框时，可以通过点击Toolbar 上的“前一个”“后一个”按钮来实现移动到不同的输入框
    keyboardManager.enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
    keyboardManager.shouldShowToolbarPlaceholder = NO; // 是否显示占位文字
    keyboardManager.keyboardDistanceFromTextField = 10.0f; // 输入框距离键盘的距离
    // 屏蔽下面类的键盘
//    [keyboardManager.disabledDistanceHandlingClasses addObject:[QYSessionViewController class]];
//    [keyboardManager.disabledDistanceHandlingClasses addObject:[JJCommentDetailController class]];
//    [keyboardManager.disabledToolbarClasses addObject:[JJCommentDetailController class]];
//    [keyboardManager.disabledDistanceHandlingClasses addObject:[JJCommentReplyViewController class]];
//    [keyboardManager.disabledToolbarClasses addObject:[JJCommentReplyViewController class]];
//    [keyboardManager.disabledDistanceHandlingClasses addObject:[JJCommentsViewController class]];
//    [keyboardManager.disabledToolbarClasses addObject:[JJCommentsViewController class]];
//    [keyboardManager.disabledDistanceHandlingClasses addObject:[GKPhotoBrowser class]];
//    [keyboardManager.disabledToolbarClasses addObject:[GKPhotoBrowser class]];
    
}

// 监测网络状态
- (void)observeNetworkState {
    
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        [JJAppManager shareInstance].networkStatus = status;
    }];
    [manager startMonitoring];
}

// 配置友盟
//- (void)configUMSDK {
//    [UMConfigure setEncryptEnabled:YES];//打开加密传输
//    [UMConfigure setLogEnabled:YES];//设置打开日志
//    [UMConfigure initWithAppkey:YouMeng_AppKey channel:@"App Store"];
//    [MobClick setScenarioType:E_UM_NORMAL];
//}


//- (void)registerRouteWithScheme:(NSString *)scheme {
//    //RouteOne://push/FirstNextViewController
//    [[JLRoutes routesForScheme:scheme] addRoute:@"/push/:controller" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
//        
//        Class class = NSClassFromString(parameters[@"controller"]);
//        
//        UIViewController *nextVC = [[class alloc] init];
//        
//        [self paramToVc:nextVC param:parameters];
//        UIViewController *currentVc = [self currentViewController];
//        
//        if (currentVc.navigationController) {
//            [currentVc.navigationController pushViewController:nextVC animated:YES];
//        } else {
//            JJNavigationViewController *nav = [[JJNavigationViewController alloc] initWithRootViewController:nextVC];
//            [currentVc presentViewController:nav animated:YES completion:nil];
//        }
//        
//        return YES;
//    }];
//}

//确定是哪个viewcontroller
- (UIViewController *)currentViewController {
    
    UIViewController * currVC = nil;
    UIViewController * Rootvc = [UIApplication sharedApplication].delegate.window.rootViewController ;
    do {
        if ([Rootvc isKindOfClass:[UINavigationController class]]) {
            UINavigationController * nav = (UINavigationController *)Rootvc;
            UIViewController * v = [nav.viewControllers lastObject];
            currVC = v;
            Rootvc = v.presentedViewController;
            continue;
        }else if([Rootvc isKindOfClass:[UITabBarController class]]){
            UITabBarController * tabVC = (UITabBarController *)Rootvc;
            currVC = tabVC;
            Rootvc = [tabVC.viewControllers objectAtIndex:tabVC.selectedIndex];
            continue;
        } else if([Rootvc isKindOfClass:[UIViewController class]]){
            currVC = Rootvc;
            Rootvc = nil;
        }
    } while (Rootvc!=nil);
    
    return currVC;
}

//传参数
- (void)paramToVc:(UIViewController *) v param:(NSDictionary<NSString *,NSString *> *)parameters {
    //        runtime将参数传递至需要跳转的控制器
    unsigned int outCount = 0;
    objc_property_t * properties = class_copyPropertyList(v.class , &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        NSString *key = [NSString stringWithUTF8String:property_getName(property)];
        NSString *param = parameters[key];
        if (param != nil) {
            [v setValue:param forKey:key];
        }
    }
}

@end

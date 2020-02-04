//
//  JJThirdPartyConfigManager.h
//  JJ
//
//  Created by jiangbin on 2019/11/28.
//  Copyright © 2019 meimicompany. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    JJThirdParseConfigPhaseAppWillFinishLaunch,
    JJThirdParseConfigPhaseAppDidFinishLaunch,
    JJThirdParseConfigPhaseHomeAppear
} JJThirdParseConfigPhase;

@interface JJThirdPartyConfigManager : NSObject

/**
 单例
 */
+ (instancetype)shareManager;



/// 第三方配置
/// @param launchOptions 启动配置
/// @param type 配置的阶段
- (void)initThirdPartyWithLaunchOptions:(nullable NSDictionary *)launchOptions type:(JJThirdParseConfigPhase)type;


@end

NS_ASSUME_NONNULL_END

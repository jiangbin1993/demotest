//
//  JJAppManager.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "JJAppManager.h"
#import <AdSupport/AdSupport.h>
#import <sys/utsname.h>

@implementation JJAppManager

+ (instancetype)shareInstance {
    static JJAppManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[JJAppManager alloc] init];
    });
    return instance;
}

+ (NSString *)bundleId {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)appVersion {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    if (infoDic && infoDic[@"CFBundleShortVersionString"])
    {
        return infoDic[@"CFBundleShortVersionString"];
    }
    return @"1.0.0";
}

+ (NSString *)idfa {
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    // 用户关闭了广告跟踪后 得到的idfa是00000-0000000-0000000
    if (!idfa) {
        idfa = [NSNull null];
    }
    return idfa;
}

// 返回13位时间戳
+ (NSInteger)getNowTimeTimestamp {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSInteger timeSp = (long)[datenow timeIntervalSince1970] * 1000;
    
    return timeSp;
}



+ (BOOL)checkIfRealDevice {
    if (TARGET_IPHONE_SIMULATOR == 1 && TARGET_OS_IPHONE == 1) {
        //模拟器
        return NO;
    } else {
        //真机
        return YES;
    }
}


//+ (void)uploadIdfa {
//    SAIFURONGUploadIdfaApi *api = [[SAIFURONGUploadIdfaApi alloc] init];
//    [[SAIFURONGNetworkManager sharedInstance] jj_requestWithApi:api andSuccessBlock:^(NSDictionary *dictionary, NSString *errNo) {
//
//    } andFailedBlock:^(id obj) {
//
//    }];
//}

+ (NSString *)deviceName {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *model = [NSString stringWithCString: systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([model isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([model isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([model isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([model isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([model isEqualToString:@"iPhone3,2"])    return @"iPhone 4 Verizon";
    if ([model isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([model isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
    if ([model isEqualToString:@"iPhone5,3"])    return @"iPhone 5c";
    if ([model isEqualToString:@"iPhone5,4"])    return @"iPhone 5c";
    if ([model isEqualToString:@"iPhone6,1"])    return @"iPhone 5s";
    if ([model isEqualToString:@"iPhone6,2"])    return @"iPhone 5s";
    if ([model isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([model isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([model isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([model isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([model isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    if ([model isEqualToString:@"iPhone9,1"])    return @"iPhone 7";
    if ([model isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus";
    if ([model isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
    if ([model isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
    if ([model isEqualToString:@"iPhone10,1"])   return @"iPhone 8 Global";
    if ([model isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus Global";
    if ([model isEqualToString:@"iPhone10,3"])   return @"iPhone X Global";
    if ([model isEqualToString:@"iPhone10,4"])   return @"iPhone 8 GSM";
    if ([model isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus GSM";
    if ([model isEqualToString:@"iPhone10,6"])   return @"iPhone X GSM";
    
    if ([model isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
    if ([model isEqualToString:@"iPhone11,4"])   return @"iPhone XS Max (China)";
    if ([model isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
    if ([model isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
    
    if ([model isEqualToString:@"i386"])         return @"Simulator 32";
    if ([model isEqualToString:@"x86_64"])       return @"Simulator 64";
    
    if ([model isEqualToString:@"iPad1,1"]) return @"iPad";
    if ([model isEqualToString:@"iPad2,1"] ||
        [model isEqualToString:@"iPad2,2"] ||
        [model isEqualToString:@"iPad2,3"] ||
        [model isEqualToString:@"iPad2,4"]) return @"iPad 2";
    if ([model isEqualToString:@"iPad3,1"] ||
        [model isEqualToString:@"iPad3,2"] ||
        [model isEqualToString:@"iPad3,3"]) return @"iPad 3";
    if ([model isEqualToString:@"iPad3,4"] ||
        [model isEqualToString:@"iPad3,5"] ||
        [model isEqualToString:@"iPad3,6"]) return @"iPad 4";
    if ([model isEqualToString:@"iPad4,1"] ||
        [model isEqualToString:@"iPad4,2"] ||
        [model isEqualToString:@"iPad4,3"]) return @"iPad Air";
    if ([model isEqualToString:@"iPad5,3"] ||
        [model isEqualToString:@"iPad5,4"]) return @"iPad Air 2";
    if ([model isEqualToString:@"iPad6,3"] ||
        [model isEqualToString:@"iPad6,4"]) return @"iPad Pro 9.7-inch";
    if ([model isEqualToString:@"iPad6,7"] ||
        [model isEqualToString:@"iPad6,8"]) return @"iPad Pro 12.9-inch";
    if ([model isEqualToString:@"iPad6,11"] ||
        [model isEqualToString:@"iPad6,12"]) return @"iPad 5";
    if ([model isEqualToString:@"iPad7,1"] ||
        [model isEqualToString:@"iPad7,2"]) return @"iPad Pro 12.9-inch 2";
    if ([model isEqualToString:@"iPad7,3"] ||
        [model isEqualToString:@"iPad7,4"]) return @"iPad Pro 10.5-inch";
    
    if ([model isEqualToString:@"iPad2,5"] ||
        [model isEqualToString:@"iPad2,6"] ||
        [model isEqualToString:@"iPad2,7"]) return @"iPad mini";
    if ([model isEqualToString:@"iPad4,4"] ||
        [model isEqualToString:@"iPad4,5"] ||
        [model isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    if ([model isEqualToString:@"iPad4,7"] ||
        [model isEqualToString:@"iPad4,8"] ||
        [model isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    if ([model isEqualToString:@"iPad5,1"] ||
        [model isEqualToString:@"iPad5,2"]) return @"iPad mini 4";
    
    if ([model isEqualToString:@"iPod1,1"]) return @"iTouch";
    if ([model isEqualToString:@"iPod2,1"]) return @"iTouch2";
    if ([model isEqualToString:@"iPod3,1"]) return @"iTouch3";
    if ([model isEqualToString:@"iPod4,1"]) return @"iTouch4";
    if ([model isEqualToString:@"iPod5,1"]) return @"iTouch5";
    if ([model isEqualToString:@"iPod7,1"]) return @"iTouch6";
    
    return [NSString stringWithFormat:@"%@",model];
}


/// 统计活跃时长开始
- (void)activityRecordStart {
    // 没有登陆的不统计
//    if ([JJUserManager shareInstance].token.length == 0) {
//        return;
//    }
//
//    JJUserActivityRecordCreateApi *api = [[JJUserActivityRecordCreateApi alloc] init];
//    [[SAIFURONGNetworkManager sharedInstance] lcy_requestWithApi:api andSuccessBlock:^(NSDictionary *dictionary) {
//        NSString *value = dictionary[@"startTime"];
//        if (value.length > 0) {
//            self.startTime = value;
//        }
//    } andFailedBlock:nil];
}

/// 统计活跃时长结束
- (void)activityRecordEndCallback:(void (^)(void))callback {
    // 没有登陆或者没有开始时间的不统计
//    if ([UserManager shareInstance].token.length == 0 || self.startTime.length == 0) {
//        if (callback) {
//            callback();
//        }
//        return;
//    }
//    JJUserActivityRecordUpdateApi *api = [[JJUserActivityRecordUpdateApi alloc] initWithStartTime:self.startTime];
//    [[SAIFURONGNetworkManager sharedInstance] lcy_requestWithApi:api andSuccessBlock:^(NSDictionary *dictionary) {
//        if (callback) {
//            callback();
//        }
//    } andFailedBlock:^(id obj) {
//        if (callback) {
//            callback();
//        }
//    }];
}

@end

//
//  JJAppDispatchManager.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "JJAppDispatchManager.h"
#import "JJLoginViewController.h"
#import "JJBaseNavigationController.h"
#import "AppDelegate.h"

@implementation JJAppDispatchManager

// 设置根控制器到登录界面
+ (void)toLoginController {
    
    JJLoginViewController *vc = [[JJLoginViewController alloc] init];
    JJBaseNavigationController *nav = [[JJBaseNavigationController alloc] initWithRootViewController:vc];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = nav;
}

@end

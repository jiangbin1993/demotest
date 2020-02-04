//
//  JJBaseNavigationController.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "JJBaseNavigationController.h"

@interface JJBaseNavigationController ()

@end

@implementation JJBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
}

- (UIInterfaceOrientationMask) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

@end

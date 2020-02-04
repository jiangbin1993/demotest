//
//  JJBaseViewController.m
//  WalkProject
//
//  Created by jiangbin on 2020/2/4.
//  Copyright © 2020 jiangbin. All rights reserved.
//

#import "JJBaseViewController.h"

@interface JJBaseViewController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate>

@end

@implementation JJBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [MobClick beginLogPageView:NSStringFromClass([self class])];
    [self.view bringSubviewToFront:self.naviView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    [MobClick endLogPageView:NSStringFromClass([self class])];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    self.view.backgroundColor = kBackgroundColor;
    self.automaticallyAdjustsScrollViewInsets = NO;
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self initNaviView];
    [self initNoDataView];
    self.modalPresentationStyle = UIModalPresentationNone;
}

- (void)initNaviView {
    self.naviView = [[JJNaviView alloc] init];
    [self.view addSubview:self.naviView];
    [self.naviView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(kStatusBarAndNavigationBarHeight);
    }];
    [self.naviView showLeft:JJLEFTTYPEONLYIMAGE];
}

- (void)initNoDataView {
    self.noDataView = [[JJNoDataView alloc] init];
    [self.view addSubview:self.noDataView];
    [self.noDataView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(0);
    }];
    self.noDataView.hidden = YES;
}

// 隐藏iphonex的底部条 点击屏幕会自动显示
- (BOOL)prefersHomeIndicatorAutoHidden{
    return YES;
}

/*返回到固定界面 如果没有这个页面则直接返回*/
- (void)popToController:(NSString *)controllerName {
    Class class = NSClassFromString(controllerName);
    id controller = [[class alloc] init];
    NSArray *temArray = self.navigationController.viewControllers;
    for (UIViewController *temVC in temArray) {
        if ([temVC isKindOfClass:[controller class]]) {
            [self.navigationController popToViewController:temVC animated:YES];
            return;
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 * 返回到上一页 自动区分是pop还是dismiss
 */
- (void)backPreviousController {
    if (!self.navigationController || [self.navigationController.viewControllers.firstObject isEqual:self]) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - UIGestureRecognizerDelegate--防止导航的根控制器滑动手势卡死问题

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return self.navigationController.childViewControllers.count > 1;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


@end

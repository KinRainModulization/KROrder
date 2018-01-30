//
//  KROrderPayController.m
//  KROrder
//
//  Created by LX on 2018/1/26.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderPayController.h"
#import "KROrderPayView.h"
#import "KROrderPaySuccessVC.h"

@interface KROrderPayController ()

@property (nonatomic, strong) KROrderPayView *orderPayView;

@end

@implementation KROrderPayController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"支付订单";
    [self.view addSubview:self.orderPayView];
    WEAK_SELF
    _orderPayView.orderPayBlock = ^{
        [weakSelf orderPayBtnClick];
    };
}

- (void)orderPayBtnClick {
    [self.navigationController pushViewController:[[KROrderPaySuccessVC alloc] init] animated:YES];
}

- (KROrderPayView *)orderPayView {
    if (!_orderPayView) {
        _orderPayView = [[KROrderPayView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAV_BAR_HEIGHT)];
    }
    return _orderPayView;
}

@end

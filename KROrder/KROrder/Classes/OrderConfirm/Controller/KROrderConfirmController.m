//
//  KROrderConfirmController.m
//  KROrder
//
//  Created by LX on 2018/1/23.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderConfirmController.h"
#import "KROrderConfirmView.h"

@interface KROrderConfirmController ()

@property (nonatomic, strong) KROrderConfirmView *orderConfirmView;

@end

@implementation KROrderConfirmController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"确认订单";
    [self.view addSubview:self.orderConfirmView];
    
}

- (KROrderConfirmView *)orderConfirmView {
    if (!_orderConfirmView) {
        _orderConfirmView = [[KROrderConfirmView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAV_BAR_HEIGHT)];
    }
    return _orderConfirmView;
}

@end

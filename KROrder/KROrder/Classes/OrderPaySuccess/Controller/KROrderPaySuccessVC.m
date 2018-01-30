//
//  KROrderPaySuccessVC.m
//  KROrder
//
//  Created by LX on 2018/1/26.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderPaySuccessVC.h"
#import "KROrderPaySuccessView.h"

@interface KROrderPaySuccessVC ()

@property (nonatomic, strong) KROrderPaySuccessView *paySuccessView;

@end

@implementation KROrderPaySuccessVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = GLOBAL_BACKGROUND_COLOR;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.paySuccessView];
}

- (KROrderPaySuccessView *)paySuccessView {
    if (!_paySuccessView) {
        _paySuccessView = [[KROrderPaySuccessView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAV_BAR_HEIGHT)];
    }
    return _paySuccessView;
}

@end

//
//  KROrderConfirmView.m
//  KROrder
//
//  Created by LX on 2018/1/24.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderConfirmView.h"

@interface KROrderConfirmView ()

@property (nonatomic, strong) UILabel *totalPriceLabel;
@property (nonatomic, strong) UIButton *payBtn;
@end

@implementation KROrderConfirmView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        MLog(@"Frame=%@",NSStringFromCGRect(self.frame));
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];

    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];

    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottomView];
    [bottomView addSubview:self.totalPriceLabel];
    [bottomView addSubview:self.payBtn];

    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self);
        make.bottom.equalTo(bottomView.mas_top);
    }];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.width.equalTo(scrollView);
    }];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(self);
        make.height.mas_equalTo(50);
    }];
    [_totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bottomView);
        make.leading.equalTo(bottomView).offset(12);
        make.trailing.equalTo(_payBtn.mas_leading);
    }];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.trailing.bottom.equalTo(bottomView);
        make.width.mas_equalTo(140);
    }];
    
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(700);
    }];
}

#pragma mark - Action

- (void)payButtonClick {
    MLog(@"payButtonClick");
}

#pragma mark - Setter/Getter

- (UILabel *)totalPriceLabel {
    if (!_totalPriceLabel) {
        _totalPriceLabel = [UILabel labelWithText:@"合计：" textColor:FONT_COLOR_33 fontSize:14];
    }
    return _totalPriceLabel;
}

- (UIButton *)payBtn {
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithTitle:@"立即支付" fontSize:16 titleColor:[UIColor whiteColor] target:self action:@selector(payButtonClick)];
        _payBtn.backgroundColor = GLOBAL_COLOR;
    }
    return _payBtn;
}

@end

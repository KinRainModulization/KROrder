//
//  KROrderPayView.m
//  KROrder
//
//  Created by LX on 2018/1/26.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderPayView.h"
#import <KRCustomPriceView.h>

@interface KROrderPayView ()

@property (nonatomic, strong) UILabel *orderIDLabel;

@property (nonatomic, strong) KRCustomPriceView *priceView;

@property (nonatomic, strong) UIButton *wechatBtn;

@property (nonatomic, strong) UIButton *alipayBtn;

@property (nonatomic, strong) UIButton *payBtn;

@property (nonatomic, assign) OrderPayType payType;

@end

@implementation KROrderPayView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor whiteColor];
    [self addSubview:scrollView];
    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    UILabel *orderTitleLabel = [UILabel labelWithText:@"订单编号" textColor:FONT_COLOR_33 fontSize:14];
    [contentView addSubview:orderTitleLabel];
    [contentView addSubview:self.orderIDLabel];
    UILabel *priceTitleLabel = [UILabel labelWithText:@"应付金额" textColor:FONT_COLOR_33 fontSize:14];
    [contentView addSubview:priceTitleLabel];
    [contentView addSubview:self.priceView];
    UIView *bgView = [[UIView alloc] init];
    bgView.backgroundColor = GLOBAL_BACKGROUND_COLOR;
    [contentView addSubview:bgView];
    UILabel *payTitleLabel = [UILabel labelWithText:@"选择支付方式" textColor:FONT_COLOR_99 fontSize:12];
    [bgView addSubview:payTitleLabel];
    [contentView addSubview:self.wechatBtn];
    [contentView addSubview:self.alipayBtn];
    UIView *shadowView = [[UIView alloc] init];
    shadowView.layer.shadowColor = RGB(74, 208, 237).CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(0, 5);
    shadowView.layer.shadowOpacity = 0.4;
    shadowView.layer.cornerRadius = 25;
    [contentView addSubview:shadowView];
    [shadowView addSubview:self.payBtn];

    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.width.equalTo(scrollView);
    }];
    [orderTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView);
        make.leading.equalTo(contentView).offset(12);
        make.height.mas_equalTo(40);
    }];
    [_orderIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(orderTitleLabel);
        make.trailing.equalTo(contentView).offset(-12);
    }];
    [priceTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderTitleLabel.mas_bottom);
        make.leading.height.equalTo(orderTitleLabel);
    }];
    [_priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(priceTitleLabel);
        make.trailing.equalTo(contentView).offset(-12);
        make.size.mas_equalTo(_priceView.size);
    }];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(priceTitleLabel.mas_bottom);
        make.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(30);
    }];
    [payTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.leading.equalTo(bgView).offset(12);
    }];
    [_wechatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom);
        make.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(50);
    }];
    [_alipayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_wechatBtn.mas_bottom);
        make.leading.trailing.height.equalTo(_wechatBtn);
    }];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alipayBtn.mas_bottom).offset(50);
        make.leading.equalTo(contentView).offset(12);
        make.trailing.equalTo(contentView).offset(-12);
        make.height.mas_equalTo(50);
    }];
    [_payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(shadowView);
    }];
    
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(700);
    }];
}

- (UIButton *)createPayButtonWithImage:(NSString *)imageStr title:(NSString *)title tag:(NSInteger)tag {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"ic_unchecked_gray"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateSelected];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 12);
    button.tag = tag;
    [button addTarget:self action:@selector(selectPayType:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageStr]];
    [button addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.leading.equalTo(button).offset(12);
    }];
    UILabel *titleLabel = [UILabel labelWithText:title textColor:FONT_COLOR_33 fontSize:14];
    [button addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconView);
        make.leading.equalTo(iconView.mas_trailing).offset(15);
    }];
    return button;
}

- (void)selectPayType:(UIButton *)button {
    _payType = (int)button.tag;
    _wechatBtn.selected = _payType == OrderPayTypeWechat;
    _alipayBtn.selected = _payType == OrderPayTypeAlipay;
}

- (void)payBtnClick {
    self.orderPayBlock();
}

- (UILabel *)orderIDLabel {
    if (!_orderIDLabel) {
        _orderIDLabel = [UILabel labelWithText:@"13213212" textColor:FONT_COLOR_99 fontSize:14];
    }
    return _orderIDLabel;
}

- (KRCustomPriceView *)priceView {
    if (!_priceView) {
        _priceView = [KRCustomPriceView customPriceViewWithPrice:@"100.00" integerFontSize:18 decimalFontSize:14];
    }
    return _priceView;
}

- (UIButton *)wechatBtn {
    if (!_wechatBtn) {
        _wechatBtn = [self createPayButtonWithImage:@"ic_wxpay" title:@"微信支付" tag:1];
    }
    return _wechatBtn;
}

- (UIButton *)alipayBtn {
    if (!_alipayBtn) {
        _alipayBtn = [self createPayButtonWithImage:@"ic_alipay" title:@"支付宝支付" tag:2];
    }
    return _alipayBtn;
}

- (UIButton *)payBtn {
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithCornerRadius:25 title:@"确认支付" fontSize:16 titleColor:[UIColor whiteColor] backgroundColor:GLOBAL_COLOR target:self action:@selector(payBtnClick)];
    }
    return _payBtn;
}

@end

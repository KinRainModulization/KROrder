//
//  KROrderPaySuccessView.m
//  KROrder
//
//  Created by LX on 2018/1/26.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderPaySuccessView.h"

@interface KROrderPaySuccessView ()

@property (nonatomic, strong) UIButton *storeBtn;

@property (nonatomic, strong) UIButton *orderBtn;

@end

@implementation KROrderPaySuccessView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_payment_succeed"]];
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(3);
        make.centerX.equalTo(self);
    }];
    
    UILabel *titleLabel = [UILabel labelWithText:@"支付成功" textColor:FONT_COLOR_33 fontSize:14];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconView.mas_bottom).offset(16);
        make.centerX.equalTo(self);
    }];
    
    UILabel *subtitleLabel = [UILabel labelWithText:@"到店服务后，可前往“服务”页查看服务记录" textColor:FONT_COLOR_99 fontSize:12];
    [self addSubview:subtitleLabel];
    [subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(38);
        make.centerX.equalTo(self);
    }];
    
    UIView *shadowView = [[UIView alloc] init];
    shadowView.layer.shadowColor = RGB(74, 208, 237).CGColor;
    shadowView.layer.shadowOffset = CGSizeMake(0, 5);
    shadowView.layer.shadowOpacity = 0.4;
    shadowView.layer.cornerRadius = 25;
    [self addSubview:shadowView];
    [shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(subtitleLabel.mas_bottom).offset(40);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(220, 50));
    }];
    [shadowView addSubview:self.storeBtn];
    [_storeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(shadowView);
    }];
    
    [self addSubview:self.orderBtn];
    [_orderBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shadowView.mas_bottom).offset(23);
        make.centerX.width.height.equalTo(_storeBtn);
    }];
}

- (void)storeBtnClick {
    MLog(@"storeBtnClick");
}

- (void)orderBtnClick {
    MLog(@"orderBtnClick");
}

- (UIButton *)storeBtn {
    if (!_storeBtn) {
        _storeBtn = [UIButton buttonWithCornerRadius:25 title:@"返回店铺" fontSize:16 titleColor:[UIColor whiteColor] backgroundColor:GLOBAL_COLOR target:self action:@selector(storeBtnClick)];
    }
    return _storeBtn;
}

- (UIButton *)orderBtn {
    if (!_orderBtn) {
        _orderBtn = [UIButton buttonWithCornerRadius:25 borderColor:GLOBAL_COLOR title:@"查看订单" fontSize:16 titleColor:GLOBAL_COLOR backgroundColor:[UIColor whiteColor] target:self action:@selector(orderBtnClick)];
    }
    return _orderBtn;
}
@end

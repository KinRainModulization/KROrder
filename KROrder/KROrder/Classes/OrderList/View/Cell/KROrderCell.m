//
//  KROrderCell.m
//  KROrder
//
//  Created by LX on 2018/1/23.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderCell.h"
#import <KRCustomPriceView.h>

@interface KROrderCell ()

@property (nonatomic, strong) UIButton *contentBtn;

@property (nonatomic, strong) UIImageView *productImgView;

@property (nonatomic, strong) UILabel *productNameLabel;

@property (nonatomic, strong) UILabel *attrLabel;

@property (nonatomic, strong) KRCustomPriceView *priceView;

@property (nonatomic, strong) UILabel *quantityLabel;

@end

@implementation KROrderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.contentBtn];
    [_contentBtn addSubview:self.productImgView];
    [_contentBtn addSubview:self.productNameLabel];
    [_contentBtn addSubview:self.attrLabel];
    [_contentBtn addSubview:self.priceView];
    [_contentBtn addSubview:self.quantityLabel];
    
    [_contentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(15, 12, 0, 12));
    }];
    [_productImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.leading.equalTo(_contentBtn);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    [_productNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_productImgView).offset(4.5);
        make.leading.equalTo(_productImgView.mas_trailing).offset(15);
        make.trailing.equalTo(_contentBtn);
    }];
    [_attrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_productNameLabel.mas_bottom).offset(9);
        make.leading.equalTo(_productNameLabel);
    }];
    [_priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(_productNameLabel);
        make.bottom.equalTo(_productImgView).offset(-4.5);
        make.size.mas_equalTo(_priceView.size);
    }];
    [_quantityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(_contentBtn);
        make.bottom.equalTo(_priceView);
    }];
}

- (void)setMarginTop:(CGFloat)marginTop {
    _marginTop = marginTop;
    [self.contentBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(marginTop);
    }];
}

- (void)setMarginBottom:(CGFloat)marginBottom {
    _marginBottom = marginBottom;
    [self.contentBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-marginBottom);
    }];
}

- (UIButton *)contentBtn {
    if (!_contentBtn) {
        _contentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _contentBtn;
}

- (UIImageView *)productImgView {
    if (!_productImgView) {
        _productImgView = [[UIImageView alloc] init];
        _productImgView.layer.cornerRadius = 5;
        _productImgView.clipsToBounds = YES;
        
        _productImgView.backgroundColor = GLOBAL_COLOR;
    }
    return _productImgView;
}

- (UILabel *)productNameLabel {
    if (!_productNameLabel) {
        _productNameLabel = [UILabel labelWithText:@"项目名" textColor:FONT_COLOR_33 fontSize:16];
        _productNameLabel.numberOfLines = 1;
    }
    return _productNameLabel;
}

- (UILabel *)attrLabel {
    if (!_attrLabel) {
        _attrLabel = [UILabel labelWithText:@"套餐：" textColor:FONT_COLOR_99 fontSize:12];
    }
    return _attrLabel;
}

- (KRCustomPriceView *)priceView {
    if (!_priceView) {
        _priceView = [KRCustomPriceView customPriceViewWithPrice:@"100.00" integerFontSize:14 decimalFontSize:12];
    }
    return _priceView;
}

- (UILabel *)quantityLabel {
    if (!_quantityLabel) {
        _quantityLabel = [UILabel labelWithText:@"X 1" textColor:FONT_COLOR_99 fontSize:12];
    }
    return _quantityLabel;
}

@end

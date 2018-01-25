//
//  KROrderConfirmView.m
//  KROrder
//
//  Created by LX on 2018/1/24.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderConfirmView.h"
#import <KRArrowIconRowView.h>

@interface KROrderConfirmView ()

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UIButton *selectWomanBtn;
@property (nonatomic, strong) UIButton *selectManBtn;
@property (nonatomic, strong) UITextField *phoneTextField;

@property (nonatomic, strong) KRArrowIconRowView *storeNameView;

@property (nonatomic, strong) UILabel *totalPriceLabel;
@property (nonatomic, strong) UIButton *payBtn;

@property (nonatomic, weak) UIButton *selectBtn;
@end

@implementation KROrderConfirmView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self prepareUI];
    }
    return self;
}

- (void)prepareUI {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];
    UIView *contentView = [[UIView alloc] init];
    [scrollView addSubview:contentView];
    
    UIView *userInfoView = [[UIView alloc] init];
    userInfoView.backgroundColor = [UIColor whiteColor];
    [contentView addSubview:userInfoView];
    UILabel *nameLabel = [UILabel labelWithText:@"姓名：" textColor:FONT_COLOR_33 fontSize:14];
    [userInfoView addSubview:nameLabel];
    [userInfoView addSubview:self.nameTextField];
    UIView *genderView = [[UIView alloc] init];
    [userInfoView addSubview:genderView];
    [genderView addSubview:self.selectWomanBtn];
    [genderView addSubview:self.selectManBtn];
    UILabel *phoneLabel = [UILabel labelWithText:@"电话：" textColor:FONT_COLOR_33 fontSize:14];
    [userInfoView addSubview:phoneLabel];
    [userInfoView addSubview:self.phoneTextField];
    [contentView addSubview:self.storeNameView];

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
    [userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(contentView).offset(10);
        make.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(150);
    }];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView);
        make.leading.equalTo(userInfoView).offset(12);
        make.height.mas_equalTo(50);
    }];
    [nameLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(nameLabel);
        make.leading.equalTo(nameLabel.mas_trailing);
        make.trailing.equalTo(userInfoView).offset(-12);
    }];
    [genderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameTextField.mas_bottom);
        make.leading.equalTo(userInfoView).offset(12);
        make.trailing.equalTo(userInfoView).offset(-12);
        make.height.mas_equalTo(50);
    }];
    [_selectWomanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(genderView);
        make.leading.equalTo(_nameTextField);
        make.width.mas_equalTo(53);
    }];
    [_selectManBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.width.equalTo(_selectWomanBtn);
        make.leading.equalTo(_selectWomanBtn.mas_trailing).offset(46);
    }];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(genderView.mas_bottom);
        make.leading.height.equalTo(nameLabel);
    }];
    [phoneLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(phoneLabel);
        make.leading.equalTo(phoneLabel.mas_trailing);
        make.trailing.equalTo(userInfoView).offset(-12);
    }];
    [_storeNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView.mas_bottom).offset(10);
        make.leading.trailing.equalTo(contentView);
        make.height.mas_equalTo(50);
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
    
    
    [self layoutIfNeeded];
    CALayer *nameLineLayer = [self createLineLayerWithFrame:CGRectMake(0, _nameTextField.height, _nameTextField.width, 0.5)];
    [_nameTextField.layer addSublayer:nameLineLayer];
    CALayer *genderLineLayer = [self createLineLayerWithFrame:CGRectMake(0, genderView.height, genderView.width, 0.5)];
    [genderView.layer addSublayer:genderLineLayer];
}

- (CALayer *)createLineLayerWithFrame:(CGRect)frame {
    CALayer *lineLayer = [CALayer layer];
    lineLayer.backgroundColor = GRAY_LINE_COLOR.CGColor;
    lineLayer.frame = frame;
    return lineLayer;
}

#pragma mark - Action

- (void)payButtonClick {
    MLog(@"payButtonClick");
}

- (void)selectGender:(UIButton *)button {
    _selectBtn.selected = !_selectBtn.selected;
    
    _selectBtn = button;
    _selectBtn.selected = YES;
}

#pragma mark - Setter/Getter

- (UITextField *)nameTextField {
    if (!_nameTextField) {
        _nameTextField = [UITextField textFieldWithPlaceholder:@"输入姓名，方便商家与您联系" fontSize:14 textColor:FONT_COLOR_33 keyboardType:UIKeyboardTypeDefault];
    }
    return _nameTextField;
}

- (UIButton *)selectWomanBtn {
    if (!_selectWomanBtn) {
        _selectWomanBtn = [UIButton buttonWithTitle:@"女士" fontSize:14 titleColor:FONT_COLOR_33 target:self action:@selector(selectGender:)];
        [_selectWomanBtn setImage:[UIImage imageNamed:@"ic_unchecked_gray"] forState:UIControlStateNormal];
        [_selectWomanBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateSelected];
        _selectWomanBtn.tag = 1;
        [_selectWomanBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 7.5, 0, 0)];
    }
    return _selectWomanBtn;
}

- (UIButton *)selectManBtn {
    if (!_selectManBtn) {
        _selectManBtn = [UIButton buttonWithTitle:@"先生" fontSize:14 titleColor:FONT_COLOR_33 target:self action:@selector(selectGender:)];
        [_selectManBtn setImage:[UIImage imageNamed:@"ic_unchecked_gray"] forState:UIControlStateNormal];
        [_selectManBtn setImage:[UIImage imageNamed:@"ic_checked"] forState:UIControlStateSelected];
        _selectManBtn.tag = 2;
        [_selectManBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 7.5, 0, 0)];
    }
    return _selectManBtn;
}

- (UITextField *)phoneTextField {
    if (!_phoneTextField) {
        _phoneTextField = [UITextField textFieldWithPlaceholder:@"" fontSize:14 textColor:FONT_COLOR_33 keyboardType:UIKeyboardTypeNumberPad];
    }
    return _phoneTextField;
}

- (KRArrowIconRowView *)storeNameView {
    if (!_storeNameView) {
        _storeNameView = [KRArrowIconRowView rowViewWithTitle:@"店铺名" subtitle:nil iconName:@"def_icon_store" hiddenArrow:YES];
    }
    return _storeNameView;
}

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

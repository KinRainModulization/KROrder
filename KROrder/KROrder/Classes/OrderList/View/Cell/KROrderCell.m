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

//- (UILabel *)productNameLabel {
//    if (!_productNameLabel) {
//        _productNameLabel = [UILabel labelWithText:@"" textColor:<#(UIColor *)#> fontSize:<#(CGFloat)#>]
//    }
//}

@end

//
//  KROrderPayView.h
//  KROrder
//
//  Created by LX on 2018/1/26.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    OrderPayTypeWechat = 1,
    OrderPayTypeAlipay,
} OrderPayType;

@interface KROrderPayView : UIView

@property (nonatomic, copy) void (^orderPayBlock)(void);

@end

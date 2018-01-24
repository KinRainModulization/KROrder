//
//  KROrderListController.m
//  KROrder
//
//  Created by LX on 2018/1/22.
//  Copyright © 2018年 Ace. All rights reserved.
//

#import "KROrderController.h"
#import "KROrderListView.h"
#import "KROrderListController.h"

@interface KROrderController ()

@property (nonatomic, strong) UIScrollView *orderScrollView;

@property (nonatomic, strong) NSArray *segmentItems;


@property (nonatomic, strong) UIButton *selectBtn;

//@property (nonatomic, weak) KROrderListController *<#name#>;
@end

@implementation KROrderController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单";
    
    [self addSubView];
    
}

- (void)addSubView {
    [self.view addSubview:self.orderScrollView];
    
    // ----- test
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    CGFloat btnW = SCREEN_WIDTH *0.25;
    [self.view addSubview:headerView];
    for (int i = 0; i < self.segmentItems.count; i++) {
        NSDictionary *item = self.segmentItems[i];
        UIButton *button = [UIButton buttonWithTitle:item[@"title"] fontSize:14 titleColor:FONT_COLOR_99 target:self action:@selector(orderBtnClick:)];
        [button setTitleColor:GLOBAL_COLOR forState:UIControlStateSelected];
        button.frame = CGRectMake(i*btnW, 0, btnW, 40);
        button.tag = i;
        [headerView addSubview:button];
        
        
        KROrderListController *vc = [[KROrderListController alloc] initWithStyle:UITableViewStyleGrouped];
        [self addChildViewController:vc];
//        vc.view.frame = CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_HEIGHT, _orderScrollView.height);
        [_orderScrollView addSubview:vc.view];
        
//        KROrderListView *orderListView = [[KROrderListView alloc] initWithFrame:CGRectMake(i*SCREEN_WIDTH, 0, SCREEN_HEIGHT, _orderScrollView.height) style:UITableViewStyleGrouped];
//        [_orderScrollView addSubview:orderListView];
    }
    // -----
}

- (void)orderBtnClick:(UIButton *)button {
    _selectBtn.selected = NO;
    _selectBtn = button;
    _selectBtn.selected = YES;
}

#pragma mark - Setter/Getter

- (NSArray *)segmentItems {
    if (!_segmentItems) {
        _segmentItems = @[
                          @{@"title":@"全部",@"filter":@""},
                          @{@"title":@"待付款",@"filter":@""},
                          @{@"title":@"已付款",@"filter":@""},
                          @{@"title":@"退款",@"filter":@""},
                          ];
    }
    return _segmentItems;
}

- (UIScrollView *)orderScrollView {
    if (!_orderScrollView) {
        _orderScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, self.view.height-40)];
        _orderScrollView.contentSize = CGSizeMake(self.segmentItems.count*SCREEN_WIDTH, _orderScrollView.height);
        _orderScrollView.showsHorizontalScrollIndicator = NO;
        _orderScrollView.bounces = NO;
        _orderScrollView.pagingEnabled = YES;
    }
    return _orderScrollView;
}

@end

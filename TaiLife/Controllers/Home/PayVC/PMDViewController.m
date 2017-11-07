//
//  PMDViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/2.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "PMDViewController.h"
#import "TXScrollLabelView.h"
@interface PMDViewController ()<TXScrollLabelViewDelegate>

@property (weak, nonatomic) TXScrollLabelView *scrollLabelView;

@end

@implementation PMDViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.isArray = YES;
    
    [self setViewInfos];
    
    [self setSubviews];
    
}

- (void)setViewInfos {
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"TXScrollLabelView";
}

- (void)setSubviews {
    
    [self addWith:TXScrollLabelViewTypeLeftRight velocity:1 isArray:_isArray];
    
    [self addWith:TXScrollLabelViewTypeUpDown velocity:2 isArray:_isArray];
    
    [self addWith:TXScrollLabelViewTypeFlipRepeat velocity:2 isArray:_isArray];
    
    [self addWith:TXScrollLabelViewTypeFlipNoRepeat velocity:2 isArray:_isArray];
}

- (void)addWith:(TXScrollLabelViewType)type velocity:(CGFloat)velocity isArray:(BOOL)isArray {
    /** Step1: 滚动文字 */
    
    NSString *scrollTitle = @"如果在使用 TXScrollLabelView 的过程中出现bug，请及时联系，我会尽快进行修复。如果有更好的点子，直接 Open an issue 或者 submit a pr on GitHub。Thanks.";
    
    NSArray *scrollTexts = @[@"111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111",
                             @"222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222",
                             @"333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333",
                             @"444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444444",
                             @"555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555",
                             @"6666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666",
                             @"777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777",
                             @"888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888",
                             @"999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
                             ];
    
    /** Step2: 创建 ScrollLabelView */
    TXScrollLabelView *scrollLabelView = nil;
    if (isArray) {
        scrollLabelView = [TXScrollLabelView scrollWithTextArray:scrollTexts type:type velocity:velocity options:UIViewAnimationOptionCurveEaseInOut inset:UIEdgeInsetsZero];
    }else {
        scrollLabelView = [TXScrollLabelView scrollWithTitle:scrollTitle type:type velocity:velocity options:UIViewAnimationOptionCurveEaseInOut];
    }
    
    /** Step3: 设置代理进行回调 */
    scrollLabelView.scrollLabelViewDelegate = self;
    
    /** Step4: 布局(Required) */
    scrollLabelView.frame = CGRectMake(50, 100 * (type + 0.7), 300, 30);
    
    [self.view addSubview:scrollLabelView];
    
    //偏好(Optional), Preference,if you want.
    scrollLabelView.tx_centerX  = [UIScreen mainScreen].bounds.size.width * 0.5;
    scrollLabelView.scrollInset = UIEdgeInsetsMake(0, 10 , 0, 10);
    scrollLabelView.scrollSpace = 10;
    scrollLabelView.font = [UIFont systemFontOfSize:15];
    scrollLabelView.textAlignment = NSTextAlignmentCenter;
    scrollLabelView.backgroundColor = [UIColor blackColor];
    scrollLabelView.layer.cornerRadius = 5;
    
    /** Step5: 开始滚动(Start scrolling!) */
    [scrollLabelView beginScrolling];
}

- (void)scrollLabelView:(TXScrollLabelView *)scrollLabelView didClickWithText:(NSString *)text atIndex:(NSInteger)index {
    NSLog(@"%@--%ld",text, index);
}

@end

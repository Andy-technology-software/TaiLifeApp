//
//  BaseViewController.m
//  ilingtong
//
//  Created by administrator on 16/3/10.
//  Copyright © 2016年 lingnet. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[XRQController colorWithHexString:@"000000"],NSFontAttributeName:[UIFont systemFontOfSize:19.0]}];
    self.view.backgroundColor = [UIColor whiteColor];//[MyController colorWithHexString:BGColor];
    [self createLeftNvc];
}
#pragma mark - 创建返回
- (void)createLeftNvc{
    UIButton*rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0,0,60,22)];
    [rightButton setImage:[UIImage imageNamed:@"返回-蓝"]forState:UIControlStateNormal];
//    [rightButton setTitle:@"返回" forState:UIControlStateNormal];
//    [rightButton setTitleColor:[MyController colorWithHexString:@"438eb8"] forState:UIControlStateNormal];
//    rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    rightButton.titleEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
//    rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, -50, 0, 0);
    
    [rightButton addTarget:self action:@selector(backBtnClick)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem*rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.leftBarButtonItem= rightItem;
}
#pragma mark - 返回响应
- (void)backBtnClick{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

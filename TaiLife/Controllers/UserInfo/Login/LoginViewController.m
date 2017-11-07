//
//  LoginViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/2.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //跳转到支付
    UIButton* payB1 = [XRQController createButtonWithFrame:CGRectMake(100, 200, 100, 100) ImageName:nil Target:self Action:@selector(payBClick) Title:@"登录"];
    [payB1 setBackgroundColor:[UIColor redColor]];
    [payB1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:payB1];
}

- (void)payBClick {
    [(AppDelegate *)[UIApplication sharedApplication].delegate setRootVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  HomeIndexViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/1.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndexViewController.h"

#import "PayViewController.h"

#import "PMDViewController.h"
@interface HomeIndexViewController ()

@end

@implementation HomeIndexViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    //跳转到支付
    UIButton* payB = [XRQController createButtonWithFrame:CGRectMake(100, 100, 100, 100) ImageName:nil Target:self Action:@selector(payBClick) Title:@"支付"];
    [payB setBackgroundColor:[UIColor redColor]];
    [payB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:payB];
    
    UIButton* aaB = [XRQController createButtonWithFrame:CGRectMake(100, 300, 100, 100) ImageName:nil Target:self Action:@selector(payBClick1) Title:@"跑马灯"];
    [aaB setBackgroundColor:[UIColor redColor]];
    [aaB setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:aaB];
}

- (void)payBClick {
    PayViewController* vc = [[PayViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)payBClick1 {
    PMDViewController* vc = [[PMDViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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

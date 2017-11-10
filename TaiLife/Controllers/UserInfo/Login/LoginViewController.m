//
//  LoginViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/2.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "LoginViewController.h"

#import "LoginModel.h"

#import "Login0TableViewCell.h"

#import "Login1TableViewCell.h"

#import "Login2TableViewCell.h"
@interface LoginViewController ()<UITableViewDataSource,UITableViewDelegate,Login0TableViewCellDelegate,Login1TableViewCellDelegate,Login2TableViewCellDelegate>{
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* dataSource;
@end

@implementation LoginViewController

#pragma mark - s0返回是不是密码登录
- (void)sendBackLogin0Bool:(BOOL)isPass {
    LoginModel* model = [self.dataSource lastObject];
    model._isPass = isPass;
    [_tableView reloadData];
}

#pragma mark - s0返回按钮响应
- (void)sendBackBackNav {
    [(AppDelegate *)[UIApplication sharedApplication].delegate setRootVC];
}

#pragma mark - s1用户名
- (void)sendBackUsername:(NSString *)username {
    LoginModel* model = [self.dataSource lastObject];
    model._username = username;
}

#pragma mark - s1密码
- (void)sendBackPassword:(NSString *)password {
    LoginModel* model = [self.dataSource lastObject];
    model._password = password;
}

#pragma mark - s2是否同意
- (void)sendBackIsSure {
    
}

#pragma mark - s2忘记密码
- (void)sendBackForPass {
    
}

#pragma mark - s2立即注册
- (void)sendBackRegNow {
    
}

#pragma mark - s2登录
- (void)sendBackLogin {
    [(AppDelegate *)[UIApplication sharedApplication].delegate setRootVC];
    
}

#pragma mark - s2阅读隐私条例
- (void)sendBackReadText {
    
}

- (void)makeData {
    LoginModel* model = [[LoginModel alloc] init];
    model._isPass = YES;
    self.dataSource = [[NSMutableArray alloc] init];
    [self.dataSource addObject:model];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeData];
    [self createTableView];
}

#pragma mark - 初始化tableView
- (void)createTableView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.backgroundColor = [XRQController colorWithHexString:@"ffffff"];
    [_tableView setBackgroundView:tableBg];
    //分割线类型
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
}

#pragma mark - tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        Login0TableViewCell* cell0 = [[Login0TableViewCell alloc] init];
        cell0.Login0TableViewCellDelegate = self;
        LoginModel *model = nil;
        model = [self.dataSource objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        Login1TableViewCell* cell0 = [[Login1TableViewCell alloc] init];
        cell0.Login1TableViewCellDelegate = self;
        LoginModel *model = nil;
        model = [self.dataSource objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }

    Login2TableViewCell* cell0 = [[Login2TableViewCell alloc] init];
    cell0.Login2TableViewCellDelegate = self;
    LoginModel *model = nil;
    model = [self.dataSource objectAtIndex:indexPath.row];
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell0 configCellWithModel:model];
    return cell0;
}

#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        LoginModel* model = self.dataSource[indexPath.row];
        return [Login0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            Login0TableViewCell *cell = (Login0TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }else if (1 == indexPath.section) {
        LoginModel* model = self.dataSource[indexPath.row];
        return [Login1TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            Login1TableViewCell *cell = (Login1TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }

    LoginModel* model = self.dataSource[indexPath.row];
    return [Login2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        Login2TableViewCell *cell = (Login2TableViewCell *)sourceCell;
        // 配置数据
        [cell configCellWithModel:model];
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
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

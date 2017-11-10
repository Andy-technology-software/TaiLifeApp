//
//  MineIndexViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/1.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "MineIndexViewController.h"

#import "MineIndexModel.h"

#import "MineIndex1Model.h"

#import "MineIndexTableViewCell.h"

#import "MineIndex1TableViewCell.h"
@interface MineIndexViewController ()<UITableViewDataSource,UITableViewDelegate,MineIndexTableViewCellDelegate,MineIndex1TableViewCellDelegate> {
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* dataSource0;
@property(nonatomic,retain)NSMutableArray* dataSource1;
@end

@implementation MineIndexViewController

#pragma mark - s0开门
- (void)sendBack0OpenDoor {
    [(AppDelegate *)[UIApplication sharedApplication].delegate setLoginRoot];
}

#pragma mark - s0点击头像
- (void)sendBack0HeadImage {
    
}

#pragma mark - s1点击第几个item
- (void)sendBack1ItemIndex:(NSInteger)item {
    if (0 == item) {
        NSLog(@"我的房产");
    }else if (1 == item) {
        NSLog(@"我的积分");
    }else if (2 == item) {
        NSLog(@"我的优惠券");
    }
}

#pragma mark - 假数据
- (void)makeData {
    self.dataSource0 = [[NSMutableArray alloc] init];
    MineIndexModel* model0 = [[MineIndexModel alloc] init];
    model0._headImage = @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2429843031,583271037&fm=27&gp=0.jpg";
    model0._jifen = @"100";
    model0._name = @"皮卡丘";
    [self.dataSource0 addObject:model0];
    
    self.dataSource1 = [[NSMutableArray alloc] init];
    MineIndex1Model* model1 = [[MineIndex1Model alloc] init];
    model1._imgArr = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    model1._desArr = [[NSMutableArray alloc] initWithObjects:@"A小区一号楼一单元2102",@"100",@"3张优惠券", nil];
    model1._titArr = [[NSMutableArray alloc] initWithObjects:@"我的房产",@"我的积分",@"我的优惠券", nil];
    model1._numrr = [[NSMutableArray alloc] initWithObjects:@"10",@"2",@"0",@"1", nil];
    model1._subtArr = [[NSMutableArray alloc] initWithObjects:@"我的消息",@"我的报修",@"我的投诉",@"我的订单", nil];
    [self.dataSource1 addObject:model1];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
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
        MineIndexTableViewCell* cell0 = [[MineIndexTableViewCell alloc] init];
        cell0.MineIndexTableViewCellDelegate = self;
        MineIndexModel *model = [self.dataSource0 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        MineIndex1TableViewCell* cell0 = [[MineIndex1TableViewCell alloc] init];
        cell0.MineIndex1TableViewCellDelegate = self;
        MineIndex1Model *model = [self.dataSource1 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }
//    Login2TableViewCell* cell0 = [[Login2TableViewCell alloc] init];
//    cell0.Login2TableViewCellDelegate = self;
//    LoginModel *model = nil;
//    model = [self.dataSource objectAtIndex:indexPath.row];
//    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
//    [cell0 configCellWithModel:model];
//    return cell0;
    return nil;
}

#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        MineIndexModel* model = self.dataSource0[indexPath.row];
        return [MineIndexTableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            MineIndexTableViewCell *cell = (MineIndexTableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (1 == indexPath.section) {
        MineIndex1Model* model = self.dataSource1[indexPath.row];
        return [MineIndex1TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            MineIndex1TableViewCell *cell = (MineIndex1TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
//    LoginModel* model = self.dataSource[indexPath.row];
//    return [Login2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
//        Login2TableViewCell *cell = (Login2TableViewCell *)sourceCell;
//        [cell configCellWithModel:model];
//    }];
    
    return 0;
}

#pragma mark - tableview组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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

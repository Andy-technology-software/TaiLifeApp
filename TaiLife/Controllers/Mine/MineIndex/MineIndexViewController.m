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

#import "MineIndex2Model.h"

#import "MineIndexTableViewCell.h"

#import "MineIndex1TableViewCell.h"

#import "MineIndex2TableViewCell.h"

#import "MineIndex3TableViewCell.h"
@interface MineIndexViewController ()<UITableViewDataSource,UITableViewDelegate,MineIndexTableViewCellDelegate,MineIndex1TableViewCellDelegate,MineIndex3TableViewCellDelegate> {
    UITableView* _tableView;
}
@property(nonatomic,retain)NSMutableArray* dataSource0;
@property(nonatomic,retain)NSMutableArray* dataSource1;
@property(nonatomic,retain)NSMutableArray* dataSource2;
@end

@implementation MineIndexViewController

#pragma mark - s0开门
- (void)sendBack0OpenDoor {
    
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

- (void)sendBack1ItemIndex1:(NSInteger)item {
    if (0 == item) {
        NSLog(@"我的消息");
    }else if (1 == item) {
        NSLog(@"我的保修");
    }else if (2 == item) {
        NSLog(@"我的投诉");
    }else if (3 == item) {
        NSLog(@"我的订单");
    }
}

#pragma mark - 退出登录
- (void)sendBack3LogOut {
    [(AppDelegate *)[UIApplication sharedApplication].delegate setLoginRoot];
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
    
    self.dataSource2 = [[NSMutableArray alloc] init];
    NSArray* imArr = [[NSArray alloc] initWithObjects:@"首页",@"首页",@"首页",@"首页",@"首页",@"首页", nil];
    NSArray* titArr = [[NSArray alloc] initWithObjects:@"我的租售",@"收件地址",@"关于我们",@"意见建议",@"版本检查",@"积分兑换", nil];
    for (int i = 0; i < titArr.count; i++) {
        MineIndex2Model* model2 = [[MineIndex2Model alloc] init];
        model2._imagename = imArr[i];
        model2._title = titArr[i];
        [self.dataSource2 addObject:model2];
    }
    
    
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
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - [XRQAddController tabBarHeight]) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.backgroundColor = [XRQController colorWithHexString:@"ffffff"];
    [_tableView setBackgroundView:tableBg];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        [self headRefresh];
    }];
    
}
#pragma mark - 下拉刷新
- (void)headRefresh{
    //    [self getImgs];
    [_tableView.mj_header endRefreshing];
}

#pragma mark - tableView行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (2 == section) {
        return self.dataSource2.count;
    }
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
    }else if (2 == indexPath.section) {
        MineIndex2TableViewCell* cell0 = [[MineIndex2TableViewCell alloc] init];
        MineIndex2Model *model = [self.dataSource2 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }
    MineIndex3TableViewCell* cell0 = [[MineIndex3TableViewCell alloc] init];
    cell0.MineIndex3TableViewCellDelegate = self;
    cell0.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell0 configCellWithModel];
    return cell0;
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
    }else if (2 == indexPath.section) {
        MineIndex2Model* model = self.dataSource2[indexPath.row];
        return [MineIndex2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            MineIndex2TableViewCell *cell = (MineIndex2TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    return [MineIndex3TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
        MineIndex3TableViewCell *cell = (MineIndex3TableViewCell *)sourceCell;
        [cell configCellWithModel];
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (2 == indexPath.section) {
        if (0 == indexPath.row) {
            //我的租售
        }else if (1 == indexPath.row) {
            //收件地址
        }else if (2 == indexPath.row) {
            //关于我们
        }else if (3 == indexPath.row) {
            //意见建议
        }else if (4 == indexPath.row) {
            //版本检查
        }else if (5 == indexPath.row) {
            //积分兑换
        }
    }
}

#pragma mark - tableview组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
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

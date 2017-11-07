//
//  BusinessmenIndexViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/1.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "BusinessmenIndexViewController.h"

#import "BussinessmenIndex0Model.h"

#import "BussinessmenIndex2Model.h"

#import "BussinessmenIndex3Model.h"

#import "BussinessmenIndex4Model.h"

#import "BussinessmenIndex0TableViewCell.h"

#import "BussinessmenIndex1TableViewCell.h"

#import "BussinessmenIndex2TableViewCell.h"

#import "BussinessmenIndex3TableViewCell.h"

#import "BussinessmenIndex4TableViewCell.h"
@interface BusinessmenIndexViewController ()<UITableViewDataSource,UITableViewDelegate,BussinessmenIndex0TableViewCellDelegate,BussinessmenIndex1TableViewCellDelegate,BussinessmenIndex2TableViewCellDelegate,BussinessmenIndex3TableViewCellDelegate,BussinessmenIndex4TableViewCellDelegate>{
    UITableView* _tableView;
}

//顶部标题控件
@property(nonatomic,strong)UIView* topNavBgView;
@property(nonatomic,strong)UILabel* titleLable;
@property(nonatomic,strong)UIButton* openDoorBtn;

@property(nonatomic,retain)NSMutableArray* dataSource0;
@property(nonatomic,retain)NSMutableArray* dataSource2;
@property(nonatomic,retain)NSMutableArray* dataSource3;
@property(nonatomic,retain)NSMutableArray* dataSource4;

@end

@implementation BusinessmenIndexViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
}

- (void)makeData {
    self.dataSource0 = [[NSMutableArray alloc] init];
    
    BussinessmenIndex0Model* model0 = [[BussinessmenIndex0Model alloc] init];
    model0._imgArr = [[NSMutableArray alloc] initWithObjects:@"https://imgsa.baidu.com/news/q%3D100/sign=623cec76aa8b87d65642af1f37092860/f31fbe096b63f624ba4067448c44ebf81a4ca35c.jpg", nil];
    [self.dataSource0 addObject:model0];
    
    self.dataSource2 = [[NSMutableArray alloc] init];
    BussinessmenIndex2Model* model20 = [[BussinessmenIndex2Model alloc] init];
    model20._imgArr = [[NSMutableArray alloc] initWithObjects:@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg", nil];
    model20._timeArr = [[NSMutableArray alloc] initWithObjects:@"1天2小时",@"1天2小时", nil];
    model20._titleArr = [[NSMutableArray alloc] initWithObjects:@"发现团购精品发现团购精品发现团购精品",@"发现团购精品发现团购精品发现团购精品", nil];
    [self.dataSource2 addObject:model20];
    
    
    self.dataSource3 = [[NSMutableArray alloc] init];
    BussinessmenIndex3Model* model3 = [[BussinessmenIndex3Model alloc] init];
    model3._img = @"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg";
    [self.dataSource3 addObject:model3];
    
    self.dataSource4 = [[NSMutableArray alloc] init];
    BussinessmenIndex4Model* model40 = [[BussinessmenIndex4Model alloc] init];
    model40._imgArr = [[NSMutableArray alloc] initWithObjects:@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg", nil];
    model40._priceArr = [[NSMutableArray alloc] initWithObjects:@"20.9",@"20.9",@"20.9", nil];
    model40._titleArr = [[NSMutableArray alloc] initWithObjects:@"发现团购精品发现团购精品发现团购精品",@"发现团购精品发现团购精品发现团购精品",@"发现团购精品发现团购精品发现团购精品", nil];
    model40._countArr = [[NSMutableArray alloc] initWithObjects:@"100",@"100",@"100", nil];
    [self.dataSource4 addObject:model40];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self makeData];
    
    //创建顶部标题
    [self makeHeaerView];
    
    [self createTableView];
}

#pragma mark - 创建顶部标题
- (void)makeHeaerView {
    self.topNavBgView = [XRQController viewWithFrame:self.view.frame];
    self.topNavBgView.backgroundColor = [XRQController colorWithHexString:@"ffffff"];
    [self.view addSubview:self.topNavBgView];
    
    [self.topNavBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset([XRQAddController isIOS7]);
    }];
    
    self.titleLable = [XRQController createLabelWithFrame:self.topNavBgView.frame Font:18 Text:@"商家"];
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    [self.topNavBgView addSubview:self.titleLable];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.centerY.mas_equalTo(self.topNavBgView.mas_centerY).mas_offset(10);
    }];

    self.openDoorBtn = [XRQController createButtonWithFrame:self.topNavBgView.frame ImageName:@"" Target:self Action:@selector(openDoorBtnClick) Title:@"开门"];
    [self.openDoorBtn setBackgroundColor:[UIColor greenColor]];
    [self.openDoorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.openDoorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.topNavBgView addSubview:self.openDoorBtn];
    
    [self.openDoorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(self.titleLable);
        make.width.mas_offset(42);
        make.height.mas_offset(20);
    }];
    
}

#pragma mark - 开门按钮响应
- (void)openDoorBtnClick {
    NSLog(@"开门");
}


#pragma mark - 初始化tableView
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [XRQAddController isIOS7], self.view.frame.size.width, self.view.frame.size.height - [XRQAddController isIOS7] - [XRQAddController tabBarHeight]) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.backgroundColor = [XRQController colorWithHexString:@"ffffff"];
    [_tableView setBackgroundView:tableBg];
    //分割线类型
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
    if (0 == section) {
        return self.dataSource0.count;
    }else if (2 == section) {
        return self.dataSource2.count;
    }else if (3 == section) {
        return self.dataSource3.count;
    }else if (4 == section) {
        return self.dataSource4.count;
    }
    return 1;
}

#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        BussinessmenIndex0TableViewCell* cell0 = [[BussinessmenIndex0TableViewCell alloc] init];
        cell0.BussinessmenIndex0TableViewCellDelegate = self;
        BussinessmenIndex0Model *model = nil;
        model = [self.dataSource0 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        BussinessmenIndex1TableViewCell* cell0 = [[BussinessmenIndex1TableViewCell alloc] init];
        cell0.BussinessmenIndex1TableViewCellDelegate = self;
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel];
        return cell0;
    }else if (2 == indexPath.section) {
        BussinessmenIndex2TableViewCell* cell0 = [[BussinessmenIndex2TableViewCell alloc] init];
        cell0.BussinessmenIndex2TableViewCellDelegate = self;
        BussinessmenIndex2Model *model = nil;
        model = [self.dataSource2 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (3 == indexPath.section) {
        BussinessmenIndex3TableViewCell* cell0 = [[BussinessmenIndex3TableViewCell alloc] init];
        cell0.BussinessmenIndex3TableViewCellDelegate = self;
        BussinessmenIndex3Model *model = nil;
        model = [self.dataSource3 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (4 == indexPath.section) {
        BussinessmenIndex4TableViewCell* cell0 = [[BussinessmenIndex4TableViewCell alloc] init];
        cell0.BussinessmenIndex4TableViewCellDelegate = self;
        BussinessmenIndex4Model *model = nil;
        model = [self.dataSource4 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }
    return nil;
}

#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        BussinessmenIndex0Model* model = self.dataSource0[indexPath.row];
        return [BussinessmenIndex0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            BussinessmenIndex0TableViewCell *cell = (BussinessmenIndex0TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }else if (1 == indexPath.section) {
        return [BussinessmenIndex1TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            BussinessmenIndex1TableViewCell *cell = (BussinessmenIndex1TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel];
        }];
    }else if (2 == indexPath.section) {
        BussinessmenIndex2Model* model = self.dataSource2[indexPath.row];
        return [BussinessmenIndex2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            BussinessmenIndex2TableViewCell *cell = (BussinessmenIndex2TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }else if (3 == indexPath.section) {
        BussinessmenIndex3Model* model = self.dataSource3[indexPath.row];
        return [BussinessmenIndex3TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            BussinessmenIndex3TableViewCell *cell = (BussinessmenIndex3TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }else if (4 == indexPath.section) {
        BussinessmenIndex4Model* model = self.dataSource4[indexPath.row];
        return [BussinessmenIndex4TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            BussinessmenIndex4TableViewCell *cell = (BussinessmenIndex4TableViewCell *)sourceCell;
            // 配置数据
            [cell configCellWithModel:model];
        }];
    }
    return 0;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

#pragma mark - s0新闻点击代理
- (void)didselectADPic:(NSInteger)index{
    NSLog(@"新闻-----%ld",index);
    
}

#pragma mark - s0分类点击代理
- (void)sendBackItem:(NSInteger)index {
    NSLog(@"s0分类-----%ld",index);
}

#pragma mark - s1预售
- (void)sendBackYS {
    
}

#pragma mark - s1生活
- (void)sendBackSH {
    
}

#pragma mark - s1尖货
- (void)sendBackJH {
    
}

#pragma mark - s2点击
- (void)sendBack2Item:(NSInteger)index {
    NSLog(@"s2分类-----%ld",index);
}

#pragma mark - s2更多
- (void)s2MoreClick {
    NSLog(@"s2更多");
}

#pragma mark - s3更多
- (void)s3MoreClick {
    NSLog(@"s3更多");
}

#pragma mark - s3点击
- (void)sendBack3Item {
    NSLog(@"s3分类");
}

#pragma mark - s4点击商品
- (void)sendBack4Item:(NSInteger)index {
    NSLog(@"s4商品");
    
}

#pragma mark - s4更多
- (void)s4MoreClick {
    NSLog(@"s4更多");
    
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

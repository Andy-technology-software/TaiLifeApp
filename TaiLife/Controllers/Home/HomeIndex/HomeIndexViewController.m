//
//  HomeIndexViewController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/1.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndexViewController.h"

#import "PMDViewController.h"

#import "HomeIndex0Model.h"

#import "HomeIndex1Model.h"

#import "HomeIndex2Model.h"

#import "HomeIndex3Model.h"

#import "HomeIndex4Model.h"

#import "HomeIndex5Model.h"

#import "HomeIndex6Model.h"

#import "HomeIndex7Model.h"

#import "HomeIndex8Model.h"

#import "HomeIndex9Model.h"

#import "HomeIndex0TableViewCell.h"

#import "HomeIndex1TableViewCell.h"

#import "HomeIndex2TableViewCell.h"

#import "HomeIndex3TableViewCell.h"

#import "HomeIndex4TableViewCell.h"

#import "HomeIndex5TableViewCell.h"

#import "HomeIndex6TableViewCell.h"

#import "HomeIndex7TableViewCell.h"

#import "HomeIndex8TableViewCell.h"

#import "HomeIndex9TableViewCell.h"
@interface HomeIndexViewController ()<UITableViewDataSource,UITableViewDelegate,HomeIndex0TableViewCellDelegate,HomeIndex1TableViewCellDelegate,HomeIndex3TableViewCellDelegate,HomeIndex5TableViewCellDelegate,HomeIndex6TableViewCellDelegate,HomeIndex7TableViewCellDelegate,HomeIndex9TableViewCellDelegate>{
    UITableView* _tableView;
}
//顶部标题控件
@property(nonatomic,strong)UIView* topNavBgView;
@property(nonatomic,strong)UIImageView* addImageView;
@property(nonatomic,strong)UILabel* titleLable;
@property(nonatomic,strong)UIButton* openDoorBtn;

@property(nonatomic,retain)NSMutableArray* dataSource0;
@property(nonatomic,retain)NSMutableArray* dataSource1;
@property(nonatomic,retain)NSMutableArray* dataSource2;
@property(nonatomic,retain)NSMutableArray* dataSource3;
@property(nonatomic,retain)NSMutableArray* dataSource4;
@property(nonatomic,retain)NSMutableArray* dataSource5;
@property(nonatomic,retain)NSMutableArray* dataSource6;
@property(nonatomic,retain)NSMutableArray* dataSource7;
@property(nonatomic,retain)NSMutableArray* dataSource8;
@property(nonatomic,retain)NSMutableArray* dataSource9;
@end

@implementation HomeIndexViewController

#pragma mark - s0点击广告
- (void)didselectADPic:(NSInteger)index {
    
}

#pragma mark - s1点击响应
- (void)sendBackS1Index:(NSInteger)index {
    NSLog(@"S1---%ld",index);
}

#pragma mark - s3点击响应
- (void)sendBack3Item:(NSInteger)index {
    
}

#pragma mark - s5点击
- (void)sendBack5Item:(NSInteger)index {
    NSLog(@"s5分类-----%ld",index);
}

#pragma mark - s5更多
- (void)s5MoreClick {
    NSLog(@"s5更多");
}

#pragma mark - s6点击
- (void)sendBack6Item:(NSInteger)index {
    NSLog(@"s6分类-----%ld",index);
}

#pragma mark - s6更多
- (void)s6MoreClick {
    NSLog(@"s6更多");
}

#pragma mark - s7更多
- (void)sendBack7Item:(NSInteger)index {
    NSLog(@"s7----%ld",index);
}

#pragma mark - s9点击商品
- (void)sendBack9Item:(NSInteger)index {
    
}

#pragma mark - s9点击更多
- (void)s9MoreClick {
    
}

- (void)makeData {
    self.dataSource0 = [[NSMutableArray alloc] init];
    self.dataSource1 = [[NSMutableArray alloc] init];
    self.dataSource2 = [[NSMutableArray alloc] init];
    self.dataSource3 = [[NSMutableArray alloc] init];
    self.dataSource4 = [[NSMutableArray alloc] init];
    self.dataSource5 = [[NSMutableArray alloc] init];
    self.dataSource6 = [[NSMutableArray alloc] init];
    self.dataSource7 = [[NSMutableArray alloc] init];
    self.dataSource8 = [[NSMutableArray alloc] init];
    self.dataSource9 = [[NSMutableArray alloc] init];
    
    HomeIndex0Model* model0 = [[HomeIndex0Model alloc] init];
    model0._imgArr = [[NSMutableArray alloc] initWithObjects:@"https://imgsa.baidu.com/news/q%3D100/sign=1a47f571dc2a60595410e51a1835342d/7aec54e736d12f2ef270b7d844c2d56285356814.jpg",@"https://imgsa.baidu.com/news/q%3D100/sign=1d3c8b40ac86c9170e035639f93c70c6/c995d143ad4bd113fb06d88a51afa40f4afb05ba.jpg", nil];
    model0._noticeArr = [[NSMutableArray alloc] initWithObjects:@"泰生活即将发布，请大家及时关注",@"新楼盘发布，入手吧赶紧",@"泰生活即将发布，请大家及时关注泰生活即将发布，请大家及时关注。泰生活即将发布，请大家及时关注。泰生活即将发布，请大家及时关注", nil];
    [self.dataSource0 addObject:model0];
    
    HomeIndex1Model* model1 = [[HomeIndex1Model alloc] init];
    model1._imgArr = [[NSMutableArray alloc] initWithObjects:@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",
                      nil];
    model1._titleArr = [[NSMutableArray alloc] initWithObjects:@"物业通知",@"社区活动",@"故障报修",@"物业账单",@"二手房产",@"新房查看",@"近期优惠",@"小区保安",@"小区保洁",@"小区大树", nil];
    [self.dataSource1 addObject:model1];

    HomeIndex2Model* model2 = [[HomeIndex2Model alloc] init];
    model2._title = @"您有一条新的消息通知";
    model2._des = @"泰生活即将发布，请大家及时关注泰生活即将发布，请大家及时关注。泰生活即将发布，请大家及时关注泰生活即将发布。泰生活即将发布，请大家及时关注泰生活即将发布。泰生活即将发布，请大家及时关注泰生活即将发布";
    model2._time = @"2017-11-13 10:00";
    [self.dataSource2 addObject:model2];
    
    HomeIndex3Model* model3 = [[HomeIndex3Model alloc] init];
    model3._imgArr = [[NSMutableArray alloc] initWithObjects:@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=1177166395,4175613967&fm=173&s=2387F5045ED39B90E20EF9D3030010B9&w=218&h=146&img.JPG",@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=4187994105,3190984558&fm=173&s=112BF115526361035291A8E703006033&w=218&h=146&img.JPG",@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2435947998,4099770268&fm=173&s=10D35892ECC205415C065A900300F0B9&w=218&h=146&img.JPG", nil];
    [self.dataSource3 addObject:model3];

    HomeIndex4Model* model4 = [[HomeIndex4Model alloc] init];
    model4._img = @"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=3425739880,3458116675&fm=173&s=F31670817AE21D0B22A70C920300C0AA&w=218&h=146&img.JPG";
    [self.dataSource4 addObject:model4];
    
    HomeIndex5Model* model5 = [[HomeIndex5Model alloc] init];
    model5._imgArr = [[NSMutableArray alloc] initWithObjects:@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg", nil];
    model5._timeArr = [[NSMutableArray alloc] initWithObjects:@"1天2小时",@"1天2小时", nil];
    model5._titleArr = [[NSMutableArray alloc] initWithObjects:@"发现团购精品发现团购精品发现团购精品",@"发现团购精品发现团购精品发现团购精品", nil];
    [self.dataSource5 addObject:model5];
    
    HomeIndex6Model* model6 = [[HomeIndex6Model alloc] init];
    model6._imgArr = [[NSMutableArray alloc] initWithObjects:@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg", nil];
    [self.dataSource6 addObject:model6];
    
    HomeIndex7Model* model7 = [[HomeIndex7Model alloc] init];
    model7._img0 = @"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg";
    model7._img1 = @"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg";
    model7._img2 = @"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg";
    [self.dataSource7 addObject:model7];
    
    HomeIndex8Model* model8 = [[HomeIndex8Model alloc] init];
    model8._img = @"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg";
    [self.dataSource8 addObject:model8];
    
    HomeIndex9Model* model9 = [[HomeIndex9Model alloc] init];
    model9._imgArr = [[NSMutableArray alloc] initWithObjects:@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg",@"http://b.hiphotos.baidu.com/image/h%3D300/sign=0a65c9f99b45d688bc02b4a494c07dab/4b90f603738da977f08a86e1b951f8198718e357.jpg", nil];
    model9._priceArr = [[NSMutableArray alloc] initWithObjects:@"20.9",@"20.9",@"20.9", nil];
    model9._titleArr = [[NSMutableArray alloc] initWithObjects:@"发现团购精品发现团购精品发现团购精品",@"发现团购精品发现团购精品发现团购精品",@"发现团购精品发现团购精品发现团购精品", nil];
    model9._countArr = [[NSMutableArray alloc] initWithObjects:@"100",@"100",@"100", nil];
    [self.dataSource9 addObject:model9];
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
    
    self.addImageView = [XRQController createImageViewWithFrame:self.topNavBgView.frame ImageName:@"首页"];
    [self.topNavBgView addSubview:self.addImageView];
    
    [self.addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.width.mas_offset(16);
        make.height.mas_offset(16);
        make.centerY.mas_equalTo(self.topNavBgView.mas_centerY).mas_offset(10);
    }];
    
    self.openDoorBtn = [XRQController createButtonWithFrame:self.topNavBgView.frame ImageName:@"" Target:self Action:@selector(openDoorBtnClick) Title:@"开门"];
    [self.openDoorBtn setBackgroundColor:[UIColor greenColor]];
    [self.openDoorBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.openDoorBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.topNavBgView addSubview:self.openDoorBtn];
    
    [self.openDoorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(self.addImageView.mas_centerY);
        make.width.mas_offset(42);
        make.height.mas_offset(20);
    }];
    
    self.titleLable = [XRQController createLabelWithFrame:self.topNavBgView.frame Font:14 Text:@"泰华物业A小区"];
    self.titleLable.numberOfLines = 1;
    self.titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.topNavBgView addSubview:self.titleLable];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addImageView.mas_right).mas_offset(6);
        make.right.mas_equalTo(self.openDoorBtn.mas_left).mas_offset(-6);
        make.centerY.mas_equalTo(self.openDoorBtn);
    }];
}

#pragma mark - 开门按钮响应
- (void)openDoorBtnClick {
    NSLog(@"开门");
    PMDViewController* vc = [[PMDViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - 初始化tableView
- (void)createTableView{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, [XRQAddController isIOS7], self.view.frame.size.width, self.view.frame.size.height - [XRQAddController tabBarHeight] - [XRQController isIOS7]) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UIImageView *tableBg = [[UIImageView alloc] initWithImage:nil];
    tableBg.backgroundColor = [XRQController colorWithHexString:@"f5f5f5"];
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
    }else if (1 == section) {
        return self.dataSource1.count;
    }else if (2 == section) {
        return self.dataSource2.count;
    }else if (3 == section) {
        return self.dataSource3.count;
    }else if (4 == section) {
        return self.dataSource4.count;
    }else if (5 == section) {
        return self.dataSource5.count;
    }else if (6 == section) {
        return self.dataSource7.count;
    }else if (7 == section) {
        return self.dataSource6.count;
    }else if (8 == section) {
        return self.dataSource8.count;
    }else if (9 == section) {
        return self.dataSource9.count;
    }
    return 0;
}

#pragma mark - 自定义tableView
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        //广告也+通知
        HomeIndex0TableViewCell* cell0 = [[HomeIndex0TableViewCell alloc] init];
        cell0.HomeIndex0TableViewCellDelegate = self;
        HomeIndex0Model *model = nil;
        model = [self.dataSource0 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (1 == indexPath.section) {
        //物业通知
        HomeIndex1TableViewCell* cell0 = [[HomeIndex1TableViewCell alloc] init];
        cell0.HomeIndex1TableViewCellDelegate = self;
        HomeIndex1Model* model = self.dataSource1[indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (2 == indexPath.section) {
        //消息通知
        HomeIndex2TableViewCell* cell0 = [[HomeIndex2TableViewCell alloc] init];
        HomeIndex2Model *model = [self.dataSource2 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (3 == indexPath.section) {
        //社区活动
        HomeIndex3TableViewCell* cell0 = [[HomeIndex3TableViewCell alloc] init];
        cell0.HomeIndex3TableViewCellDelegate = self;
        HomeIndex3Model *model = [self.dataSource3 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (4 == indexPath.section) {
        //广告
        HomeIndex4TableViewCell* cell0 = [[HomeIndex4TableViewCell alloc] init];
        HomeIndex4Model *model = [self.dataSource4 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (5 == indexPath.section) {
        //泰华精选
        HomeIndex5TableViewCell* cell0 = [[HomeIndex5TableViewCell alloc] init];
        cell0.HomeIndex5TableViewCellDelegate = self;
        HomeIndex5Model *model = [self.dataSource5 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (6 == indexPath.section) {
        //房产展示
        HomeIndex7TableViewCell* cell0 = [[HomeIndex7TableViewCell alloc] init];
        cell0.HomeIndex7TableViewCellDelegate = self;
        HomeIndex7Model *model = [self.dataSource7 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (7 == indexPath.section) {
        //精选商家
        HomeIndex6TableViewCell* cell0 = [[HomeIndex6TableViewCell alloc] init];
        cell0.HomeIndex6TableViewCellDelegate = self;
        HomeIndex6Model *model = [self.dataSource6 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (8 == indexPath.section) {
        //广告
        HomeIndex8TableViewCell* cell0 = [[HomeIndex8TableViewCell alloc] init];
        HomeIndex8Model *model = [self.dataSource8 objectAtIndex:indexPath.row];
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }else if (9 == indexPath.section) {
        //产品
        HomeIndex9TableViewCell* cell0 = [[HomeIndex9TableViewCell alloc] init];
        HomeIndex9Model *model = [self.dataSource9 objectAtIndex:indexPath.row];
        cell0.HomeIndex9TableViewCellDelegate = self;
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell0 configCellWithModel:model];
        return cell0;
    }
    return nil;
}

#pragma mark - tableView行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (0 == indexPath.section) {
        HomeIndex0Model* model = self.dataSource0[indexPath.row];
        return [HomeIndex0TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex0TableViewCell *cell = (HomeIndex0TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (1 == indexPath.section) {
        HomeIndex1Model* model = self.dataSource1[indexPath.row];
        return [HomeIndex1TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex1TableViewCell *cell = (HomeIndex1TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (2 == indexPath.section) {
        HomeIndex2Model* model = self.dataSource2[indexPath.row];
        return [HomeIndex2TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex2TableViewCell *cell = (HomeIndex2TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (3 == indexPath.section) {
        HomeIndex3Model* model = self.dataSource3[indexPath.row];
        return [HomeIndex3TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex3TableViewCell *cell = (HomeIndex3TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (4 == indexPath.section) {
        HomeIndex4Model* model = self.dataSource4[indexPath.row];
        return [HomeIndex4TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex4TableViewCell *cell = (HomeIndex4TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (5 == indexPath.section) {
        HomeIndex5Model* model = self.dataSource5[indexPath.row];
        return [HomeIndex5TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex5TableViewCell *cell = (HomeIndex5TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (6 == indexPath.section) {
        HomeIndex7Model* model = self.dataSource7[indexPath.row];
        return [HomeIndex7TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex7TableViewCell *cell = (HomeIndex7TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (7 == indexPath.section) {
        HomeIndex6Model* model = self.dataSource6[indexPath.row];
        return [HomeIndex6TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex6TableViewCell *cell = (HomeIndex6TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (8 == indexPath.section) {
        HomeIndex8Model* model = self.dataSource8[indexPath.row];
        return [HomeIndex8TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex8TableViewCell *cell = (HomeIndex8TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }else if (9 == indexPath.section) {
        HomeIndex9Model* model = self.dataSource9[indexPath.row];
        return [HomeIndex9TableViewCell hyb_heightForIndexPath:indexPath config:^(UITableViewCell *sourceCell) {
            HomeIndex9TableViewCell *cell = (HomeIndex9TableViewCell *)sourceCell;
            [cell configCellWithModel:model];
        }];
    }
    return 0;
    
}

#pragma mark - tableview组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 10;
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

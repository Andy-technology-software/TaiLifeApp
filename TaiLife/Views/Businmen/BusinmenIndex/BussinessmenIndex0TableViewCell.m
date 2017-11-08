//
//  BussinessmenIndex0TableViewCell.m
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "BussinessmenIndex0TableViewCell.h"

#import "BussinessmenIndex0Model.h"
@interface BussinessmenIndex0TableViewCell()<CycleScrollViewDelegate>

@property (nonatomic,strong) CycleScrollView* cycleScrollView;
@property (nonatomic,strong) UIView* bottomView;

@end
@implementation BussinessmenIndex0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    //网络加载 --- 创建带标题的图片轮播器
    self.cycleScrollView = [CycleScrollView cycleScrollViewWithFrame:self.contentView.frame imageURLStringsGroup:nil];
    self.cycleScrollView.layer.cornerRadius = 6;
    self.cycleScrollView.layer.masksToBounds = YES;
    [self.cycleScrollView setContentMode:UIViewContentModeScaleAspectFill];
    self.cycleScrollView.clipsToBounds = YES;
    [self.contentView addSubview:self.cycleScrollView];
    
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_offset([XRQController getScreenWidth] * 29/60);
    }];
    
    self.bottomView = [XRQController viewWithFrame:self.contentView.frame];
    self.bottomView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bottomView];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.cycleScrollView);
        make.right.mas_equalTo(self.cycleScrollView);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom);
        make.height.mas_offset([XRQController getScreenWidth] * 7 / 32);
    }];
    
    self.hyb_lastViewInCell = self.bottomView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(BussinessmenIndex0Model *)model {
    if (model._imgArr.count) {
        self.cycleScrollView.pageControlAliment = CycleScrollViewPageContolAlimentCenter;
        self.cycleScrollView.pageControlStyle = CycleScrollViewPageContolStyleClassic;
        self.cycleScrollView.delegate = self;
        //        self.cycleScrollView.dotColor = [UIColor blackColor]; // 自定义分页控件小圆标颜色
        //        self.cycleScrollView.indicatorDotColor = [UIColor whiteColor];
        self.cycleScrollView.placeholderImage = [UIImage imageNamed:@""];
        self.cycleScrollView.autoScrollTimeInterval = 4.0;
        //        self.cycleScrollView.hidesForSinglePage = YES;
        self.cycleScrollView.imageURLStringsGroup = model._imgArr;
        if (1 == model._imgArr.count) {
            self.cycleScrollView.showPageControl = NO;
            self.cycleScrollView.autoScroll = NO;
        }
    }
    
    float viewWidth = ([XRQController getScreenWidth] - 50) / 4;
    NSArray* imgArr = [[NSArray alloc] initWithObjects:@"清洁日化",@"粮油调味",@"肉禽蛋奶",@"蔬菜水果", nil];
    for (int i = 0; i < imgArr.count; i++) {
        UIImageView* _imageV = [XRQController createImageViewWithFrame:CGRectMake((viewWidth + 10) * i , (([XRQController getScreenWidth] * 7 / 32) - (viewWidth * 4 / 7)) / 2, viewWidth, viewWidth * 4 / 7) ImageName:imgArr[i]];
        _imageV.backgroundColor = [UIColor redColor];
        [self.bottomView addSubview:_imageV];
        
        UIButton* clickB = [XRQController createButtonWithFrame:_imageV.frame ImageName:nil Target:self Action:@selector(clickBClick:) Title:nil];
        clickB.tag = 100 + i;
        [self.bottomView addSubview:clickB];
    }
    
}

#pragma mark - 轮滚点击代理
- (void)cycleScrollView:(CycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---点击了第%ld张图片", (long)index);
    [self.BussinessmenIndex0TableViewCellDelegate didselectADPic:index];
}

#pragma mark - 分类点击代理
- (void)clickBClick:(UIButton*)btn{
    [self.BussinessmenIndex0TableViewCellDelegate sendBackItem:btn.tag - 100];
    
}


@end

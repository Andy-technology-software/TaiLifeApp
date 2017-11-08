//
//  BussinessmenIndex3TableViewCell.m
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "BussinessmenIndex3TableViewCell.h"

#import "BussinessmenIndex3Model.h"
@interface BussinessmenIndex3TableViewCell()
@property (nonatomic,strong) UIView* topLineView0;
@property (nonatomic,strong) UIView* topLineView1;

@property (nonatomic,strong) UIImageView* bgImageView;
@property (nonatomic,strong) UIButton* bgImageViewBtn;

@property (nonatomic,strong) UILabel* title0;
@property (nonatomic,strong) UILabel* title1;
@property (nonatomic,strong) UILabel* title2;

@property (nonatomic,strong) UIImageView* moreIV;
@property (nonatomic,strong) UIButton* moreBtn;

@end
@implementation BussinessmenIndex3TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.title0 = [XRQController createLabelWithFrame:self.contentView.frame Font:14 Text:@"商户管理"];
    self.title0.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.title0];
    
    [self.title0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(22);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.width.mas_offset(61);
    }];
    
    self.topLineView0 = [XRQController viewWithFrame:self.contentView.frame];
    self.topLineView0.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.topLineView0];
    
    [self.topLineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.title0.mas_centerY);
        make.right.mas_equalTo(self.title0.mas_left);
        make.width.mas_offset(29);
        make.height.mas_offset(1);
    }];
    
    self.topLineView1 = [XRQController viewWithFrame:self.contentView.frame];
    self.topLineView1.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.topLineView1];
    
    [self.topLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.title0.mas_centerY);
        make.left.mas_equalTo(self.title0.mas_right);
        make.width.mas_offset(29);
        make.height.mas_offset(1);
    }];
    
    self.title1 = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:@"舒适生活从现在开始"];
    self.title1.textAlignment = NSTextAlignmentCenter;
    self.title1.textColor = [XRQController colorWithHexString:@"969696"];
    [self.contentView addSubview:self.title1];
    
    [self.title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title0.mas_bottom).mas_offset(6);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    self.bgImageView = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.bgImageView.layer.cornerRadius = 6;
    self.bgImageView.layer.masksToBounds = YES;
    [self.bgImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.bgImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.title1.mas_bottom).mas_offset(12);
        make.height.mas_offset([XRQController getScreenWidth] * 156 / 600);
    }];
    
    self.bgImageViewBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(bgImageViewBtnClick) Title:nil];
    [self.contentView addSubview:self.bgImageViewBtn];
    
    [self.bgImageViewBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.title1.mas_bottom).mas_offset(12);
        make.height.mas_offset([XRQController getScreenWidth] * 156 / 600);
    }];
    
    self.moreIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:@""];
    self.moreIV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.moreIV];
    
    [self.moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.bgImageView.mas_bottom).mas_offset(12);
        make.height.mas_offset(12);
        make.width.mas_offset(12);
    }];
    
    self.title2 = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:@"了解更多商户"];
    self.title2.textAlignment = NSTextAlignmentCenter;
    self.title2.textColor = [XRQController colorWithHexString:@"969696"];
    [self.contentView addSubview:self.title2];
    
    [self.title2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moreIV.mas_bottom).mas_offset(4);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    self.moreBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(moreBtnClick) Title:nil];
    [self.contentView addSubview:self.moreBtn];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moreIV);
        make.left.mas_equalTo(self.title2.mas_left);
        make.right.mas_equalTo(self.title2.mas_right);
        make.bottom.mas_equalTo(self.title2.mas_bottom);
    }];
    
    self.hyb_lastViewInCell = self.title2;
    self.hyb_bottomOffsetToCell = 5;
}

- (void)configCellWithModel:(BussinessmenIndex3Model *)model {
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:model._img] placeholderImage:[UIImage imageNamed:@""]];
    
}


#pragma mark - 分类点击代理
- (void)bgImageViewBtnClick{
    [self.BussinessmenIndex3TableViewCellDelegate sendBack3Item];
    
}

- (void)moreBtnClick {
    [self.BussinessmenIndex3TableViewCellDelegate s3MoreClick];
    
}

@end

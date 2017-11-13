//
//  HomeIndex3TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex3TableViewCell.h"

#import "HomeIndex3Model.h"
@interface HomeIndex3TableViewCell()
@property (nonatomic,strong) UIView* topLineView0;
@property (nonatomic,strong) UIView* topLineView1;

@property (nonatomic,strong) UIView* bgView;

@property (nonatomic,strong) UILabel* title0;

@end
@implementation HomeIndex3TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.title0 = [XRQController createLabelWithFrame:self.contentView.frame Font:14 Text:@"社区活动"];
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
    
    self.bgView = [XRQController viewWithFrame:self.contentView.frame];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.title0.mas_bottom).mas_offset(20);
        make.height.mas_offset([XRQController getScreenWidth] * 114 / 640);
    }];
    
    
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(HomeIndex3Model *)model {
    float viewWidth = ([XRQController getScreenWidth] - 40) / 3;
    for (int i = 0; i < model._imgArr.count; i++) {
        UIImageView* _BV = [XRQController createImageViewWithFrame:CGRectMake((viewWidth + 10) * i + 10, 0, viewWidth, [XRQController getScreenWidth] * 114 / 640) ImageName:nil];
        [_BV sd_setImageWithURL:[NSURL URLWithString:model._imgArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        _BV.layer.cornerRadius = 6;
        _BV.layer.masksToBounds = YES;
        [_BV setContentMode:UIViewContentModeScaleAspectFill];
        _BV.clipsToBounds = YES;
        [self.bgView addSubview:_BV];
    
        UIButton* clickB = [XRQController createButtonWithFrame:_BV.frame ImageName:nil Target:self Action:@selector(clickBClick:) Title:nil];
        clickB.tag = 100 + i;
        [self.bgView addSubview:clickB];
    }
}


#pragma mark - 分类点击代理
- (void)clickBClick:(UIButton*)btn{
    [self.HomeIndex3TableViewCellDelegate sendBack3Item:btn.tag - 100];
    
}


@end

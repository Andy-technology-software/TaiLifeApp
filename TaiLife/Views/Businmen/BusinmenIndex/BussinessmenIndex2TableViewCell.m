//
//  BussinessmenIndex2TableViewCell.m
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "BussinessmenIndex2TableViewCell.h"

#import "BussinessmenIndex2Model.h"
@interface BussinessmenIndex2TableViewCell()
@property (nonatomic,strong) UIView* topLineView0;
@property (nonatomic,strong) UIView* topLineView1;

@property (nonatomic,strong) UIView* bgView;

@property (nonatomic,strong) UILabel* title0;
@property (nonatomic,strong) UILabel* title1;
@property (nonatomic,strong) UILabel* title2;

@property (nonatomic,strong) UIImageView* moreIV;
@property (nonatomic,strong) UIButton* moreBtn;

@end
@implementation BussinessmenIndex2TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.title0 = [XRQController createLabelWithFrame:self.contentView.frame Font:14 Text:@"团购管理"];
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
    
    self.bgView = [XRQController viewWithFrame:self.contentView.frame];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.title1.mas_bottom).mas_offset(12);
        make.height.mas_offset([XRQController getScreenWidth] * 21 / 64);
    }];
    
    self.moreIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:@""];
    self.moreIV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.moreIV];
    
    [self.moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.bgView.mas_bottom).mas_offset(4);
        make.height.mas_offset(12);
        make.width.mas_offset(12);
    }];
    
    self.title2 = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:@"了解更多团购"];
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

- (void)configCellWithModel:(BussinessmenIndex2Model *)model {
    float viewWidth = ([XRQController getScreenWidth] - 40) / 2;
    for (int i = 0; i < model._imgArr.count; i++) {
        UIImageView* _imageV = [XRQController createImageViewWithFrame:CGRectMake((viewWidth + 10) * i + 10 * (i + 1), 0, viewWidth, viewWidth * 172 / 282) ImageName:nil];
        [_imageV sd_setImageWithURL:[NSURL URLWithString:model._imgArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        _imageV.layer.cornerRadius = 6;
        _imageV.layer.masksToBounds = YES;
        [_imageV setContentMode:UIViewContentModeScaleAspectFill];
        _imageV.clipsToBounds = YES;
        [self.bgView addSubview:_imageV];
        
        UILabel* titleL = [XRQController createLabelWithFrame:CGRectMake(_imageV.frame.origin.x, CGRectGetMaxY(_imageV.frame) + 5, _imageV.frame.size.width, 15) Font:12 Text:model._titleArr[i]];
        titleL.textAlignment = NSTextAlignmentCenter;
        titleL.numberOfLines = 1;
        titleL.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.bgView addSubview:titleL];
        
        UIButton* clickB = [XRQController createButtonWithFrame:CGRectMake(_imageV.frame.origin.x, 0, _imageV.frame.size.width, [XRQController getScreenWidth] * 21 / 64) ImageName:nil Target:self Action:@selector(clickBClick:) Title:nil];
        clickB.tag = 100 + i;
        [self.bgView addSubview:clickB];
    }
}


#pragma mark - 分类点击代理
- (void)clickBClick:(UIButton*)btn{
    [self.BussinessmenIndex2TableViewCellDelegate sendBack2Item:btn.tag - 100];
    
}

- (void)moreBtnClick {
    [self.BussinessmenIndex2TableViewCellDelegate s2MoreClick];
    
}

@end

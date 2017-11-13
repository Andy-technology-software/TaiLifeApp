//
//  HomeIndex7TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex7TableViewCell.h"

#import "HomeIndex7Model.h"
@interface HomeIndex7TableViewCell()
@property (nonatomic,strong) UIView* topLineView0;
@property (nonatomic,strong) UIView* topLineView1;
@property (nonatomic,strong) UILabel* title0;

@property (nonatomic,strong) UIImageView* imgIV0;
@property (nonatomic,strong) UIButton* imgBtn0;

@property (nonatomic,strong) UIImageView* imgIV1;
@property (nonatomic,strong) UIButton* imgBtn1;

@property (nonatomic,strong) UIImageView* imgIV2;
@property (nonatomic,strong) UIButton* imgBtn2;
@end
@implementation HomeIndex7TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.title0 = [XRQController createLabelWithFrame:self.contentView.frame Font:14 Text:@"房产展示"];
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
    
    self.imgIV0 = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.imgIV0.layer.cornerRadius = 6;
    self.imgIV0.layer.masksToBounds = YES;
    [self.imgIV0 setContentMode:UIViewContentModeScaleAspectFill];
    self.imgIV0.clipsToBounds = YES;
    [self.contentView addSubview:self.imgIV0];
    
    [self.imgIV0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.contentView.mas_centerX).mas_offset(-5);
        make.height.mas_offset(([XRQController getScreenWidth]/2 - 15)*209/292);
        make.top.mas_equalTo(self.title0.mas_bottom).mas_offset(20);
    }];
    
    self.imgBtn0 = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(imgBtn0Click) Title:nil];
    [self.contentView addSubview:self.imgBtn0];
    
    [self.imgBtn0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(self.contentView.mas_centerX).mas_offset(-5);
        make.height.mas_offset(([XRQController getScreenWidth]/2 - 15)*209/292);
        make.top.mas_equalTo(self.title0.mas_bottom).mas_offset(20);
    }];
    
    
    self.imgIV1 = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.imgIV1.layer.cornerRadius = 6;
    self.imgIV1.layer.masksToBounds = YES;
    [self.imgIV1 setContentMode:UIViewContentModeScaleAspectFill];
    self.imgIV1.clipsToBounds = YES;
    [self.contentView addSubview:self.imgIV1];
    
    [self.imgIV1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV0.mas_right).mas_offset(5);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(self.imgIV0.mas_centerY).mas_offset(-3);
        make.top.mas_equalTo(self.imgIV0);
    }];
    
    self.imgBtn1 = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(imgBtn1Click) Title:nil];
    [self.contentView addSubview:self.imgBtn1];
    
    [self.imgBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV0.mas_right).mas_offset(5);
        make.right.mas_equalTo(-10);
        make.bottom.mas_equalTo(self.imgIV0.mas_centerY).mas_offset(-3);
        make.top.mas_equalTo(self.imgIV0);
    }];
    
    self.imgIV2 = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.imgIV2.layer.cornerRadius = 6;
    self.imgIV2.layer.masksToBounds = YES;
    [self.imgIV2 setContentMode:UIViewContentModeScaleAspectFill];
    self.imgIV2.clipsToBounds = YES;
    [self.contentView addSubview:self.imgIV2];
    
    [self.imgIV2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV1);
        make.right.mas_equalTo(self.imgIV1);
        make.top.mas_equalTo(self.imgIV1.mas_bottom).mas_offset(3);
        make.bottom.mas_equalTo(self.imgIV0);
    }];
    
    self.imgBtn2 = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(imgBtn2Click) Title:nil];
    [self.contentView addSubview:self.imgBtn2];
    
    [self.imgBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imgIV1);
        make.right.mas_equalTo(self.imgIV1);
        make.top.mas_equalTo(self.imgIV1.mas_bottom).mas_offset(3);
        make.bottom.mas_equalTo(self.imgIV0);
    }];
    
    self.hyb_lastViewInCell = self.imgIV0;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(HomeIndex7Model *)model {
    [self.imgIV0 sd_setImageWithURL:[NSURL URLWithString:model._img0] placeholderImage:[UIImage imageNamed:@""]];
    
    [self.imgIV1 sd_setImageWithURL:[NSURL URLWithString:model._img1] placeholderImage:[UIImage imageNamed:@""]];
    
    [self.imgIV2 sd_setImageWithURL:[NSURL URLWithString:model._img2] placeholderImage:[UIImage imageNamed:@""]];
}

- (void)imgBtn0Click {
    [self.HomeIndex7TableViewCellDelegate sendBack7Item:0];
}

- (void)imgBtn1Click {
    [self.HomeIndex7TableViewCellDelegate sendBack7Item:1];
}

- (void)imgBtn2Click {
    [self.HomeIndex7TableViewCellDelegate sendBack7Item:2];
}
@end

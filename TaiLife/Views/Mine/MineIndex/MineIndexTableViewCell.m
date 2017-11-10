//
//  MineIndexTableViewCell.m
//  TaiLife
//
//  Created by lingnet on 2017/11/6.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "MineIndexTableViewCell.h"

#import "MineIndexModel.h"
@interface MineIndexTableViewCell()
@property (nonatomic,strong) UIImageView* topImageView;
@property (nonatomic,strong) UILabel* titleLable;
@property (nonatomic,strong) UIImageView* headImageView;
@property (nonatomic,strong) UIButton* headBtn;
@property (nonatomic,strong) UILabel* nameLable;
@property (nonatomic,strong) UILabel* jifenLable;
@property (nonatomic,strong) UIButton* openBtn;
@end
@implementation MineIndexTableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [XRQController colorWithHexString:@"f2f2f2"];
    
    self.topImageView = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.topImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.topImageView];
    
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset([XRQController getScreenWidth] * 372 / 640);
    }];
    
    self.titleLable = [XRQController createLabelWithFrame:self.contentView.frame Font:18 Text:@"我的"];
    self.titleLable.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLable];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(29);
    }];
    
    self.openBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:@"" Target:self Action:@selector(openBtnClick) Title:nil];
    [self.openBtn setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:self.openBtn];
    
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(self.titleLable.mas_centerY);
        make.height.mas_offset(22);
        make.width.mas_offset(44);
    }];
    
    self.headImageView = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.headImageView.backgroundColor = [UIColor whiteColor];
    self.headImageView.layer.cornerRadius = 33;
    self.headImageView.layer.masksToBounds = YES;
    [self.headImageView setContentMode:UIViewContentModeScaleAspectFill];
    self.headImageView.clipsToBounds = YES;
    [self.contentView addSubview:self.headImageView];
    
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(-5);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.width.mas_offset(66);
        make.height.mas_offset(66);
    }];
    
    self.headBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(headBtnClick) Title:nil];
    [self.contentView addSubview:self.headBtn];
    
    [self.headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY).mas_offset(-5);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.width.mas_offset(66);
        make.height.mas_offset(66);
    }];
    
    self.nameLable = [XRQController createLabelWithFrame:self.contentView.frame Font:14 Text:nil];
    self.nameLable.textColor = [UIColor whiteColor];
    self.nameLable.numberOfLines = 0;
    self.nameLable.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.nameLable];
    
    [self.nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.headImageView.mas_bottom).mas_offset(12);
    }];
    
    self.jifenLable = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:nil];
    self.jifenLable.textColor = [UIColor whiteColor];
    self.jifenLable.textAlignment = NSTextAlignmentCenter;
    self.jifenLable.numberOfLines = 0;
    [self.contentView addSubview:self.jifenLable];
    
    [self.jifenLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.nameLable.mas_bottom).mas_offset(10);
    }];
    
    self.hyb_lastViewInCell = self.topImageView;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(MineIndexModel *)model {
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model._headImage] placeholderImage:[UIImage imageNamed:@""]];
    self.nameLable.text = model._name;
    self.jifenLable.text = [NSString stringWithFormat:@"积分：%@",model._jifen];
}

- (void)openBtnClick {
    [self.MineIndexTableViewCellDelegate sendBack0OpenDoor];
    
}

- (void)headBtnClick {
    [self.MineIndexTableViewCellDelegate sendBack0HeadImage];
}

@end

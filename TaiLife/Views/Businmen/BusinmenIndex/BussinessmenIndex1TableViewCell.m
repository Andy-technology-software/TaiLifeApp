//
//  BussinessmenIndex1TableViewCell.m
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "BussinessmenIndex1TableViewCell.h"

@interface BussinessmenIndex1TableViewCell()

@property (nonatomic,strong) UIView* topLineView;

@property (nonatomic,strong) UIButton* YSImageBtn;
@property (nonatomic,strong) UIButton* SHImageBtn;
@property (nonatomic,strong) UIButton* JHImageBtn;

@end
@implementation BussinessmenIndex1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [XRQController colorWithHexString:@"f2f2f2"];
    
    self.YSImageBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:@"" Target:self Action:@selector(YSImageBtnClick) Title:@"火爆预售"];
    [self.YSImageBtn setBackgroundColor:[UIColor redColor]];
    [self.YSImageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.YSImageBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.YSImageBtn];
    
    [self.YSImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(7);
        make.width.mas_offset([XRQController getScreenWidth]*42/64);
        make.height.mas_offset(([XRQController getScreenWidth]*42/64)*183/420);
    }];
    
    self.SHImageBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:@"" Target:self Action:@selector(SHImageBtnClick) Title:@"调味生活"];
    [self.SHImageBtn setBackgroundColor:[UIColor blueColor]];
    [self.SHImageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.SHImageBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.SHImageBtn];
    
    [self.SHImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.YSImageBtn);
        make.top.mas_equalTo(self.YSImageBtn.mas_bottom).mas_offset(0.5);
        make.width.mas_equalTo(self.YSImageBtn);
        make.height.mas_offset(([XRQController getScreenWidth]*42/64)*132/420);
    }];
    
    self.JHImageBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:@"" Target:self Action:@selector(JHImageBtnClick) Title:@"发现尖货"];
    [self.JHImageBtn setBackgroundColor:[UIColor greenColor]];
    [self.JHImageBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.JHImageBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.JHImageBtn];
    
    [self.JHImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.YSImageBtn.mas_right).mas_offset(0.5);
        make.top.mas_equalTo(self.YSImageBtn);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.SHImageBtn.mas_bottom);
    }];
    
    self.hyb_lastViewInCell = self.JHImageBtn;
    self.hyb_bottomOffsetToCell = 7;
}

- (void)configCellWithModel {
    
}

- (void)YSImageBtnClick {
    [self.BussinessmenIndex1TableViewCellDelegate sendBackYS];
}

- (void)SHImageBtnClick {
    [self.BussinessmenIndex1TableViewCellDelegate sendBackSH];
}

- (void)JHImageBtnClick {
    [self.BussinessmenIndex1TableViewCellDelegate sendBackJH];
}

@end

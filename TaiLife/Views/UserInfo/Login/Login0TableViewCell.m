//
//  Login0TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "Login0TableViewCell.h"

#import "LoginModel.h"
@interface Login0TableViewCell()

@property (nonatomic,strong) UIImageView* topImageView;

@property (nonatomic,strong) UIButton* passBtn;
@property (nonatomic,strong) UIView* passLineView;
@property (nonatomic,strong) UIButton* codeBtn;
@property (nonatomic,strong) UIView* codeLineView;

@property (nonatomic,strong) UIButton* backBtn;
@end
@implementation Login0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [XRQController colorWithHexString:@"ffffff"];
    
    self.topImageView = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.topImageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.topImageView];
    
    [self.topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset([XRQController getScreenWidth] * 378 / 640);
    }];
    
    self.backBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(backBtnClick) Title:nil];
    [self.backBtn setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:self.backBtn];
    
    [self.backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.mas_equalTo(35);
        make.height.mas_offset(35);
        make.width.mas_offset(35);
    }];
    
    
    self.passBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(passBtnClick) Title:@"密码登录"];
    [self.passBtn setBackgroundColor:[UIColor clearColor]];
    [self.passBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.passBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.passBtn];
    
    [self.passBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(28);
        make.top.mas_equalTo(self.topImageView.mas_bottom).mas_offset(25);
        make.width.mas_offset(69);
        make.height.mas_offset(25);
    }];
    
    self.passLineView = [XRQController viewWithFrame:self.contentView.frame];
    self.passLineView.backgroundColor = [XRQController colorWithHexString:@"f34226"];
    [self.contentView addSubview:self.passLineView];
    
    [self.passLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.passBtn.mas_centerX);
        make.top.mas_equalTo(self.passBtn.mas_bottom);
        make.width.mas_equalTo(self.passBtn);
        make.height.mas_offset(2.5);
    }];
    
    self.codeBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(codeBtnClick) Title:@"验证码登录"];
    [self.codeBtn setBackgroundColor:[UIColor clearColor]];
    [self.codeBtn setTitleColor:[XRQController colorWithHexString:@"c3c4ce"] forState:UIControlStateNormal];
    self.codeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.codeBtn];
    
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passBtn.mas_right).mas_offset(19);
        make.top.mas_equalTo(self.passBtn);
        make.width.mas_offset(92);
        make.height.mas_equalTo(self.passBtn);
    }];
    
    self.codeLineView = [XRQController viewWithFrame:self.contentView.frame];
    self.codeLineView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:self.codeLineView];
    
    [self.codeLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.codeBtn.mas_centerX);
        make.top.mas_equalTo(self.codeBtn.mas_bottom);
        make.width.mas_equalTo(self.codeBtn);
        make.height.mas_offset(2.5);
    }];
    
    self.hyb_lastViewInCell = self.codeLineView;
    self.hyb_bottomOffsetToCell = 25;

}

- (void)configCellWithModel:(LoginModel *)model {
    if (model._isPass) {
        [self.passBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.passLineView.backgroundColor = [XRQController colorWithHexString:@"f34226"];

        [self.codeBtn setTitleColor:[XRQController colorWithHexString:@"c3c4ce"] forState:UIControlStateNormal];
        self.codeLineView.backgroundColor = [UIColor clearColor];
        
    }else {
        [self.codeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.codeLineView.backgroundColor = [XRQController colorWithHexString:@"f34226"];
        
        [self.passBtn setTitleColor:[XRQController colorWithHexString:@"c3c4ce"] forState:UIControlStateNormal];
        self.passLineView.backgroundColor = [UIColor clearColor];
    }
}

- (void)backBtnClick {
    [self.Login0TableViewCellDelegate sendBackBackNav];
}

- (void)passBtnClick {
    [self.Login0TableViewCellDelegate sendBackLogin0Bool:YES];
}

- (void)codeBtnClick {
    [self.Login0TableViewCellDelegate sendBackLogin0Bool:NO];
}

@end

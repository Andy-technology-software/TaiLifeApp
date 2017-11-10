//
//  Login2TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "Login2TableViewCell.h"

#import "LoginModel.h"
@interface Login2TableViewCell()<UITextFieldDelegate>

@property (nonatomic,strong) UIButton* sureBtn;
@property (nonatomic,strong) UIButton* sureBtn1;
@property (nonatomic,strong) UILabel* sureLable;
@property (nonatomic,strong) UIButton* sureLabletn;

@property (nonatomic,strong) UIButton* loginBtn;
@property (nonatomic,strong) UIButton* forPassBtn;
@property (nonatomic,strong) UIButton* regNowBtn;

@end
@implementation Login2TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.sureBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:@"" Target:self Action:@selector(sureBtnClick) Title:nil];
    [self.sureBtn setBackgroundColor:[UIColor blackColor]];
    [self.contentView addSubview:self.sureBtn];
    
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(33);
        make.top.mas_equalTo(5);
        make.width.mas_offset(12);
        make.height.mas_offset(12);
    }];
    
    self.sureBtn1 = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(sureBtnClick) Title:nil];
    [self.contentView addSubview:self.sureBtn1];
    
    [self.sureBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.sureBtn.mas_centerX);
        make.centerY.mas_equalTo(self.sureBtn.mas_centerY);
        make.width.mas_offset(25);
        make.height.mas_offset(25);
    }];
    
    self.sureLable = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:@"我已经阅读并同意《用户协议及隐私政策》条款"];
    self.sureLable.textColor = [XRQController colorWithHexString:@"818181"];
    [self.contentView addSubview:self.sureLable];
    
    [self.sureLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.sureBtn1.mas_centerY);
        make.left.mas_equalTo(self.sureBtn.mas_right).mas_offset(10);
    }];
    
    self.sureLabletn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(sureLabletnClick) Title:nil];
    [self.contentView addSubview:self.sureLabletn];
    
    [self.sureLabletn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sureLable);
        make.top.mas_equalTo(self.sureLable);
        make.width.mas_equalTo(self.sureLable);
        make.height.mas_equalTo(self.sureLable);
    }];
    
    self.loginBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:@"" Target:self Action:@selector(loginBtnClick) Title:@"登录"];
    [self.loginBtn setBackgroundColor:[XRQController colorWithHexString:@"f34226"]];
    [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.contentView addSubview:self.loginBtn];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.right.mas_equalTo(-30);
        make.top.mas_equalTo(self.sureBtn.mas_bottom).mas_offset(10);
        make.height.mas_offset(([XRQController getScreenWidth] - 60)*75/520);
    }];
    
    self.forPassBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(forPassBtnClick) Title:@"忘记密码"];
    [self.forPassBtn setTitleColor:[XRQController colorWithHexString:@"738098"] forState:UIControlStateNormal];
    self.forPassBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.forPassBtn];
    
    [self.forPassBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.loginBtn);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_offset(10);
        make.height.mas_offset(30);
        make.width.mas_offset(50);
    }];
    
    self.regNowBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(regNowBtnClick) Title:@"立即注册"];
    [self.regNowBtn setTitleColor:[XRQController colorWithHexString:@"738098"] forState:UIControlStateNormal];
    self.regNowBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.regNowBtn];
    
    [self.regNowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.loginBtn);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).mas_offset(10);
        make.height.mas_offset(30);
        make.width.mas_offset(50);
    }];
    
    self.hyb_lastViewInCell = self.regNowBtn;
    self.hyb_bottomOffsetToCell = 20;
}


- (void)configCellWithModel:(LoginModel *)model {
    [XRQController fuwenbenLabel:self.sureLable FontNumber:[UIFont systemFontOfSize:12] AndRange:NSMakeRange(8, 11) AndColor:[XRQController colorWithHexString:@"92a7c7"]];
    
    if (model._isSure) {
        [self.sureBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }else {
        [self.sureBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    }
}

- (void)sureBtnClick {
    [self.Login2TableViewCellDelegate sendBackIsSure];
}

- (void)loginBtnClick {
    [self.Login2TableViewCellDelegate sendBackLogin];
}

- (void)forPassBtnClick {
    [self.Login2TableViewCellDelegate sendBackForPass];
}

- (void)regNowBtnClick {
    [self.Login2TableViewCellDelegate sendBackRegNow];
}

- (void)sureLabletnClick {
    [self.Login2TableViewCellDelegate sendBackReadText];
}


@end

//
//  Login1TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "Login1TableViewCell.h"

#import "LoginModel.h"
@interface Login1TableViewCell()<UITextFieldDelegate>

@property (nonatomic,strong) UITextField* usernameTF;
@property (nonatomic,strong) UIView* usernameLineView;

@property (nonatomic,strong) UITextField* passTF;
@property (nonatomic,strong) UIView* passLineView;

@end
@implementation Login1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [XRQController colorWithHexString:@"ffffff"];
    
    self.usernameTF = [XRQController createTextFieldWithFrame:self.contentView.frame placeholder:@"请输入用户名" passWord:NO leftImageView:nil rightImageView:nil Font:14];
    self.usernameTF.delegate = self;
    self.usernameTF.tag = 100;
    [self.contentView addSubview:self.usernameTF];
    
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(28);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(5);
        make.height.mas_offset(20);
    }];
    
    self.usernameLineView = [XRQController viewWithFrame:self.contentView.frame];
    self.usernameLineView.backgroundColor = [XRQController colorWithHexString:@"e4e4e9"];
    [self.contentView addSubview:self.usernameLineView];
    
    [self.usernameLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.usernameTF);
        make.right.mas_equalTo(self.usernameTF);
        make.top.mas_equalTo(self.usernameTF.mas_bottom).mas_offset(9);
        make.height.mas_offset(0.5);
    }];
    
    self.passTF = [XRQController createTextFieldWithFrame:self.contentView.frame placeholder:@"请输入密码" passWord:YES leftImageView:nil rightImageView:nil Font:14];
    self.passTF.delegate = self;
    self.passTF.tag = 101;
    [self.contentView addSubview:self.passTF];
    
    [self.passTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.usernameTF);
        make.right.mas_equalTo(self.usernameTF);
        make.top.mas_equalTo(self.usernameLineView.mas_bottom).mas_offset(29);
        make.height.mas_equalTo(self.usernameTF);
    }];
    
    self.passLineView = [XRQController viewWithFrame:self.contentView.frame];
    self.passLineView.backgroundColor = [XRQController colorWithHexString:@"e4e4e9"];
    [self.contentView addSubview:self.passLineView];
    
    [self.passLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.passTF);
        make.right.mas_equalTo(self.passTF);
        make.top.mas_equalTo(self.passTF.mas_bottom).mas_offset(9);
        make.height.mas_offset(0.5);
    }];

    
    self.hyb_lastViewInCell = self.passLineView;
    self.hyb_bottomOffsetToCell = 35;
}

- (void)configCellWithModel:(LoginModel *)model {
    self.usernameTF.text = model._username;
    
    self.passTF.text = model._password;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if (100 == textField.tag) {
        [self.Login1TableViewCellDelegate sendBackUsername:textField.text];
    }else {
        [self.Login1TableViewCellDelegate sendBackPassword:textField.text];
    }
}


@end

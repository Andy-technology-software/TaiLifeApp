//
//  MineIndex3TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "MineIndex3TableViewCell.h"

@interface MineIndex3TableViewCell()
@property (nonatomic,strong) UIButton* logOut;

@property (nonatomic,strong) UILabel* titleLable;
@end
@implementation MineIndex3TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.logOut = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(logOutClick) Title:@"退出登录"];
    [self.logOut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.logOut.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.logOut setBackgroundColor:[XRQController colorWithHexString:REDCOLOR]];
    [self.contentView addSubview:self.logOut];
    
    [self.logOut mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.top.mas_equalTo(16);
        make.height.mas_offset([XRQController getScreenWidth]*16/125);
    }];
    
    self.hyb_lastViewInCell = self.logOut;
    self.hyb_bottomOffsetToCell = 18;
}

- (void)configCellWithModel {
    
}

- (void)logOutClick {
    [self.MineIndex3TableViewCellDelegate sendBack3LogOut];
}

@end

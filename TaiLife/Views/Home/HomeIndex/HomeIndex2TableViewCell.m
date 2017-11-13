//
//  HomeIndex2TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex2TableViewCell.h"

#import "HomeIndex2Model.h"
@interface HomeIndex2TableViewCell()
@property (nonatomic,strong) UIView* bgView;

@property (nonatomic,strong) UIImageView* leftIV;
@property (nonatomic,strong) UIImageView* cirIV;
@property (nonatomic,strong) UIImageView* rightIV;

@property (nonatomic,strong) UILabel* titleLable;
@property (nonatomic,strong) UILabel* desLable;
@property (nonatomic,strong) UILabel* timeLable;
@end
@implementation HomeIndex2TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [XRQController colorWithHexString:@"f5f5f5"];
    
    self.bgView = [XRQController viewWithFrame:self.contentView.frame];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_offset(65);
    }];
    
    
    self.leftIV = [XRQController createImageViewWithFrame:self.bgView.frame ImageName:@"首页"];
    [self.bgView addSubview:self.leftIV];
    
    [self.leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.centerY.mas_equalTo(self.bgView.mas_centerY);
        make.width.mas_offset(32);
        make.height.mas_offset(32);
    }];
    
    
    self.cirIV = [XRQController createImageViewWithFrame:self.bgView.frame ImageName:@""];
    self.cirIV.backgroundColor = [UIColor blackColor];
    [self.bgView addSubview:self.cirIV];
    
    [self.cirIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftIV.mas_right).mas_offset(8);
        make.top.mas_equalTo(22);
        make.width.mas_offset(6);
        make.height.mas_offset(6);
    }];
    
    self.rightIV = [XRQController createImageViewWithFrame:self.bgView.frame ImageName:@""];
    self.rightIV.backgroundColor = [UIColor blackColor];
    [self.bgView addSubview:self.rightIV];
    
    [self.rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(self.bgView.mas_centerY);
        make.width.mas_offset(17);
        make.height.mas_offset(17);
    }];
    
    
    
    self.timeLable = [XRQController createLabelWithFrame:self.bgView.frame Font:8 Text:nil];
    self.timeLable.textColor = [XRQController colorWithHexString:@"cecece"];
    [self.bgView addSubview:self.timeLable];
    
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.rightIV.mas_left).mas_offset(-10);
        make.top.mas_equalTo(22);
    }];
    
    self.titleLable = [XRQController createLabelWithFrame:self.bgView.frame Font:12 Text:nil];
    self.titleLable.numberOfLines = 1;
    self.titleLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.bgView addSubview:self.titleLable];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.cirIV.mas_right).mas_offset(5);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(self.timeLable.mas_left).mas_offset(-4);
    }];
    
    self.desLable = [XRQController createLabelWithFrame:self.bgView.frame Font:10 Text:nil];
    self.desLable.textColor = [XRQController colorWithHexString:@"8c8c8c"];
    self.desLable.numberOfLines = 1;
    self.desLable.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.bgView addSubview:self.desLable];
    
    [self.desLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLable);
        make.top.mas_equalTo(self.titleLable.mas_bottom).mas_offset(6);
        make.right.mas_equalTo(self.timeLable);
    }];
    
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 6;
    
}

- (void)configCellWithModel:(HomeIndex2Model *)model {
    self.titleLable.text = model._title;
    
    self.desLable.text = model._des;
    
    self.timeLable.text = model._time;
}

@end

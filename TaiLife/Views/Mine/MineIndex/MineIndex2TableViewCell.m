//
//  MineIndex2TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "MineIndex2TableViewCell.h"

#import "MineIndex2Model.h"
@interface MineIndex2TableViewCell()
@property (nonatomic,strong) UIView* lineView;

@property (nonatomic,strong) UIImageView* leftIV;
@property (nonatomic,strong) UIImageView* rightIV;

@property (nonatomic,strong) UILabel* titleLable;
@end
@implementation MineIndex2TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.leftIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    [self.contentView addSubview:self.leftIV];
    
    [self.leftIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(10);
        make.width.mas_offset(16);
        make.height.mas_offset(16);
    }];
    
    self.titleLable = [XRQController createLabelWithFrame:self.contentView.frame Font:16 Text:nil];
    [self.contentView addSubview:self.titleLable];
    
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftIV.mas_right).mas_offset(10);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_offset(100);
    }];
    
    self.rightIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.rightIV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.rightIV];
    
    [self.rightIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-14);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.width.mas_offset(16);
        make.height.mas_offset(16);
    }];
    
    self.lineView = [XRQController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [XRQController colorWithHexString:LINECOLOR];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(self.leftIV.mas_bottom).mas_offset(16);
        make.height.mas_offset(1);
    }];
    
    
    self.hyb_lastViewInCell = self.lineView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(MineIndex2Model *)model {
    self.leftIV.image = [UIImage imageNamed:model._imagename];
    
    self.titleLable.text = model._title;
}

@end

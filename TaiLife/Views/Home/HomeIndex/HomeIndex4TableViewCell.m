//
//  HomeIndex4TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex4TableViewCell.h"

#import "HomeIndex4Model.h"
@interface HomeIndex4TableViewCell()
@property (nonatomic,strong) UIImageView* adIV;

@end
@implementation HomeIndex4TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.adIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:nil];
    self.adIV.layer.cornerRadius = 6;
    self.adIV.layer.masksToBounds = YES;
    [self.adIV setContentMode:UIViewContentModeScaleAspectFill];
    self.adIV.clipsToBounds = YES;
    [self.contentView addSubview:self.adIV];
    
    [self.adIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_offset(([XRQController getScreenWidth])*126/640);
    }];
    
    self.hyb_lastViewInCell = self.adIV;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(HomeIndex4Model *)model {
    [self.adIV sd_setImageWithURL:[NSURL URLWithString:model._img] placeholderImage:[UIImage imageNamed:@""]];
    
}

@end

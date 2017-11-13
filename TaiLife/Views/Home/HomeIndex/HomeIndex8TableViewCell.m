//
//  HomeIndex8TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex8TableViewCell.h"

#import "HomeIndex8Model.h"
@interface HomeIndex8TableViewCell()
@property (nonatomic,strong) UIImageView* adIV;

@end
@implementation HomeIndex8TableViewCell

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
    [self.contentView addSubview:self.adIV];
    
    [self.adIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_offset([XRQController getScreenWidth]/4);
    }];
    
    self.hyb_lastViewInCell = self.adIV;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(HomeIndex8Model *)model {
    [self.adIV sd_setImageWithURL:[NSURL URLWithString:model._img] placeholderImage:[UIImage imageNamed:@""]];
    
}

@end

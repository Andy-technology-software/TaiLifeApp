//
//  BussinessmenIndex4TableViewCell.m
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "BussinessmenIndex4TableViewCell.h"

#import "BussinessmenIndex4Model.h"
@interface BussinessmenIndex4TableViewCell()
@property (nonatomic,strong) UIView* topLineView0;
@property (nonatomic,strong) UIView* topLineView1;

@property (nonatomic,strong) UIView* bgView;

@property (nonatomic,strong) UILabel* title0;
@property (nonatomic,strong) UILabel* title1;
@property (nonatomic,strong) UILabel* title2;

@property (nonatomic,strong) UIImageView* moreIV;
@property (nonatomic,strong) UIButton* moreBtn;

@end
@implementation BussinessmenIndex4TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.title0 = [XRQController createLabelWithFrame:self.contentView.frame Font:14 Text:@"商品管理"];
    self.title0.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.title0];
    
    [self.title0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(22);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.width.mas_offset(61);
    }];
    
    self.topLineView0 = [XRQController viewWithFrame:self.contentView.frame];
    self.topLineView0.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.topLineView0];
    
    [self.topLineView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.title0.mas_centerY);
        make.right.mas_equalTo(self.title0.mas_left);
        make.width.mas_offset(29);
        make.height.mas_offset(1);
    }];
    
    self.topLineView1 = [XRQController viewWithFrame:self.contentView.frame];
    self.topLineView1.backgroundColor = [UIColor blackColor];
    [self.contentView addSubview:self.topLineView1];
    
    [self.topLineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.title0.mas_centerY);
        make.left.mas_equalTo(self.title0.mas_right);
        make.width.mas_offset(29);
        make.height.mas_offset(1);
    }];
    
    self.title1 = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:@"舒适生活从现在开始"];
    self.title1.textAlignment = NSTextAlignmentCenter;
    self.title1.textColor = [XRQController colorWithHexString:@"969696"];
    [self.contentView addSubview:self.title1];
    
    [self.title1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.title0.mas_bottom).mas_offset(6);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    
}

- (void)configCellWithModel:(BussinessmenIndex4Model *)model {
    float viewWidth = ([XRQController getScreenWidth] - 40) / 3;
    
    self.bgView = [XRQController viewWithFrame:self.contentView.frame];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.title1.mas_bottom).mas_offset(12);
        make.height.mas_offset((viewWidth * 25 / 19 + 10)*ceil((float)model._imgArr.count/3));
    }];
    
    self.moreIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:@""];
    self.moreIV.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.moreIV];
    
    [self.moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.bgView.mas_bottom).mas_offset(9);
        make.height.mas_offset(12);
        make.width.mas_offset(12);
    }];
    
    self.title2 = [XRQController createLabelWithFrame:self.contentView.frame Font:12 Text:@"了解更多商品"];
    self.title2.textAlignment = NSTextAlignmentCenter;
    self.title2.textColor = [XRQController colorWithHexString:@"969696"];
    [self.contentView addSubview:self.title2];
    
    [self.title2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moreIV.mas_bottom).mas_offset(4);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
    }];
    
    self.moreBtn = [XRQController createButtonWithFrame:self.contentView.frame ImageName:nil Target:self Action:@selector(moreBtnClick) Title:nil];
    [self.contentView addSubview:self.moreBtn];
    
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.moreIV);
        make.left.mas_equalTo(self.title2.mas_left);
        make.right.mas_equalTo(self.title2.mas_right);
        make.bottom.mas_equalTo(self.title2.mas_bottom);
    }];
    
    self.hyb_lastViewInCell = self.title2;
    self.hyb_bottomOffsetToCell = 5;
    
    for (int i = 0; i < model._imgArr.count; i++) {
        UIView* _BV = [XRQController viewWithFrame:CGRectMake((viewWidth + 10) * (i % 3) + 10, i / 3 * (viewWidth * 25 / 19 + 10), viewWidth, (viewWidth * 25 / 19 + 10))];
        _BV.layer.cornerRadius = 6;
        _BV.layer.masksToBounds = YES;
        [_BV setContentMode:UIViewContentModeScaleAspectFill];
        _BV.clipsToBounds = YES;
        _BV.layer.borderWidth = 0.2;
        _BV.layer.borderColor = [[UIColor grayColor] CGColor];
        [self.bgView addSubview:_BV];
        
        UIImageView* _imageV = [XRQController createImageViewWithFrame:CGRectMake(0, 0, viewWidth, viewWidth * 176 / 189) ImageName:nil];
        [_imageV sd_setImageWithURL:[NSURL URLWithString:model._imgArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        [_BV addSubview:_imageV];
        
        UILabel* titleL = [XRQController createLabelWithFrame:CGRectMake(2, CGRectGetMaxY(_imageV.frame) + 3, _imageV.frame.size.width - 4, 15) Font:10 Text:model._titleArr[i]];
        titleL.numberOfLines = 1;
        titleL.lineBreakMode = NSLineBreakByTruncatingTail;
        [_BV addSubview:titleL];
        
        UILabel* priceL = [XRQController createLabelWithFrame:CGRectMake(titleL.frame.origin.x, CGRectGetMaxY(titleL.frame) + 3, _imageV.frame.size.width / 2 - 5, 12) Font:12 Text:[NSString stringWithFormat:@"￥%@",model._priceArr[i]]];
        priceL.numberOfLines = 1;
        priceL.textColor = [XRQController colorWithHexString:@"d02e14"];
        priceL.lineBreakMode = NSLineBreakByTruncatingTail;
        [_BV addSubview:priceL];
        
        UILabel* countL = [XRQController createLabelWithFrame:CGRectMake(CGRectGetMaxX(priceL.frame), priceL.frame.origin.y, _imageV.frame.size.width / 2, 12) Font:10 Text:[NSString stringWithFormat:@"已售:%@",model._countArr[i]]];
        countL.numberOfLines = 1;
        countL.textColor = [XRQController colorWithHexString:@"a8a8a8"];
        countL.textAlignment = NSTextAlignmentRight;
        countL.lineBreakMode = NSLineBreakByTruncatingTail;
        [_BV addSubview:countL];
        
        UIButton* clickB = [XRQController createButtonWithFrame:CGRectMake(_imageV.frame.origin.x, 0, _imageV.frame.size.width , (viewWidth * 25 / 19 + 10)) ImageName:nil Target:self Action:@selector(clickBClick:) Title:nil];
        clickB.tag = 100 + i;
        [self.bgView addSubview:clickB];
    }
}


#pragma mark - 分类点击代理
- (void)clickBClick:(UIButton*)btn{
    [self.BussinessmenIndex4TableViewCellDelegate sendBack4Item:btn.tag - 100];
    
}

- (void)moreBtnClick {
    [self.BussinessmenIndex4TableViewCellDelegate s4MoreClick];
    
}

@end

//
//  MineIndex1TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "MineIndex1TableViewCell.h"

#import "MineIndex1Model.h"
@interface MineIndex1TableViewCell()
@property (nonatomic,strong) UIView* bgView;
@property (nonatomic,strong) UIView* lineView;

@property (nonatomic,strong) UIView* subView;
@property (nonatomic,strong) UIView* bottmView;
@end
@implementation MineIndex1TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.bgView = [XRQController viewWithFrame:self.contentView.frame];
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(10);
        make.height.mas_offset([XRQController getScreenWidth] * 156 / 640);
    }];
    
    self.lineView = [XRQController viewWithFrame:self.contentView.frame];
    self.lineView.backgroundColor = [XRQController colorWithHexString:LINECOLOR];
    [self.contentView addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.bgView.mas_bottom).mas_offset(10);
        make.height.mas_offset(0.5);
    }];
    
    self.subView = [XRQController viewWithFrame:self.contentView.frame];
    [self.contentView addSubview:self.subView];
    
    [self.subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.lineView.mas_bottom);
        make.height.mas_offset(58);
    }];
    
    self.bottmView = [XRQController viewWithFrame:self.contentView.frame];
    self.bottmView.backgroundColor = [XRQController colorWithHexString:BGVIEWCOLOR];
    [self.contentView addSubview:self.bottmView];
    
    [self.bottmView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(self.subView.mas_bottom);
        make.height.mas_offset(10);
    }];
    
    
    self.hyb_lastViewInCell = self.bottmView;
    self.hyb_bottomOffsetToCell = 0;
}

- (void)configCellWithModel:(MineIndex1Model *)model {
    float viewWidth = ([XRQController getScreenWidth] - 20 - 26)/3;
    float viewHeigth = viewWidth*156/183;
    
    for (int i = 0; i < model._imgArr.count; i++) {
        UIView* topView = [XRQController viewWithFrame:CGRectMake((viewWidth + 13) * i, 0, viewWidth, viewHeigth)];
        topView.backgroundColor = [UIColor redColor];
        [self.bgView addSubview:topView];
        
        UILabel* titL = [XRQController createLabelWithFrame:topView.frame Font:13 Text:model._titArr[i]];
        [topView addSubview:titL];
        
        [titL mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(6);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(15);
        }];
        
        UILabel* desL = [XRQController createLabelWithFrame:topView.frame Font:10 Text:model._desArr[i]];
        desL.numberOfLines = 3;
        desL.lineBreakMode = NSLineBreakByTruncatingTail;
        [topView addSubview:desL];
        
        [desL mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(titL);
            make.right.mas_equalTo(-15);
            make.top.mas_equalTo(titL.mas_bottom).mas_offset(8);
        }];
        
        UIImageView* rIV = [XRQController createImageViewWithFrame:topView.frame ImageName:@""];
        rIV.backgroundColor = [UIColor blackColor];
        [topView addSubview:rIV];
        
        [rIV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-6);
            make.top.mas_equalTo(titL);
            make.width.mas_offset(12);
            make.height.mas_offset(12);
        }];
        
        UIButton* ietmBtn = [XRQController createButtonWithFrame:topView.frame ImageName:nil Target:self Action:@selector(ietmBtnClick:) Title:nil];
        ietmBtn.tag = 100 + i;
        [topView addSubview:ietmBtn];
        
        [ietmBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
    }
    
    float viewWidth1 = ([XRQController getScreenWidth]) / 4;
    float viewHeigth1 = 58;
    for (int i = 0; i < model._numrr.count; i++) {
        UIView* topView = [XRQController viewWithFrame:CGRectMake(viewWidth1 * i, 0, viewWidth1, viewHeigth1)];
        [self.subView addSubview:topView];
        
        UILabel* numL = [XRQController createLabelWithFrame:topView.frame Font:14 Text:model._numrr[i]];
        numL.textAlignment = NSTextAlignmentCenter;
        [topView addSubview:numL];
        
        [numL mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(topView.mas_centerX);
            make.top.mas_equalTo(10);
        }];
        
        UILabel* subL = [XRQController createLabelWithFrame:topView.frame Font:14 Text:model._subtArr[i]];
        subL.textColor = [XRQController colorWithHexString:@"b2b2b2"];
        subL.textAlignment = NSTextAlignmentCenter;
        [topView addSubview:subL];
        
        [subL mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(topView.mas_centerX);
            make.top.mas_equalTo(numL.mas_bottom).mas_offset(3);
        }];
        
        if (i > 0) {
            UIView* lView = [XRQController viewWithFrame:CGRectMake(viewWidth1*i, 10, 0.5, 38)];
            lView.backgroundColor = [XRQController colorWithHexString:BGVIEWCOLOR];
            [self.subView addSubview:lView];
        }
        
        UIButton* ietmBtn = [XRQController createButtonWithFrame:topView.frame ImageName:nil Target:self Action:@selector(ietmBtnClick1:) Title:nil];
        ietmBtn.tag = 200 + i;
        [topView addSubview:ietmBtn];
        
        [ietmBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
}

- (void)ietmBtnClick:(UIButton*)btn {
    [self.MineIndex1TableViewCellDelegate sendBack1ItemIndex:btn.tag - 100];
}

-  (void)ietmBtnClick1:(UIButton*)btn {
    [self.MineIndex1TableViewCellDelegate sendBack1ItemIndex1:btn.tag - 200];
}

@end

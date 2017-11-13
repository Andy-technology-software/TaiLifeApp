//
//  HomeIndex1TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex1TableViewCell.h"

#import "HomeIndex1Model.h"
@interface HomeIndex1TableViewCell()<UIScrollViewDelegate>
@property (nonatomic,strong) UIView* bgView;

@property(nonatomic,strong)UIScrollView * scrollView;
@property(nonatomic,strong)UIPageControl * _pageControl;
@end
@implementation HomeIndex1TableViewCell

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
    self.bgView.layer.cornerRadius = 6;
    self.bgView.layer.masksToBounds = YES;
    [self.bgView setContentMode:UIViewContentModeScaleAspectFill];
    self.bgView.clipsToBounds = YES;
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(10);
        make.height.mas_offset(100);
    }];
    
    self.hyb_lastViewInCell = self.bgView;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(HomeIndex1Model *)model {
    float bgH = 60;
    float bgW = [XRQController getScreenWidth] - 20;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, bgW, bgH)];
    self.scrollView.contentSize = CGSizeMake(bgW * ceil(((float)model._titleArr.count / 5)), bgH);
    self.scrollView.contentOffset = CGPointMake(0, 0);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollView.directionalLockEnabled = YES;
    self.scrollView.bounces = YES;
    self.scrollView.alwaysBounceHorizontal = YES;
    self.scrollView.alwaysBounceVertical = NO;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    self.scrollView.decelerationRate = 0.5;
    [self.bgView addSubview: self.scrollView];
    
    self._pageControl = [[UIPageControl alloc] init];
    self._pageControl.frame = self.bgView.frame;
    self._pageControl.numberOfPages = ceil((float)model._imgArr.count/5);
    self._pageControl.currentPage = 0;
    self._pageControl.pageIndicatorTintColor = [UIColor redColor];
    self._pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    [self.bgView addSubview:self._pageControl];
    
    [self._pageControl mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bgView.mas_centerX);
        make.top.mas_equalTo(self.scrollView.mas_bottom).mas_offset(6);
    }];
    
    float viewWidth = bgW/5;
    float viewHeight = bgH;
    
    for (int i = 0; i < model._imgArr.count; i++) {
        UIView* _BV = [XRQController viewWithFrame:CGRectMake(viewWidth*i, 0, viewWidth, viewHeight)];
        [self.scrollView addSubview:_BV];
        
        UIImageView* _imgV = [XRQController createImageViewWithFrame:_BV.frame ImageName:nil];
        [_imgV sd_setImageWithURL:[NSURL URLWithString:model._imgArr[i]] placeholderImage:[UIImage imageNamed:@""]];
        [_BV addSubview:_imgV];
        
        [_imgV mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_BV.mas_centerX);
            make.top.mas_equalTo(16);
            make.width.mas_offset(26);
            make.height.mas_offset(26);
        }];
        
        UILabel* _desL = [XRQController createLabelWithFrame:_BV.frame Font:10 Text:model._titleArr[i]];
        _desL.textAlignment = NSTextAlignmentCenter;
        [_BV addSubview:_desL];
        
        [_desL mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(_imgV.mas_centerX);
            make.top.mas_equalTo(_imgV.mas_bottom).mas_offset(7);
        }];
        
        UIButton* temBtn = [XRQController createButtonWithFrame:_BV.frame ImageName:nil Target:self Action:@selector(temBtnClick:) Title:nil];
        temBtn.tag = 100 + i;
        [_BV addSubview:temBtn];
        
        [temBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    self._pageControl.currentPage = page;
}


- (void)temBtnClick:(UIButton*)btn {
    [self.HomeIndex1TableViewCellDelegate sendBackS1Index:btn.tag - 100];
}

@end

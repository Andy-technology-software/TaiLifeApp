//
//  HomeIndex0TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/9.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex0TableViewCell.h"

#import "HomeIndex0Model.h"

#import "TXScrollLabelView.h"
@interface HomeIndex0TableViewCell()<CycleScrollViewDelegate,TXScrollLabelViewDelegate>

@property (nonatomic,strong) CycleScrollView* cycleScrollView;
@property (nonatomic,strong) UIImageView* noticeIV;
@property (nonatomic,strong) UIImageView* moreIV;

@end
@implementation HomeIndex0TableViewCell

- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style
                      reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeUI];
    }
    
    return self;
}

- (void)makeUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    //网络加载 --- 创建带标题的图片轮播器
    self.cycleScrollView = [CycleScrollView cycleScrollViewWithFrame:self.contentView.frame imageURLStringsGroup:nil];
    self.cycleScrollView.layer.cornerRadius = 6;
    self.cycleScrollView.layer.masksToBounds = YES;
    [self.cycleScrollView setContentMode:UIViewContentModeScaleAspectFill];
    self.cycleScrollView.clipsToBounds = YES;
    [self.contentView addSubview:self.cycleScrollView];
    
    [self.cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.top.mas_equalTo(0);
        make.height.mas_offset([XRQController getScreenWidth] * 29/60);
    }];
    
    self.noticeIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:@"首页"];
    [self.contentView addSubview:self.noticeIV];
    
    [self.noticeIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(self.cycleScrollView.mas_bottom).mas_offset(10);
        make.height.mas_offset(13);
        make.width.mas_offset(13);
    }];
    
    
    self.moreIV = [XRQController createImageViewWithFrame:self.contentView.frame ImageName:@"首页"];
    [self.contentView addSubview:self.moreIV];
    
    [self.moreIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(self.noticeIV.mas_centerY);
        make.height.mas_offset(13);
        make.width.mas_offset(13);
    }];
    
    
    self.hyb_lastViewInCell = self.moreIV;
    self.hyb_bottomOffsetToCell = 10;
}

- (void)configCellWithModel:(HomeIndex0Model *)model {
    if (model._imgArr.count) {
        self.cycleScrollView.pageControlAliment = CycleScrollViewPageContolAlimentCenter;
        self.cycleScrollView.pageControlStyle = CycleScrollViewPageContolStyleClassic;
        self.cycleScrollView.delegate = self;
        //        self.cycleScrollView.dotColor = [UIColor blackColor]; // 自定义分页控件小圆标颜色
        //        self.cycleScrollView.indicatorDotColor = [UIColor whiteColor];
        self.cycleScrollView.placeholderImage = [UIImage imageNamed:@""];
        self.cycleScrollView.autoScrollTimeInterval = 4.0;
        //        self.cycleScrollView.hidesForSinglePage = YES;
        self.cycleScrollView.imageURLStringsGroup = model._imgArr;
        if (1 == model._imgArr.count) {
            self.cycleScrollView.showPageControl = NO;
            self.cycleScrollView.autoScroll = NO;
        }
    }
    
    if (model._noticeArr.count) {
        TXScrollLabelView *scrollLabelView = nil;
        
        scrollLabelView = [TXScrollLabelView scrollWithTextArray:model._noticeArr type:TXScrollLabelViewTypeFlipNoRepeat velocity:3 options:UIViewAnimationOptionCurveEaseInOut inset:UIEdgeInsetsZero];
        scrollLabelView.frame = CGRectMake(30, 0, [XRQController getScreenWidth] - 60, 30);
        [self.contentView addSubview:scrollLabelView];
        /** Step3: 设置代理进行回调 */
        scrollLabelView.scrollLabelViewDelegate = self;
        
        /** Step4: 布局(Required) */
        [scrollLabelView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.moreIV.mas_centerY);
            make.left.mas_equalTo(self.noticeIV.mas_right).mas_offset(6);
            make.right.mas_equalTo(self.moreIV.mas_left).mas_offset(-6);
            make.height.mas_offset(30);
        }];
        
        scrollLabelView.font = [UIFont systemFontOfSize:12];
        scrollLabelView.textAlignment = NSTextAlignmentLeft;
        scrollLabelView.backgroundColor = [UIColor clearColor];
        
        /** Step5: 开始滚动(Start scrolling!) */
        [scrollLabelView beginScrolling];
    }
}

#pragma mark - 轮滚点击代理
- (void)cycleScrollView:(CycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"---点击了第%ld张图片", (long)index);
    [self.HomeIndex0TableViewCellDelegate didselectADPic:index];
}

- (void)scrollLabelView:(TXScrollLabelView *)scrollLabelView didClickWithText:(NSString *)text atIndex:(NSInteger)index {
    NSLog(@"%@--%ld",text, index);
}

@end

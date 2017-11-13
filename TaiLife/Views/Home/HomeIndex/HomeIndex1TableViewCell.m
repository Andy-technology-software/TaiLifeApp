//
//  HomeIndex1TableViewCell.m
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "HomeIndex1TableViewCell.h"

#import "HomeIndex1Model.h"
@interface HomeIndex1TableViewCell()
@property (nonatomic,strong) UIView* bgView;

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
    
}

- (void)configCellWithModel:(HomeIndex1Model *)model {
    
}

@end

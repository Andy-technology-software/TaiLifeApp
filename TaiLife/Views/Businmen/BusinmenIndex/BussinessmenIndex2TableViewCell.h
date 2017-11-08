//
//  BussinessmenIndex2TableViewCell.h
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BussinessmenIndex2Model;
@protocol BussinessmenIndex2TableViewCellDelegate <NSObject>
- (void)sendBack2Item:(NSInteger)index;
- (void)s2MoreClick;

@end

@interface BussinessmenIndex2TableViewCell : UITableViewCell
@property(nonatomic,weak)id<BussinessmenIndex2TableViewCellDelegate>BussinessmenIndex2TableViewCellDelegate;
- (void)configCellWithModel:(BussinessmenIndex2Model *)model;
@end

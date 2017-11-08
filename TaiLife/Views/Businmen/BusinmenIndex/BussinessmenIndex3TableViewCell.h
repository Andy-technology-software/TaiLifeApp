//
//  BussinessmenIndex3TableViewCell.h
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BussinessmenIndex3Model;
@protocol BussinessmenIndex3TableViewCellDelegate <NSObject>
- (void)sendBack3Item;
- (void)s3MoreClick;

@end

@interface BussinessmenIndex3TableViewCell : UITableViewCell
@property(nonatomic,weak)id<BussinessmenIndex3TableViewCellDelegate>BussinessmenIndex3TableViewCellDelegate;
- (void)configCellWithModel:(BussinessmenIndex3Model *)model;

@end

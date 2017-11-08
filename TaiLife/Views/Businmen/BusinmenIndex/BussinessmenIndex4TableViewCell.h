//
//  BussinessmenIndex4TableViewCell.h
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BussinessmenIndex4Model;
@protocol BussinessmenIndex4TableViewCellDelegate <NSObject>
- (void)sendBack4Item:(NSInteger)index;
- (void)s4MoreClick;

@end
@interface BussinessmenIndex4TableViewCell : UITableViewCell
@property(nonatomic,weak)id<BussinessmenIndex4TableViewCellDelegate>BussinessmenIndex4TableViewCellDelegate;
- (void)configCellWithModel:(BussinessmenIndex4Model *)model;

@end

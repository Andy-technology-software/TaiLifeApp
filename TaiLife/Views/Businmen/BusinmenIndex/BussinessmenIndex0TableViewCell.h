//
//  BussinessmenIndex0TableViewCell.h
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BussinessmenIndex0Model;
@protocol BussinessmenIndex0TableViewCellDelegate <NSObject>
- (void)didselectADPic:(NSInteger)index;
- (void)sendBackItem:(NSInteger)index;
@end
@interface BussinessmenIndex0TableViewCell : UITableViewCell
@property(nonatomic,weak)id<BussinessmenIndex0TableViewCellDelegate>BussinessmenIndex0TableViewCellDelegate;
- (void)configCellWithModel:(BussinessmenIndex0Model *)model;
@end

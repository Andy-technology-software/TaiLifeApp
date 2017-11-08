//
//  BussinessmenIndex1TableViewCell.h
//  TaiLife
//
//  Created by lingnet on 2017/11/7.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BussinessmenIndex1TableViewCellDelegate <NSObject>
- (void)sendBackYS;
- (void)sendBackSH;
- (void)sendBackJH;
@end
@interface BussinessmenIndex1TableViewCell : UITableViewCell

@property(nonatomic,weak)id<BussinessmenIndex1TableViewCellDelegate>BussinessmenIndex1TableViewCellDelegate;
- (void)configCellWithModel;
@end

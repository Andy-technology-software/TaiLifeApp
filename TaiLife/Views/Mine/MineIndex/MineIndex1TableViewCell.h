//
//  MineIndex1TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineIndex1Model;
@protocol MineIndex1TableViewCellDelegate <NSObject>
- (void)sendBack1ItemIndex:(NSInteger)item;
- (void)sendBack1ItemIndex1:(NSInteger)item;

@end
@interface MineIndex1TableViewCell : UITableViewCell
@property(nonatomic,weak)id<MineIndex1TableViewCellDelegate>MineIndex1TableViewCellDelegate;
- (void)configCellWithModel:(MineIndex1Model *)model;
@end

//
//  MineIndexTableViewCell.h
//  TaiLife
//
//  Created by lingnet on 2017/11/6.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MineIndexModel;
@protocol MineIndexTableViewCellDelegate <NSObject>
- (void)sendBack0HeadImage;
- (void)sendBack0OpenDoor;
@end
@interface MineIndexTableViewCell : UITableViewCell
@property(nonatomic,weak)id<MineIndexTableViewCellDelegate>MineIndexTableViewCellDelegate;
- (void)configCellWithModel:(MineIndexModel *)model;
@end

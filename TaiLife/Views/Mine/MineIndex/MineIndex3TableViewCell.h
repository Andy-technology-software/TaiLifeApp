//
//  MineIndex3TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MineIndex3TableViewCellDelegate <NSObject>
- (void)sendBack3LogOut;
@end
@interface MineIndex3TableViewCell : UITableViewCell
- (void)configCellWithModel;
@property(nonatomic,weak)id<MineIndex3TableViewCellDelegate>MineIndex3TableViewCellDelegate;

@end

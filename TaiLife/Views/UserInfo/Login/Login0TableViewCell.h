//
//  Login0TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginModel;
@protocol Login0TableViewCellDelegate <NSObject>
- (void)sendBackLogin0Bool:(BOOL)isPass;
- (void)sendBackBackNav;
@end
@interface Login0TableViewCell : UITableViewCell
@property(nonatomic,weak)id<Login0TableViewCellDelegate>Login0TableViewCellDelegate;
- (void)configCellWithModel:(LoginModel *)model;
@end

//
//  Login2TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginModel;
@protocol Login2TableViewCellDelegate <NSObject>
- (void)sendBackIsSure;
- (void)sendBackForPass;
- (void)sendBackRegNow;
- (void)sendBackLogin;
- (void)sendBackReadText;
@end
@interface Login2TableViewCell : UITableViewCell
@property(nonatomic,weak)id<Login2TableViewCellDelegate>Login2TableViewCellDelegate;
- (void)configCellWithModel:(LoginModel *)model;
@end

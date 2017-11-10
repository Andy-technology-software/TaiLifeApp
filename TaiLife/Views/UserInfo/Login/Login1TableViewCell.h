//
//  Login1TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginModel;
@protocol Login1TableViewCellDelegate <NSObject>
- (void)sendBackUsername:(NSString*)username;
- (void)sendBackPassword:(NSString*)password;
@end
@interface Login1TableViewCell : UITableViewCell
@property(nonatomic,weak)id<Login1TableViewCellDelegate>Login1TableViewCellDelegate;
- (void)configCellWithModel:(LoginModel *)model;
@end

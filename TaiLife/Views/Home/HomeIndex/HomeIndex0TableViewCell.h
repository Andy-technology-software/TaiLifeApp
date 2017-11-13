//
//  HomeIndex0TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/9.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex0Model;
@protocol HomeIndex0TableViewCellDelegate <NSObject>
- (void)didselectADPic:(NSInteger)index;
@end
@interface HomeIndex0TableViewCell : UITableViewCell
@property(nonatomic,weak)id<HomeIndex0TableViewCellDelegate>HomeIndex0TableViewCellDelegate;
- (void)configCellWithModel:(HomeIndex0Model *)model;
@end

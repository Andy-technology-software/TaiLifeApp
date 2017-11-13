//
//  HomeIndex3TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex3Model;
@protocol HomeIndex3TableViewCellDelegate <NSObject>
- (void)sendBack3Item:(NSInteger)index;

@end
@interface HomeIndex3TableViewCell : UITableViewCell
@property(nonatomic,weak)id<HomeIndex3TableViewCellDelegate>HomeIndex3TableViewCellDelegate;
- (void)configCellWithModel:(HomeIndex3Model *)model;

@end

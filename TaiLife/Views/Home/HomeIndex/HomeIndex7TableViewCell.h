//
//  HomeIndex7TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex7Model;
@protocol HomeIndex7TableViewCellDelegate <NSObject>
- (void)sendBack7Item:(NSInteger)index;

@end
@interface HomeIndex7TableViewCell : UITableViewCell
@property(nonatomic,weak)id<HomeIndex7TableViewCellDelegate>HomeIndex7TableViewCellDelegate;
- (void)configCellWithModel:(HomeIndex7Model *)model;

@end

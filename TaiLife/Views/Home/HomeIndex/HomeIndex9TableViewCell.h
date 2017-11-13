//
//  HomeIndex9TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex9Model;
@protocol HomeIndex9TableViewCellDelegate <NSObject>
- (void)sendBack9Item:(NSInteger)index;
- (void)s9MoreClick;

@end
@interface HomeIndex9TableViewCell : UITableViewCell
@property(nonatomic,weak)id<HomeIndex9TableViewCellDelegate>HomeIndex9TableViewCellDelegate;
- (void)configCellWithModel:(HomeIndex9Model *)model;

@end

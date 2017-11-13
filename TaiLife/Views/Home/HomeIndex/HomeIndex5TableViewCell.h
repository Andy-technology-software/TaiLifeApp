//
//  HomeIndex5TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex5Model;
@protocol HomeIndex5TableViewCellDelegate <NSObject>
- (void)sendBack5Item:(NSInteger)index;
- (void)s5MoreClick;

@end
@interface HomeIndex5TableViewCell : UITableViewCell
@property(nonatomic,weak)id<HomeIndex5TableViewCellDelegate>HomeIndex5TableViewCellDelegate;
- (void)configCellWithModel:(HomeIndex5Model *)model;
@end

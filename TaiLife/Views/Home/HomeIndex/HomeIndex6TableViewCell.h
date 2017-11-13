//
//  HomeIndex6TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex6Model;
@protocol HomeIndex6TableViewCellDelegate <NSObject>
- (void)sendBack6Item:(NSInteger)index;
- (void)s6MoreClick;

@end
@interface HomeIndex6TableViewCell : UITableViewCell
@property(nonatomic,weak)id<HomeIndex6TableViewCellDelegate>HomeIndex6TableViewCellDelegate;
- (void)configCellWithModel:(HomeIndex6Model *)model;
@end

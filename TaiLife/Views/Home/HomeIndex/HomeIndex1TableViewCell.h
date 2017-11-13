//
//  HomeIndex1TableViewCell.h
//  TaiLife
//
//  Created by andyXu on 2017/11/13.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HomeIndex1Model;
@protocol HomeIndex1TableViewCellDelegate <NSObject>
- (void)sendBackS1Index:(NSInteger)index;
@end
@interface HomeIndex1TableViewCell : UITableViewCell
- (void)configCellWithModel:(HomeIndex1Model *)model;
@property(nonatomic,weak)id<HomeIndex1TableViewCellDelegate>HomeIndex1TableViewCellDelegate;

@end

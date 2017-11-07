//
//  XRQAddController.h
//  TaiLife
//
//  Created by lingnet on 2017/11/6.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface XRQAddController : NSObject
+ (UIImage *) scaleImage: (UIImage *)image scaleFactor:(float)scaleFloat;
+ (CGFloat)folderSize;
+ (void)removeCache;
+ (CGFloat)tabBarHeight;
+(float)isIOS7;
@end

//
//  AppDelegate.h
//  TaiLife
//
//  Created by lingnet on 2017/11/1.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *appKey = @"0db86f5a2bc67723e253683b";
static NSString *channel = @"APP Store";
static BOOL isProduction = NO;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;
- (void)setRootVC;
- (void)setLoginRoot;

@end


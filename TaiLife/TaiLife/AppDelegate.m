//
//  AppDelegate.m
//  TaiLife
//
//  Created by lingnet on 2017/11/1.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "AppDelegate.h"

#import "HomeIndexViewController.h"

#import "ServiceIndexViewController.h"

#import "CommunityIndexViewController.h"

#import "BusinessmenIndexViewController.h"

#import "MineIndexViewController.h"

#import "LoginViewController.h"
@interface AppDelegate (){
    RDVTabBarController *tabBarController;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    /**************************************************************注册微信支付*********************************************************************************************/
    
    [WXApi registerApp:MXWechatAPPID withDescription:@"微信支付"];
    
    /**************************************************************极光推送*********************************************************************************************/

    [[XRQJPush shareJPushManager] setupWithOption:launchOptions appKey:appKey channel:channel apsForProduction:isProduction advertisingIdentifier:nil];
    [[XRQJPush shareJPushManager] getRegisterIDCallBack:^(NSString *registerID) {
        NSLog(@"----%@",registerID);
    }];
    [XRQJPush setAlias:@"111111" AndSeqNum:0];
    [[XRQJPush shareJPushManager] setBadge:0];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [self setupViewControllers];
    [self.window setRootViewController:self.viewController];
    return YES;
}

- (void)setupViewControllers{
    
    HomeIndexViewController *homeIndexViewController = [[HomeIndexViewController alloc] init];
    UINavigationController *homeNavigationController = [[UINavigationController alloc]
                                                         initWithRootViewController:homeIndexViewController];
    
    ServiceIndexViewController *serviceIndexViewController = [[ServiceIndexViewController alloc] init];
    UINavigationController *serviceNavigationController = [[UINavigationController alloc]
                                                                          initWithRootViewController:serviceIndexViewController];
    
    CommunityIndexViewController *communityIndexViewController = [[CommunityIndexViewController alloc] init];
    UINavigationController *communityNavigationController = [[UINavigationController alloc]
                                                                     initWithRootViewController:communityIndexViewController];
    
    BusinessmenIndexViewController *businessmenIndexViewController = [[BusinessmenIndexViewController alloc] init];
    UINavigationController *bussinessNavigationController = [[UINavigationController alloc]
                                                                   initWithRootViewController:businessmenIndexViewController];
    
    MineIndexViewController *mineIndexViewController = [[MineIndexViewController alloc] init];
    UINavigationController *mineNavigationController = [[UINavigationController alloc]
                                                             initWithRootViewController:mineIndexViewController];
    
    tabBarController = [[RDVTabBarController alloc] init];
    [tabBarController.tabBar setHeight:[XRQAddController tabBarHeight]];
    [tabBarController setViewControllers:@[homeNavigationController, serviceNavigationController, communityNavigationController, bussinessNavigationController, mineNavigationController]];
    self.viewController = tabBarController;
    
    [self customizeTabBarForController:tabBarController];
}

- (void)customizeTabBarForController:(RDVTabBarController *)tabBarControllers {
    UIImage *backgroundImage = [UIImage imageNamed:@"矩形-23"];
    UIImage *finishedImage = [UIImage imageNamed:@"tabbar_selected_background"];
    UIImage *unfinishedImage = [UIImage imageNamed:@"tabbar_normal_background"];
    NSArray *tabBarItemImages = @[@"首页",@"首页",@"首页",@"首页",@"首页"];
    NSArray *titleArr = @[@"首页",@"服务",@"社区",@"商家",@"我的"];
    NSInteger index = 0;
    for (RDVTabBarItem *item in [[tabBarControllers tabBar] items]) {
        [item setBackgroundSelectedImage:finishedImage withUnselectedImage:unfinishedImage];
        UIImage *selectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@b",
                                                      [tabBarItemImages objectAtIndex:index]]];
        UIImage *unselectedimage = [UIImage imageNamed:[NSString stringWithFormat:@"%@",
                                                        [tabBarItemImages objectAtIndex:index]]];
        [item setFinishedSelectedImage:selectedimage withFinishedUnselectedImage:unselectedimage];
        item.title = titleArr[index];
        index++;
        [item setBackgroundSelectedImage:backgroundImage withUnselectedImage:backgroundImage];
        
        item.selectedTitleAttributes=@{NSForegroundColorAttributeName:[XRQController colorWithHexString:@"5f6fee"]};
        item.unselectedTitleAttributes=@{NSForegroundColorAttributeName:[XRQController colorWithHexString:@"848a96"]};
        item.titlePositionAdjustment=UIOffsetMake(0, 5);
        [item setBackgroundColor:[XRQController colorWithHexString:@"FFFFFF"]];
        
    }
}

- (void)setRootVC{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        
        self.window.rootViewController = nil;
        self.viewController = nil;
        [self setupViewControllers];
        [self.window setRootViewController:self.viewController];
        [self.window makeKeyAndVisible];
        
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - 退出登录或者没有登录改变root
-(void)setLoginRoot{
    [UIView transitionWithView:[UIApplication sharedApplication].keyWindow duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[LoginViewController alloc] init]];
        [UIView setAnimationsEnabled:oldState];
    } completion:^(BOOL finished) {
        
    }];
}



- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    // Required - 注册 DeviceToken
    [[XRQJPush shareJPushManager] registerDeviceToken:deviceToken];
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    // Required, iOS 7 Support
    [[XRQJPush shareJPushManager] handleRemoteNotification:userInfo];
    
    completionHandler(UIBackgroundFetchResultNewData);
}


- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // Required,For systems with less than or equal to iOS6
    [[XRQJPush shareJPushManager] handleRemoteNotification:userInfo];
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


/*********************************************************************支付回调****************************************************************************************************/

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    //如果极简 SDK 不可用,会跳转支付宝钱包进行支付,需要将支付宝钱包的支付结果回传给 SDK if ([url.host isEqualToString:@"safepay"]) {
    [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
        NSLog(@"result = %@",resultDic);
    }];
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回 authCode
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    
    //银联
    [[UPPaymentControl defaultControl] handlePaymentResult:url completeBlock:^(NSString *code, NSDictionary *data) {
        
        //结果code为成功时，先校验签名，校验成功后做后续处理
        if([code isEqualToString:@"success"]) {
            
            //数据从NSDictionary转换为NSString
            NSDictionary *data;
            NSData *signData = [NSJSONSerialization dataWithJSONObject:data
                                                               options:0
                                                                 error:nil];
            NSString *sign = [[NSString alloc] initWithData:signData encoding:NSUTF8StringEncoding];
            
            //判断签名数据是否存在
            if(data == nil){
                //如果没有签名数据，建议商户app后台查询交易结果
                return;
            }
            
            //验签证书同后台验签证书
            //此处的verify，商户需送去商户后台做验签
            if([self verify:sign]) {
                //支付成功且验签成功，展示支付成功提示
                NSLog(@"银联支付成功");
            }
            else {
                //验签失败，交易结果数据被篡改，商户app后台查询交易结果
            }
        }
        else if([code isEqualToString:@"fail"]) {
            //交易失败
        }
        else if([code isEqualToString:@"cancel"]) {
            //交易取消
        }
    }];
    
    //微信支付
    return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
    
}

- (BOOL)verify:(NSString*)verify{
    return YES;
}

#pragma mark - 微信支付回调

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    return [WXApi handleOpenURL:url delegate:[WXApiManager sharedManager]];
}

@end

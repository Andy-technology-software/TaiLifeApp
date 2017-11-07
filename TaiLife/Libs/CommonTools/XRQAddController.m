//
//  XRQAddController.m
//  TaiLife
//
//  Created by lingnet on 2017/11/6.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import "XRQAddController.h"
#import  <dlfcn.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#include <net/if_dl.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#import  <CommonCrypto/CommonCryptor.h>
#import  <SystemConfiguration/SystemConfiguration.h>
#import <objc/runtime.h>
#define IS_iPhoneX ([UIScreen mainScreen].bounds.size.width == 375.0 && [UIScreen mainScreen].bounds.size.height == 812.0)
#define IOS7   [[UIDevice currentDevice]systemVersion].floatValue>=7.0
@implementation XRQAddController
+ (UIImage *) scaleImage: (UIImage *)image scaleFactor:(float)scaleFloat {
    CGSize size = CGSizeMake(image.size.width * scaleFloat, image.size.height * scaleFloat);
    
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    transform = CGAffineTransformScale(transform, scaleFloat, scaleFloat);
    CGContextConcatCTM(context, transform);
    
    [image drawAtPoint:CGPointMake(0.0f, 0.0f)];
    UIImage *newimg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newimg;
}

+ (CGFloat)folderSize{
    CGFloat folderSize;
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for(NSString *path in files){
        NSString*filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    CGFloat sizeM = folderSize /1024.0/1024.0;
    return sizeM;
}

+ (void)removeCache{
    NSString*cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)objectAtIndex:0];
    NSArray*files = [[NSFileManager defaultManager]subpathsAtPath:cachePath];
    for(NSString *p in files){
        NSError*error; NSString*path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        if([[NSFileManager defaultManager]fileExistsAtPath:path]) {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                [HUD success:@"清除成功"];
            }else{
                NSLog(@"清除失败");
                [HUD success:@"清除失败，请重新尝试！"];
            }
        }
    }
}

+ (CGFloat)tabBarHeight {
    if (IS_iPhoneX) {
        return 83.0f;
    }
    return 49.0f;
}

#pragma -mark 判断导航的高度
+(float)isIOS7{
    
    float height;
    if (IOS7) {
        height=64.0;
    }else if (IS_iPhoneX){
        return 88.0;
    }else{
        height=44.0;
    }
    
    return height;
}

@end

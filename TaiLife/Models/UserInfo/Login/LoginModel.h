//
//  LoginModel.h
//  TaiLife
//
//  Created by andyXu on 2017/11/10.
//  Copyright © 2017年 AndyXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginModel : NSObject
@property(nonatomic,assign)BOOL _isPass;

@property(nonatomic,copy)NSString* _username;
@property(nonatomic,copy)NSString* _password;

@property(nonatomic,assign)BOOL _isSure;
@end

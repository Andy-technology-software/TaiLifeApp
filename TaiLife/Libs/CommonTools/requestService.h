//
//  requestService.h
//  WhereAreYou
//
//  Created by lingnet on 2017/7/5.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XRQRequestClient.h"
@interface requestService : NSObject

/**
 01.登陆
 
 @param tel 账号
 @param password 密码
 @param deviceType 设备类型(1、ios2、安卓3、web)
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postLoginWithTel:(NSString*)tel password:(NSString*)password deviceType:(NSString*)deviceType complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 02.修改密码
 
 @param _id 用户id
 @param password 旧密码
 @param newPassword 新密码
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postModifyPasswordWithId:(NSString*)_id password:(NSString*)password newPassword:(NSString*)newPassword complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 03.反馈
 
 @param _id 用户id
 @param content 内容
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFeedbackWithId:(NSString*)_id content:(NSString*)content complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 04.获取个人信息
 
 @param _id 用户id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postGetPersonInfoWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 05.完善个人资料
 
 @param name 姓名
 @param sex 性别
 @param _id 用户id
 @param idNo  身份证号
 @param provinceId  省id
 @param cityId  市id
 @param areaId   区id
 @param add  详细地址
 @param idMarriage 婚姻状况 0未婚1已婚
 @param birthday 出生日期 'yyyy-MM-dd'
 @param cid 默认机构ID
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postEditPersonInfoWithName:(NSString*)name sex:(NSString*)sex id:(NSString*)_id idNo :(NSString*)idNo provinceId:(NSString*)provinceId cityId:(NSString*)cityId areaId:(NSString*)areaId add:(NSString*)add idMarriage:(NSString*)idMarriage birthday:(NSString*)birthday cid:(NSString*)cid complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 06.注册--下一步
 
 @param deviceType 设备类型(1、ios2、安卓3、web)
 @param tel 手机号
 @param password 密码
 @param authCode 验证码
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postRegistWithDeviceType:(NSString*)deviceType tel:(NSString*)tel password:(NSString*)password authCode:(NSString*)authCode complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 07.忘记密码
 
 @param tel 手机号
 @param password 密码
 @param authCode 验证码
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postForgetPasswordWithTel:(NSString*)tel password:(NSString*)password authCode:(NSString*)authCode complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 08.获取验证码
 
 @param tel 手机号
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postSendAuthcodeWithTel:(NSString*)tel complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 09.换头像
 
 @param _id 用户id
 @param picture 头像
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postChangeAvatarWithId:(NSString*)_id picture:(NSString*)picture complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




///**
// 10.获取资讯列表
// 
// @param complate 请求完成
// @param failure 请求失败
// */
//+(void)postgetInformationList complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 11.获取广告图片
 
 @param type 位置 1首页，2体检页
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postGetAdsWithType:(NSString*)type complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;



/**
 12.更换手机号
 
 @param authCode 验证码
 @param _id 用户ID
 @param tel 新手机号
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postChangeTelWithAuthCode:(NSString*)authCode id:(NSString*)_id tel:(NSString*)tel complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 13.获取区域列表
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postgetAreaListWithPid:(NSString*)pid complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;




/**
 032.体检机构-列表/所有体检机构-下拉列表
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postGetBranchListWithArea :(NSString*)area  complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 订单详情
 
 @param orderId 订单id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postgetOrderDetailsWithOrderId:(NSString*)orderId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 条码-二维码
 
 @param orderId 用户套餐ID
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postgetGetCodesWithOrderId:(NSString*)orderId id:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;






/**
 自我检测首页获取类型
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postGetSelfHomelList:(NSString*)aa complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;






/**
 自我检测 获取web页面
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postgetBaseGuideMeal:(NSString*)type fzxId:(NSString*)fzxId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
睡眠
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFindSleepQuestions:(NSString*)type complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;






/**
 心里
 
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postFindPressQuestions:(NSString*)type complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;






/**
 分配客服
 
 @param uId 用户id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postAllotService:(NSString*)uId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;






/**
 结束会话
 
 @param uId 用户id
 @param sId 服务者id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postEndService:(NSString*)uId sId:(NSString*)sId complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;






/**
 获取体检号
 
 @param _id 当前用户id
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postGetInspectListWithId:(NSString*)_id complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;





/**
 体检报告
 
 @param patientCode 体检号
 @param complate 请求完成
 @param failure 请求失败
 */
+(void)postgetReportUrlWithPatientCode:(NSString*)patientCode complate:(HttpSuccessBlock)complate failure:(HttpFailureBlock)failure;









@end

//
//  requestURL.h
//  WhereAreYou
//
//  Created by lingnet on 2017/7/5.
//  Copyright © 2017年 徐仁强. All rights reserved.
//

#ifndef requestURL_h
#define requestURL_h
//#define HEADER @"http://192.168.1.113:8080/"

//#define JING @"http://192.168.1.113:8080/app/"

// 01.登陆
#define mylogin HEADER"common!login.action"


//02.修改密码
#define modifyPassword HEADER"common!modifyPassword.action"


//03.反馈
#define feedback HEADER"common!feedback.action"


//04.获取个人信息
#define getPersonInfo HEADER"common!getPersonInfo.action"


//05.完善个人资料
#define editPersonInfo HEADER"common!editPersonInfo.action"


//06.注册--下一步
#define myregist HEADER"common!regist.action"


//07.忘记密码
#define forgetPassword HEADER"common!forgetPassword.action"


//08.获取验证码
#define sendAuthcode HEADER"common!sendAuthcode.action"


//09.换头像
#define changeAvatar HEADER"common!changeAvatar.action"


//10.获取资讯列表
#define getInformationList HEADER"common!getInformationList.action"


//11.获取广告图片
#define getAds HEADER"common!getAds.action"


//12.更换手机号
#define changeTel HEADER"common!changeTel.action"


//13.获取区域列表
#define mygetAreaList HEADER"common!getAreaList.action"


//032.体检机构-列表/所有体检机构-下拉列表
#define getBranchList HEADER"medical!getBranchList.action"


//订单详情
#define getOrderDetails HEADER"mine!getOrderDetails.action"


//订单详情
#define getCodes HEADER"mine!getCodes.action"


//自我检测   首页类型
#define getSelfHomelList HEADER"medical!getSelfHomelList.action"


//自我检测   获取web页面
#define getBaseGuideMeal HEADER"medical!getBaseGuideMeal.action"


//睡眠选项
#define findSleepQuestions HEADER"medical!findSleepQuestions.action"


//心里选项
#define findPressQuestions HEADER"medical!findPressQuestions.action"


//分配客服
#define allotService HEADER"common!allotService.action"


//结束会话
#define endService HEADER"common!endService"


//获取体检号
#define getInspectList HEADER"mine!getInspectList.action"


//体检报告
#define getReportUrl HEADER"mine!getReportUrl.action"

#endif /* requestURL_h */

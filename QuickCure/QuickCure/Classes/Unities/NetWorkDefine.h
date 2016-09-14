//
//  NetWorkDefine.h
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#ifndef NetWorkDefine_h
#define NetWorkDefine_h

/** 基Url */
#define CZ_BaseUrl @"http://iosapi.itcast.cn"

/** 登录接口 */
#define kLoginUrl @"http://iosapi.itcast.cn/carelinkQuickLogin.json.php"

/** 首页轮播器接口 */
#define kBannersUrl @"http://iosapi.itcast.cn/banners.json.php"

/** 肿瘤疾病选择疾病细分列表接口 */
#define kSearchCI3Url @"http://iosapi.itcast.cn/searchCI3List.json.php"

/** 根据疾病得到医生数量接口 */
#define kMatchedDoctorCountUrl @"http://iosapi.itcast.cn/matchedDoctorCount.json.php"

/** 选择并发症列表接口 */
#define kComplicationListUrl @"http://iosapi.itcast.cn/complicationList.json.php"

/** 获取医生列表接口 */
#define kMatchDoctors @"http://iosapi.itcast.cn/matchDoctors.json.php"

/** 获取医生基本信息接口 */
#define kGetDoctorInfoUrl @"http://iosapi.itcast.cn/getDoctorInfo.json.php"

/** 匹配到医生后，查看医生接诊条件 */
#define kDoctorReceivingSetting @"http://iosapi.itcast.cn/doctorReceivingSetting.json.php"

/** 医生简介接口 */
#define kGetIntroductionUrl @"http://iosapi.itcast.cn/getIntroduction.json.php"

/** 获取医生就诊时间接口 */
#define kDoctorDuties @"http://iosapi.itcast.cn/doctorDuties.json.php"

/** 百度天气 */
#define kBDWeather_KEY @"17IvzuqmKrK1cGwNL6VQebF9"
#define kGetWeather_URL(city) ([NSString stringWithFormat: @"http://api.map.baidu.com/telematics/v3/weather?location=%@&output=json&ak=%@", city, kBDWeather_KEY])

/** 关注医生接口 */
#define kAddDoctorUrl @"http://iosapi.itcast.cn/addDoctor.json.php"

/** 取消关注医生接口 */
#define kDeleteDoctorUrl @"http://iosapi.itcast.cn/deleteDoctor.json.php"

/** 获取关注医生列表接口 */
#define kDoctorListUrl  @"http://iosapi.itcast.cn/doctorList.json.php"

#endif /* NetWorkDefine_h */

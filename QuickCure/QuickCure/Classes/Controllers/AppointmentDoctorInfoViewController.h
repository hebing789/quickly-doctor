//
//  AppointmentDoctorInfoViewController.h
//  QuickCure
//
//  Created by ymQiao on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DoctorApplyModel;

@interface AppointmentDoctorInfoViewController : UIViewController

/**
 *  数据模型
 */
@property(nonatomic,strong) DoctorApplyModel *appDotInfoModel;

@end

//
//  CaseUpCell.h
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CaseUpModel.h"
@interface CaseUpCell : UITableViewCell

@property(nonatomic,strong)CaseUpModel *model;
@property(nonatomic,strong)UILabel *titleLB;
@property(nonatomic,strong)UILabel *labelLB;
@property(nonatomic,strong)UIImageView *imgv;
@end

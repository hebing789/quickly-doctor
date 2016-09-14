//
//  DoctorApplyModel.m
//  QuickCure
//
//  Created by ymQiao on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "DoctorApplyModel.h"

@implementation DoctorApplyModel

- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self)
        [self setValuesForKeysWithDictionary:dict];
    return  self;
}

+ (instancetype)doctorApplyWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)doctorApplyModel
{
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"doctorApply.plist" ofType:nil]];
    NSMutableArray *nmArr = [NSMutableArray array];
    for (NSDictionary *dict in arr)
    {
        [nmArr addObject:[self doctorApplyWithDict:dict]];
    }
    
    return nmArr;
}

@end

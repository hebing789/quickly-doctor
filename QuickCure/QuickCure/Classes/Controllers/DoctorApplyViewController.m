//
//  DoctorApplyViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "DoctorApplyViewController.h"
#import "AppointmentDoctorInfoViewController.h"
#import "DoctorApplyCell.h"
#import "DoctorApplyModel.h"

@interface DoctorApplyViewController ()<UITableViewDataSource,UITableViewDelegate>
/**
 *  tableView
 */
@property(nonatomic,strong) UITableView *doctorApplyTableView;
/**
 *  数据模型数组
 */
@property(nonatomic,strong) NSArray *applyModelArr;

@end

@implementation DoctorApplyViewController
/**
 *  数据模型懒加载
 */
- (NSArray *)applyModelArr
{
    if (!_applyModelArr) {
        _applyModelArr = [DoctorApplyModel doctorApplyModel];
    }
    return _applyModelArr;
}

/**
 *  tableView懒加载
 */
- (UITableView *)doctorApplyTableView
{
    if (!_doctorApplyTableView) {
        _doctorApplyTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        
        //注册cell
        [self.doctorApplyTableView registerClass:[DoctorApplyCell class] forCellReuseIdentifier:@"applyCell"];
        
        //设置数据源和代理
        _doctorApplyTableView.dataSource = self;
        _doctorApplyTableView.delegate = self;
        
        //设置行高和footerView
        _doctorApplyTableView.rowHeight = 100;
        _doctorApplyTableView.tableFooterView = [[UIView alloc] init];
    }
    return _doctorApplyTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubviews];
}

- (void)layoutSubviews
{
    [self.view addSubview:self.doctorApplyTableView];
}

#pragma mark - UITableViewDataSource
/**
 *  返回tableview行数
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.applyModelArr.count;
}
/**
 * 返回cell
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorApplyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"applyCell" forIndexPath:indexPath];
    
    cell.model = self.applyModelArr[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
/**
 * 点击“申请名医通”cell，跳转“预约医生详细信息”界面
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppointmentDoctorInfoViewController *appointmentDoctorInfoViewController = [[AppointmentDoctorInfoViewController alloc] init];
    
    //对控制器模型数据进行赋值
    appointmentDoctorInfoViewController.appDotInfoModel = self.applyModelArr[indexPath.row];
    
    //push控制器
    [self.navigationController pushViewController:appointmentDoctorInfoViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end

//
//  FocusDoctorViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "FocusDoctorViewController.h"
#import "NetWorkDefine.h"
#import "NSArray+Log.h"
#import "NetWorkTool.h"
#import "HMModel.h"
#import "HMTableViewCell.h"
#import "DoctorController.h"
@interface FocusDoctorViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSArray<HMModel *> *modelArray;

@end

@implementation FocusDoctorViewController

- (void)setModelArray:(NSArray<HMModel *> *)modelArray
{
    _modelArray = modelArray;
    
    [self.tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    
    self.tableView = tableView;
    
    [self.view addSubview:tableView];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerClass:[HMTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [HMModel modelWithSuccess:^(NSArray<HMModel *> *mArray) {
        self.modelArray = mArray;
//        NSLog(@"%@",self.modelArray);
    } error:^{
        
    }];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.modelArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HMTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.model = self.modelArray[indexPath.section];
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DoctorController *vc = [[DoctorController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}


@end

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
#import "DoctorViewController.h"
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
    DoctorViewController *vc = [[DoctorViewController alloc]init];
    
    HMModel *model = self.modelArray[indexPath.section];
    
    vc.imageIcon.image = [UIImage imageNamed:@"illness_img_person.png"];
    
    vc.nameLable.text = model.doctor_name;
    
    vc.nameLable.font = [UIFont systemFontOfSize:18];
    
    vc.titleLable.text = model.doctor_title_name;
    
    vc.titleLable.textColor = [UIColor grayColor];
    
    vc.titleLable.font = [UIFont systemFontOfSize:16];
    
    vc.companyLable.text = model.hospital_name;
    
    vc.companyLable.font = [UIFont systemFontOfSize:16];
    
    vc.companyLable.textColor = [UIColor grayColor];
    
    [vc.plusBtn setImage:[UIImage imageNamed:@"yuyueliang"] forState:UIControlStateNormal];
    
    [vc.plusBtn setTitle:[NSString stringWithFormat:@"%d",19] forState:UIControlStateNormal];
    
    [vc.plusBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateNormal];
    
    vc.plusBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [vc.flowerBtn setImage:[UIImage imageNamed:@"xianhua"] forState:UIControlStateNormal];
    
    [vc.flowerBtn setTitle:[NSString stringWithFormat:@"%d",20] forState:UIControlStateNormal];
    
    [vc.flowerBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateNormal];
    
    vc.flowerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [vc.saveBtn setImage:[UIImage imageNamed:@"jinqi"] forState:UIControlStateNormal];
    
    [vc.saveBtn setTitle:[NSString stringWithFormat:@"%d",44] forState:UIControlStateNormal];
    
    [vc.saveBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateNormal];
    
    vc.saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}




@end

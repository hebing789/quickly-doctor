//
//  CaseCreateViewController.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseCreateViewController.h"
#import "CaseUpCell.h"
#import "CaseUpModel.h"
#import "CaseSecCell.h"
#import "CaseThrCell.h"
#import "CaseTypeController.h"
#import "CaseDitailController.h"
@interface CaseCreateViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)NSArray *upList;

@end

@implementation CaseCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[CaseUpCell class] forCellReuseIdentifier:@"cellUp"];
    UITableView *tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:tbView];
    tbView.delegate = self;
    tbView.dataSource=self;
    
    [tbView registerClass:[CaseUpCell class] forCellReuseIdentifier:@"cellUp"];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
}

- (NSArray *)upList
{
    if (!_upList) {
        _upList = [CaseUpModel upList];
    }
    return _upList;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        CaseUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellUp" forIndexPath:indexPath];
        cell.model = self.upList[indexPath.row];
        return cell;
    }else
    {
        if (indexPath.row == 0) {
            CaseSecCell *cell = [[CaseSecCell alloc] init];
            return cell;
        }else
        {
            CaseThrCell *cell = [[CaseThrCell alloc] init];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 50;
    }else
    {
        return 160;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

//cell的跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 & indexPath.row == 0) {
        [self.navigationController pushViewController:[[CaseTypeController alloc] init] animated:YES];
        
    }
}








@end

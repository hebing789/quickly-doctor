//
//  SettingViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "SettingViewController.h"
#import "feedbackViewController.h"
#import "MBProgressHUD+WP.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

//加载数据
@property(nonatomic,strong)NSArray *dataArray;

//懒加载
@property(nonatomic,strong)UITableView *tableView;

@end

@implementation SettingViewController

-(UITableView *)tableView
{
    if(_tableView == nil)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(self.view.bounds.origin.x
                                                                  , self.view.bounds.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
        //        _tableView.backgroundView = [UIColor whiteColor];
        //        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.dataArray = @[@"意见反馈",@"加符号说明",@"修改密码",@"注销用户"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;//参数少 定死了
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    }
    if(indexPath.section == 0)
    {
        cell.textLabel.text = self.dataArray[indexPath.row];
    }
    return cell;
}
////设置选中Cell的响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%zd",indexPath.row);
    //组
    NSInteger section = indexPath.section;
    //行
    NSInteger row = indexPath.row;
    
    UIView *VC = nil;
    
    if(section == 0)
    {
        switch (row) {
            case 0:
                VC = [[feedbackViewController alloc]init];
                break;
            default:
                break;
        }
        [self jumpToOtherViewController:VC];
    }
    if(indexPath.row == 3)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"您确定要注销吗" preferredStyle:UIAlertControllerStyleActionSheet];
        [self presentViewController:alertController animated:YES completion:nil];
        UIAlertAction *top = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            [MBProgressHUD showSuccessMessage:@"注销成功" afterDelay:1];
            
        }];
        [alertController addAction:top];
        UIAlertAction *right = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertController addAction:right];
    }
}


@end

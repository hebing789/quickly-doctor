//
//  AboutProductViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "AboutProductViewController.h"

@interface AboutProductViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UIView *view1;

@property(nonatomic,strong)UITableView *tableView;

@end

@implementation AboutProductViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 = [[UIView alloc]init];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
//    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(70, 10, 400, 10));
//        
//    }];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(70, 10, 380, 10));
    }];
    self.view1 = view1;
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"product_img_logo_nor.png"];
    [view1 addSubview:imageView];
    /**
     *  第一个参数:上
     *  第二个参数:左
     *  第三个参数:下
     *  第四个参数:右
     */
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view1).mas_offset(UIEdgeInsetsMake(20, 140, 110, 140));
    }];
    UIImageView *zximageView = [[UIImageView alloc]init];
    zximageView.image = [UIImage imageNamed:@"product_text_logo_nor.png"];
    [view1 addSubview:zximageView];
    [zximageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view1).mas_offset(UIEdgeInsetsMake(110, 140, 60, 140));
        
    }];
    
    UITableView *tableVIew = [[UITableView alloc]init];
    tableVIew.backgroundColor = [UIColor whiteColor];
    self.tableView = tableVIew;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:tableVIew];
    [tableVIew mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(288, 0, 0, 0));
        
        
    }];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
 
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if(indexPath.section == 0)
    {
    cell.textLabel.text = @"用户协议";
    cell.imageView.image = [UIImage imageNamed:@"product_img_icon_xieyi.png"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
     return cell;
}





@end

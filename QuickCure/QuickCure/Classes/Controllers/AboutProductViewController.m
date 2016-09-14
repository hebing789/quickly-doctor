//
//  AboutProductViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "AboutProductViewController.h"
#import "MBProgressHUD+WP.h"

@interface AboutProductViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong)UIView *view1;

@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIView *zxView;

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
        
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(288, 0, 330, 0));
        
        
    }];
    //禁止cell滑动
    self.tableView.bounces = NO;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    UIView *zxView = [[UIView alloc]init];
    zxView.backgroundColor = [UIColor whiteColor];
    self.zxView = zxView;
    [self.view addSubview:zxView];
    [zxView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(500, 0, 0, 0));
    }];
    /**
     *  第一个参数:上
     *  第二个参数:左
     *  第三个参数:下
     *  第四个参数:右
     */
    UILabel *zxxlabel = [[UILabel alloc]init];
    //设置文字
    zxxlabel.text = @"用户交流群:4638375643";
    //设置字体颜色
    zxxlabel.textColor = [UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0];;
    //居中
    zxxlabel.textAlignment = NSTextAlignmentCenter;
    [zxView addSubview:zxxlabel];
    [zxxlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.zxView).mas_offset(UIEdgeInsetsMake(40, 0, 90, 0));
    }];
    UILabel *zxxxlabel = [[UILabel alloc]init];
    zxxxlabel.text = @"version: 1.4.0";
    zxxxlabel.textColor= [UIColor colorWithRed:0.0 green:0.502 blue:1.0 alpha:1.0];
    zxxxlabel.textAlignment = NSTextAlignmentCenter;
    [zxView addSubview:zxxxlabel];
    [zxxxlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.zxView).mas_offset(UIEdgeInsetsMake(60, 0, 40, 0));
    }];
    
    
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
        //显示无色点击cell
        //         cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    
    return cell;
}
-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    
    
    //我让第一个cell 点击的时候没有反应
    
    if (indexPath.row ==0) {
        
        [MBProgressHUD showSuccessMessage:@"打开用户协议" afterDelay:1];
        
        
        
    }
    
    return indexPath;
    
}

#warning 选中颜色 让选中的消失
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //点击后cell的选中颜色消失
    [self performSelector:@selector(delet:) withObject:nil afterDelay:0.5];
}


//cell的选中颜色消失
- (void)delet:(id)sender{
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


@end

//
//  feedbackViewController.m
//  QuickCure
//
//  Created by 左旭 on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "feedbackViewController.h"
#import <Masonry.h>
#import "MBProgressHUD+WP.h"

@interface feedbackViewController ()<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

// 顶部 mas框架
@property (nonatomic, strong, readonly) MASConstraint *top;

@property (nonatomic,strong,readonly)MASConstraint *bottom;

@property(nonatomic,strong,readonly)MASConstraint *left;

@property(nonatomic,strong,readonly)MASConstraint *right;

@property(nonatomic,strong)UITextView *textView;


@property(nonatomic,strong)UITableView *zxTableView;

//定义一个数组文字
@property(nonatomic,strong)NSArray *dataArray;

//定义一个数字图片
@property(nonatomic,strong)NSArray *imageArray;

//定义一个label属性 让外界调用
@property(nonatomic,strong)UILabel *zxlaebl;



@end

@implementation feedbackViewController
//懒加载
-(UITableView *)zxTableView
{
    if(_zxTableView == nil)
    {
        
        _zxTableView= [[UITableView alloc]init];
        
    }
    return _zxTableView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UITextView *textView = [[UITextView alloc]init];
    textView.backgroundColor = [UIColor colorWithRed:0.99 green:0.9806 blue:0.9697 alpha:1.0];
    [self.view addSubview:textView];
    textView.text = @"请输入反馈内容";
    textView.textColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    
    
    self.textView = textView;
    //设置代理
    textView.delegate = self;
    
    //automaticallyAdjustsScrollViewInsets 让提示文字置顶
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
    //在用第三方框架masonry的时候 必须关掉
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.mas_topLayoutGuide).offset(10);
        make.left.equalTo(@10);
        make.right.equalTo(@-10);
        //        make.bottom.equalTo(@100);
        
    }];
    
    /**
     [label mas_makeConstraints:^(MASConstraintMaker *make) {
     make.height.equalTo(@100);
     make.width.equalTo(label2);
     make.right.equalTo(label2.mas_left).offset(-100);
     make.leading.equalTo(self.view.mas_leading).offset(20);
     make.centerY.equalTo(self.view);
     }];
     [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.height.equalTo(@100);
     make.centerY.equalTo(label);
     make.trailing.equalTo(self.view.mas_trailing).offset(-20);
     }];
     */
    
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"您还可以输入的字数为:";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        /**
         *  第一个参数:上
         *  第二个参数:左
         *  第三个参数:下
         *  第四个参数:右
         */
        //        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(10, 20,100, 60));
        make.top.mas_equalTo(textView.mas_bottom).offset(10);
        //        make.bottom.mas_equalTo(@100);
        make.left.mas_equalTo(@60);
        make.right.mas_equalTo(@10);
        
    }];
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:@"dijiaofankui"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textView.mas_bottom).offset(5);
        make.right.mas_equalTo(-20);
    }];
    //添加点击事件
    [button addTarget:self action:@selector(keyboard) forControlEvents:UIControlEventTouchUpInside];
    UILabel *v_label =[[UILabel alloc]init];
    v_label.backgroundColor = [UIColor colorWithRed:0.99 green:0.9806 blue:0.9697 alpha:1.0];
    v_label.text = @"    欢迎联系我们";
    [self.view addSubview:v_label];
    [v_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(10);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(-310);
    }];
    
    self.zxTableView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_zxTableView];
    [_zxTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(v_label.mas_bottom).offset(0);
        make.right.mas_equalTo(0);
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    }];
    //创建字数提醒
#pragma mark ---小提示  先赋值 在使用属性 不然不然
    UILabel *zxlabel = [[UILabel alloc]init];
    _zxlaebl = zxlabel;
    self.zxlaebl.text = @"200";
    [self.view addSubview:zxlabel];
    [zxlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //显示上
        //        make.top.mas_equalTo(textView.mas_bottom).offset(5);
        //        make.left.mas_equalTo(label.mas_right).offset(0);
        //        make.right.mas_equalTo(button.mas_left).offset(-40);
        make.top.mas_equalTo(textView.mas_bottom).offset(10);
        //        make.bottom.mas_equalTo(@100);
        make.left.mas_equalTo(@240);
        make.right.mas_equalTo(@10);
        
        
        
        
    }];
    //数组加载数组
    self.dataArray =@[@"客服电话:400-636-6113",@"用户交流群:464768569"];
    //数组加载图片
    self.imageArray = @[[UIImage imageNamed:@"dianhua"],[UIImage imageNamed:@"qq"]];
    
    self.zxTableView.delegate = self;
    self.zxTableView.dataSource = self;
    
    [self.zxTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //
    //
    //
    //    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardEnd:) name:UITextViewTextDidEndEditingNotification object:self.textView];
    
    
    
}
//点击事件 button
-(void)keyboard
{
    if(self.textView.text.length == 0)
    {
        //        MBProgressHUD *hud = [[MBProgressHUD alloc]init];
        //        hud.dimBackground = NO;
        //        [self.view addSubview:hud];
        //        [MBProgressHUD showSuccessMessage:@"请输入文字" afterDelay:1];
        [MBProgressHUD showErrorMessage:@"请输入反馈文字" afterDelay:1];
    }
    if(self.textView.text.length >=1 && self.textView.text.length <15)
    {
        [MBProgressHUD showSuccessMessage:@"亲,字数不足哦,需要满足15字哦" afterDelay:1];
        //返回上一页面
        //        [self.navigationController popViewControllerAnimated:YES];
    }
    if (self.textView.text.length >=15)
    {
        [MBProgressHUD showSuccessMessage:@"谢谢您的反馈" afterDelay:1];
        //返回上一页面
        [self.navigationController popViewControllerAnimated:YES];
    }
    [self.view endEditing:YES];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    if(indexPath.section == 0)
    {
        cell.textLabel.text = self.dataArray[indexPath.row];
        cell.imageView.image = self.imageArray[indexPath.row];
    }
    if(indexPath.row == 0)
    {
        
    }
    return cell;
}
//开始的时候
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    textView.text = @"";
    //输入的时候字体黑色
    textView.textColor =[UIColor blackColor];
    return YES;
}
//限制字数
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    //判断加上输入的字符，是否超过界限
    NSLog(@"%zd",textView.text.length);
    NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
    //字数显示
    [self.zxlaebl setText:[NSString stringWithFormat:@"%zd",self.zxlaebl.text.intValue - 1]];
    
    if (str.length >200)
    {
        
        textView.text = [textView.text substringToIndex:200];
        return NO;
    }
    
    
    return YES;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"选中了第%li个cell", (long)indexPath.row);
    if(indexPath.row == 0)
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否拨打电话:400-636-6113" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:nil];
        UIAlertAction *left = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            //            NSLog(@"111");
        }];
        [alertController addAction:left];
        UIAlertAction *right = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"telprompt://%@",@"400-636-6113"];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
            
        }];
        [alertController addAction:right];
        
    }
}
@end

//
//  LoginViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "LoginViewController.h"
#import "MBProgressHUD+WP.h"
#import "HomeViewController.h"
#import "AppDelegate.h"
#import "LeftViewController.h"

#import "JASidePanelController.h"
#define KsceeenWidth [UIScreen mainScreen].bounds.size.width
#define KscreenHight [UIScreen mainScreen].bounds.size.height
@interface LoginViewController ()
@property(nonatomic,copy)NSString *textstr1;
@property(nonatomic,copy)NSString *textstr2;

@property(nonatomic,weak)UITextField* text1;

@property(nonatomic,weak)UITextField* text2;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpLoginUI];
    
}

/**
 *  设置登录界面
 */


-(void)setUpLoginUI{
    
    //设置nationvationcontroller的长度
    self.navigationItem.title = @"登录";
    //设置两个图片
    UIImageView *imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"product_img_logo_nor.png"]];
    imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    UIImageView *imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"product_text_logo_nor.png"]];
    //imageView1.translatesAutoresizingMaskIntoConstraints = NO;
    //设置imageView1 imageView2的约束
    [self.view addSubview:imageView1];
    [self.view addSubview:imageView2];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(imageView1.superview.mas_top).offset(100);
        make.left.mas_equalTo(self.view.mas_left).offset(KsceeenWidth * 2/5);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(60);
        
    }];
    
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(imageView1.mas_bottom).offset(0);
        make.left.mas_equalTo(self.view.mas_left).offset( [UIScreen mainScreen].bounds.size.width * 2/5 );
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    //设置两个textfile
    UITextField *textfile1 = [[UITextField alloc]init];
    textfile1.borderStyle = UITextBorderStyleRoundedRect;
    [textfile1 addTarget:self action:@selector(checkValue:) forControlEvents:UIControlEventEditingChanged];
    
    _text1=textfile1;
    //_textstr1 = textfile1.text;
    UITextField *textfile2 = [[UITextField alloc]init];
    textfile2 .borderStyle = UITextBorderStyleRoundedRect;
    //_textstr2 = textfile2.text;
    //读取testFiled里面的值
    _text2=textfile2;
    [textfile2 addTarget: self action:@selector(valueChange:) forControlEvents:UIControlEventEditingChanged];
    
    [self.view addSubview:textfile1];
    [self.view addSubview:textfile2];
    
    // 给两个textfile设置约束
    [textfile1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo (imageView2.mas_bottom).offset(20);
        make.left.mas_equalTo (self.view.mas_left).offset(20);
        make.right.mas_equalTo (self.view.mas_right).offset(-20);
        
    }];
    
    [textfile2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(textfile1.mas_bottom).offset(20);
        make.left.mas_equalTo (self.view.mas_left).offset(20);
        make.right.mas_equalTo (self.view.mas_right).offset(-20);
    }];
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
//    改一下,方便输入//高洁
    if([defaults objectForKey:@"__textstr1"]&&[defaults objectForKey:@"__textstr2"]){
        //取数据
        textfile1.text = [defaults objectForKey:@"__textstr1"];
        textfile2.text = [defaults objectForKey:@"__textstr2"];
        
        
    }
    [textfile1 becomeFirstResponder];
    //给view添加button
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundImage:[UIImage imageNamed:@"link_button_01"] forState:UIControlStateNormal];
    [button setTitle:@"登录" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setImageEdgeInsets:UIEdgeInsetsMake(KscreenHight * 1/2, KsceeenWidth * 1/2 , KscreenHight * 1/2 , KsceeenWidth * 1/2)];
    [button addTarget:self action:@selector(clickLoginButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //设置button的约束
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textfile2.mas_bottom).offset(30);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
    }];
    
    
}
//逻辑判断,注意,存在就取值,高洁 //到底是写入里面有,读取,还是没有读取
//逻辑是没有就取值? 应该是存在就取系统的,不存在就取用户输入的吧?,为了方便用户,逻辑是先取出里面的值显示到界面上 1
//监控输入的值与密码是否相等,监控输入框数据变化,可以直接将输入框作为属性就可以了?//字典里面有数了,还要这个有用吗?
-(void)checkValue:(UITextField*)textfile1{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    if ((![defaults objectForKey:@"__textstr1"])) {
 
        _textstr1 = textfile1.text;
        
    }

}

-(void)valueChange:(UITextField*)textfile2{
    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
    if ((![defaults objectForKey:@"__textstr2"])) {
       
        _textstr2 = textfile2.text;
      
    }

}
////逻辑判断,注意,存在就取值,高洁 //到底是写入里面有,读取,还是没有读取
////逻辑是没有就取值? 应该是存在就取系统的,不存在就取用户输入的吧?
//-(void)checkValue:(UITextField*)textfile1{
//    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
//    if ((!(_textstr1=[defaults objectForKey:@"__textstr1"]))) {
//        
//        _textstr1 = textfile1.text;
//        
//    }
//    
//}
//
//-(void)valueChange:(UITextField*)textfile2{
//    NSUserDefaults *defaults = [[NSUserDefaults alloc]init];
//    if ((!(_textstr2=[defaults objectForKey:@"__textstr2"]))) {
//        
//        _textstr2 = textfile2.text;
//        
//    }
//    
//}

//按钮点击事件
-(void)clickLoginButton
{
    
    //判断是否成功 成功显示登录成功的遮罩 跳转到home界面
//    if ([_textstr1 isEqualToString:@"1"]&&[_textstr2 isEqualToString:@"1"]) {
    if ([_text1.text isEqualToString:@"1"]&&[_text2.text isEqualToString:@"1"]) {
        //登录成功 显示遮罩
        
        [MBProgressHUD showSuccessMessage:@"登录成功" afterDelay:2.0f];
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        //记录密码写入到用户的偏好设置里面
        //初始密码为1,1,//    刚开始用户为1,密码为1,后来按照注册的名称和密码登录
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:@"1" forKey:@"__textstr1"];
        [defaults setObject:@"1" forKey:@"__textstr2"];
        //立马写入
        [defaults synchronize];
        //发送通知 //这个通知是加载登录界面
        NSNotification *notice = [NSNotification notificationWithName:@"gao" object:nil];
        [[NSNotificationCenter defaultCenter]postNotification:notice];
        
        
        
    }else {
        //登录失败
        [MBProgressHUD showErrorMessage:@"登录失败" afterDelay:2.0f];
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

//
//  LoginViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "LoginViewController.h"
#define KsceeenWidth [UIScreen mainScreen].bounds.size.width
#define KscreenHight [UIScreen mainScreen].bounds.size.height
@interface LoginViewController ()

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
    UITextField *textfile2 = [[UITextField alloc]init];
    textfile2 .borderStyle = UITextBorderStyleRoundedRect;
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

//按钮点击事件
-(void)clickLoginButton
{
    
    
    
    
    
    
    
    
    
    
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

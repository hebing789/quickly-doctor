//
//  RegisterViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UIButton *Button;
@property(nonatomic,assign)BOOL number;
@property(nonatomic,assign) int num;
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpRegistUI];
    
}
//加载注册界面
-(void)setUpRegistUI{
    //设置头标题
    self.navigationItem.title = @"注册";
    //加载两个textfile
    UITextField *textfile1 = [[UITextField alloc]init];
    textfile1.borderStyle = UITextBorderStyleRoundedRect;
    textfile1.placeholder = @"请输入你的手机号码";
    UITextField *textfile2 = [[UITextField alloc]init];
    textfile2.borderStyle = UITextBorderStyleRoundedRect;
    textfile2.placeholder = @"请输入验证码";
    [self.view addSubview:textfile1];
    [self.view addSubview:textfile2];
    //添加buttton
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button addTarget:self action:@selector(clickButtonEvents) forControlEvents:UIControlEventTouchUpInside ];
    _Button = button;
    [self.view addSubview:button];
    //设置textfile  button约束
    [textfile1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo (self.view.mas_top).offset(100);
        make.left.mas_equalTo (self.view.mas_left).offset(20);
        make.right.mas_equalTo (self.view.mas_right).offset(-20);
        
        
    }];
    
    
    [textfile2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo (textfile1.mas_bottom).offset(30);
        //make.left.mas_equalTo (self.view.mas_left).offset(20);
        make.left.mas_equalTo (self.view.mas_left).offset(20);
        make.width.mas_equalTo (200);
        
    }];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo (textfile1.mas_bottom).offset(30);
        make.left.mas_equalTo (textfile2.mas_right).offset(20);
        make.right.mas_equalTo (self.view.mas_right).offset(-20);
        //make.width.mas_equalTo (60);
        
    }];
    //添加远可点击 用button
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateHighlighted];
    [button1 addTarget:self action:@selector(clickButton1) forControlEvents:UIControlEventTouchUpInside];
    _btn = button1;
    [self.view addSubview:button1];
    //添加约束
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo (textfile2.mas_bottom).offset(50);
        make.left.mas_equalTo(self.view.mas_left).offset(50);
        make.width.mas_equalTo(15);
    }];
    //添加lable
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"本人同意并阅读";
    lable.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:lable];
    //设置约束
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(textfile2.mas_bottom).offset(50);
        make.left.mas_equalTo(button1.mas_right).offset(20);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(button1.mas_bottom);
    }];
    //添加远可点击 用button
    UIButton *button2 = [[UIButton alloc]init];
    [button2 setTitle:@"用户协议" forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    //添加约束
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo (textfile2.mas_bottom).offset(50);
        make.right.mas_equalTo(self.view.mas_right).offset(-80);
        make.left.mas_equalTo(lable.mas_right).offset(5);
        make.bottom.mas_equalTo(lable.mas_bottom);
    }];
    //添加注册按钮
    UIButton *regbtn = [[UIButton alloc]init];
    [regbtn setBackgroundImage:[UIImage imageNamed:@"nav"] forState:UIControlStateNormal];
    [regbtn setTitle:@"注册" forState:UIControlStateNormal];
    [regbtn addTarget:self action:@selector(clickRegbtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regbtn];
    //设置约束
    [regbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo (lable.mas_bottom).offset(10);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.height.mas_equalTo(40);
        
    }];
    
    
    
    
    
    
}


-(void)clickButtonEvents
{
    
    
    int num = 10;
    _num =num;
    
    
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setUptime) userInfo:nil repeats:YES];
    
    _timer = time;
    
    
    
    
    if(_num < 0){
        //停止定时器
        
        [time invalidate];
        time = nil;
        return;
        
    }
    
    
    
    
    
}

-(void)setUptime{
    
    _Button.enabled = NO;
    
    NSString *str = @"10s";
    
    [_Button setTitle:str forState:UIControlStateNormal];
    [_Button setTitle:[NSString stringWithFormat:@"%ds",_num] forState:UIControlStateNormal];
    _num -= 1;
    if (_num < 0) {
        
        _Button.enabled = YES;
        [_Button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;
        return;
    }
    
}


-(void)clickButton1{
    
    if (_number == 0) {
        
        [_btn setImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateNormal];
        _number = 1;
    }else{
        
        
        [_btn setImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
        _number = 0 ;
        
    }
}

-(void)clickRegbtn{
    
    
    
    
    
    
    
    
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

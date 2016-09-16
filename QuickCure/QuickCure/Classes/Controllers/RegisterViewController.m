//
//  RegisterViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "RegisterViewController.h"
#import <MessageUI/MessageUI.h>
@interface RegisterViewController ()
//这个放在外面是传不了值的
@property(nonatomic,strong)UIButton *btn;

@property(nonatomic,assign)BOOL number;
@property(nonatomic,assign) int num;
@property(nonatomic,strong)NSTimer *timer;
@property(nonatomic,weak)UITextField *textfile1;
@property(nonatomic,weak)UITextField *textfile2;
@property(nonatomic,strong)UIButton *Button;

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
    self.textfile1=textfile1;
    textfile1.borderStyle = UITextBorderStyleRoundedRect;
    textfile1.placeholder = @"请输入你的11位手机号码";
    if (self.str1.length>0) {
        textfile1.placeholder = self.str1;
    }
    self.textfile1=textfile1;
    UITextField *textfile2 = [[UITextField alloc]init];
    textfile2.borderStyle = UITextBorderStyleRoundedRect;
    textfile2.placeholder = @"请输入验证码";
    [self.view addSubview:textfile1];
    self.textfile2=textfile2;
    
//    [textfile1 addTarget:self action:@selector(changeValue:) forControlEvents:UIControlEventEditingDidEnd];
    
//    textfile1.delegate=self;
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(textFieldDidBeginEditing:) name:UITextFieldTextDidChangeNotification object:textfile1];
    
    

    [self.view addSubview:textfile2];
    //添加buttton
    UIButton *button = [[UIButton alloc]init];
    [button setBackgroundColor:[UIColor grayColor]];
    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [button addTarget:self action:@selector(clickButtonEvents) forControlEvents:UIControlEventTouchUpInside ];
//    self.Button.enabled=YES;
    _Button = button;
//     self.Button.enabled=NO;
    [self.view addSubview:button];
    if (self.str2.length>0) {
        textfile2.placeholder=self.str2;
        _Button.hidden=YES;
    }
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

//-(void)textFieldDidBeginEditing4:(UITextField*)textFiled{
//    if (textFiled.text.length==11) {
//        
//        self.Button.enabled=YES;
//        
//    }
//    
//}

-(void)clickButtonEvents
{
    
    
    int num = 60;
    _num =num;
    
    NSLog(@"begin");
    
    NSTimer *time = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setUptime) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop]addTimer:time forMode:NSDefaultRunLoopMode];
    _Button.enabled = NO;

    _timer = time;
    
    [self openURL];
    
    if (_num < 0) {
        
        _Button.enabled = YES;
        [_Button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_timer invalidate];
        _timer = nil;

    }

    
    
    
}

-(void)setUptime{
    
    
    NSString *str = @"60s";
    
    [_Button setTitle:str forState:UIControlStateNormal];
//    [_Button setTitle:[NSString stringWithFormat:@"%ds",_num] forState:UIControlStateNormal];
    
    _Button.titleLabel.text=[NSString stringWithFormat:@"%ds",_num];
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
    
    
    RegisterViewController* regist=[[RegisterViewController alloc]init];
    
    
  
    if (self.str2.length>0) {
        [[NSUserDefaults standardUserDefaults]setObject:self.textfile1.text forKey:@"__textstr1"];
        [[NSUserDefaults standardUserDefaults]setObject:self.textfile2.text forKey:@"__textstr2"];
        //只有在这个键值第一次才一定要写入,后面可以不写入,自动写入
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        NSString* str1=  [[NSUserDefaults standardUserDefaults]objectForKey:@"__textstr1"];
        NSString* str2=[[NSUserDefaults standardUserDefaults]objectForKey:@"__textstr2"];
        [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
        
       
            [self.navigationController pushViewController:regist animated:YES];
                

    }
    
    regist.Button.hidden=YES;
    regist.str1=@"用户名";
    regist.str2=@"密码";

    
    
    
}
#pragma mark
#pragma mark - 打开URL
-(void)openURL  {
    
    UIApplication *application = [UIApplication sharedApplication];
    
    /**
     url : 统一资源定位符
     
     http : 协议头, 超文本传输协议
     
     http:// www.itcast.cn/kkk/kjlk/a.png
     
     
     tel://10086   打电话
     sms://10086   发消息
     mailto://10086 发邮件
     
     */
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",self.textfile1.text]];
    
    [application openURL:url];
}
#pragma mark - 代理方法
-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    [self dismissViewControllerAnimated:YES completion:nil];
    switch (result) {
        case MessageComposeResultSent:
            //信息传送成功
            
            break;
        case MessageComposeResultFailed:
            //信息传送失败
            
            break;
        case MessageComposeResultCancelled:
            //信息被用户取消传送
            
            break;
        default:
            break;
    }
}
//发送短信方法实现
#pragma mark - 发送短信方法
-(void)showMessageView:(NSArray *)phones title:(NSString *)title body:(NSString *)body
{
    if( [MFMessageComposeViewController canSendText] )
    {
        MFMessageComposeViewController * controller = [[MFMessageComposeViewController alloc] init];
        controller.recipients = phones;
        controller.navigationBar.tintColor = [UIColor redColor];
        controller.body = body;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
        [[[[controller viewControllers] lastObject] navigationItem] setTitle:title];//修改短信界面标题
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示信息"
                                                        message:@"该设备不支持短信功能"
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}
//最后，调用发送短信的方法
//复制代码 代码如下:
//
//[self showMessageView:[NSArray arrayWithObjects:@"15888888888",@"12399999999", nil] title:@"test" body:@"这是测试用短信，勿回复！"];

@end

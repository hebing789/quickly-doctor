//
//  ZXDoctor.m
//  QuickCure
//
//  Created by 左旭 on 16/9/16.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "ZXDoctor.h"
#import "SyndromeViewController.h"
@interface ZXDoctor ()


@property(nonatomic,strong)UIView *firstView;

@property(nonatomic,strong)UIView *secondView;

@property(nonatomic,strong)UIView *threeView;
@property(nonatomic,strong)UILabel *threeLabel;

@property(nonatomic,strong)UIView *fourView;
@property(nonatomic,strong)UILabel *fourLabel;

@property(nonatomic,strong)UILabel *symptomLabel;

//定义一个常量
@property(nonatomic,weak)UIButton *selectButton;

@property(nonatomic,strong)UIView *blewView;


@property(nonatomic,strong)UILabel *blewLabel;

//定义第二个
@property(nonatomic,strong)UIButton *select2Button;

@property(nonatomic,weak) UILabel *secondLabel;

@end

@implementation ZXDoctor

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载网站
    //    UIWebView *webView = [[UIWebView alloc] init];
    //    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.ckf.org.cn"]];
    //    [self.view addSubview: webView];
    //    [webView loadRequest:request];
    //    [webView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(0, 0, 0, 0));
    //    }];
    
    //原有的view的背景颜色
    [self.view setBackgroundColor:[UIColor colorWithRed:0.902 green:0.902 blue:0.9333 alpha:1.0]];
    
    //两条信息
    UILabel *zlabel = [[UILabel alloc]init];
    //    zlabel.backgroundColor = [UIColor redColor];
    zlabel.text = @"用户信息: 王二狗  1000099";
    [self.view addSubview:zlabel];
    [zlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(70, 10, 570, 100));
        make.top.equalTo(self.mas_topLayoutGuide).offset(20);
        make.left.equalTo(self.view.mas_left).offset(10);
        //            make.bottom.equalTo(@-540);
        //            make.right.equalTo(@100);
        
    }];
    UILabel *xlabel = [[UILabel alloc]init];
    //    xlabel.backgroundColor = [UIColor redColor];
    xlabel.text =[NSString stringWithFormat:@"疾病类型: %@",self.title];
    //        @"疾病类型: 肿瘤";
    [self.view addSubview:xlabel];
    [xlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(120, 10, 530, 100));
        make.top.equalTo(zlabel.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(10);
    }];
    
#warning 开始栏 入口
    //第一栏
    UIView *firstView = [[UIView alloc]init];
    firstView.backgroundColor = [UIColor whiteColor];
    self.firstView = firstView;
    [self.view addSubview:firstView];
    [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(155, 20, 470, 20));
        make.top.equalTo(xlabel.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-69 );
        make.height.equalTo(@(screemH/16));
        
        //            mak
        
    }];
    UILabel *firstLabel = [[UILabel alloc]init];
    firstLabel.textColor = [UIColor colorWithRed:0.7333 green:0.7294 blue:0.7608 alpha:1.0];
    firstLabel.text = @"请选择疾病细分";
    [self.firstView addSubview:firstLabel];
    [firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.firstView).mas_offset(UIEdgeInsetsMake(5, 5, 5, 0));
    }];
    UIImageView *fistmageView = [[UIImageView alloc]init];
    fistmageView.image = [UIImage imageNamed:@"illness_img_line.png"];
    [self.firstView addSubview:fistmageView];
    [fistmageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.firstView).mas_offset(UIEdgeInsetsMake(5, 280, 5, 54));
    }];
    UIImageView *fistImageView = [[UIImageView alloc]init];
    fistImageView.image = [UIImage imageNamed:@"illness_button_input_blue.png"];
    [self.firstView addSubview:fistImageView];
    [fistImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.firstView).mas_offset(UIEdgeInsetsMake(17, 305, 17, 20));
        
    }];
    /**
     UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(event:)];
     
     
     
     //将手势添加到需要相应的view中去
     
     [_view addGestureRecognizer:tapGesture];
     */
    
    
    //第二条
    UIView *secondView = [[UIView alloc]init];
    secondView.backgroundColor = [UIColor whiteColor];
    self.secondView = secondView;
    [self.view addSubview:secondView];
    [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(210, 20, 415, 20));
        make.top.equalTo(firstView.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-69 );
        make.height.equalTo(@(screemH/16));
        //            mak
        
        
    }];
    UILabel *secondLabel = [[UILabel alloc]init];
    secondLabel.textColor = [UIColor colorWithRed:0.7333 green:0.7294 blue:0.7608 alpha:1.0];
    secondLabel.text = @"请选择并发症(可多选)";
    self.secondLabel=secondLabel;
    [self.secondView addSubview:secondLabel];
    [secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.secondView).mas_offset(UIEdgeInsetsMake(5, 5, 5, 0));
    }];
    UIImageView *secondImage = [[UIImageView alloc]init];
    secondImage.image = [UIImage imageNamed:@"illness_img_line.png"];
    [self.secondView addSubview:secondImage];
    [secondImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.secondView).mas_offset(UIEdgeInsetsMake(5, 280, 5, 54));
    }];
    UIImageView *secondIMageVIew = [[UIImageView alloc]init];
    secondIMageVIew.image = [UIImage imageNamed:@"illness_button_input_blue.png"];
    [self.secondView addSubview:secondIMageVIew];
    [secondIMageVIew mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.secondView).mas_offset(UIEdgeInsetsMake(17, 305, 17, 20));
        
    }];
    
    //第三条
    UIView *threeView = [[UIView alloc]init];
    threeView.backgroundColor = [UIColor whiteColor];
    self.threeView = threeView;
    [self.view addSubview:threeView];
    [threeView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(270, 20, 355, 20));
        make.top.equalTo(secondView.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10 );
        make.height.equalTo(@(screemH/16));
        
    }];
    UILabel *threeLabel = [[UILabel alloc]init];
    threeLabel.text = @"是否确诊";
    self.threeLabel = threeLabel;
    threeLabel.textColor = [UIColor colorWithRed:0.7333 green:0.7294 blue:0.7608 alpha:1.0];
    [self.threeView addSubview:threeLabel];
    [threeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.threeView).mas_offset(UIEdgeInsetsMake(5, 5, 5, 0));
    }];
    UIButton *threeButton = [[UIButton alloc]init];
    //    threeButton.backgroundColor = [UIColor redColor];
    [threeButton setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
    [threeButton setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateSelected];
    threeButton.tag = 1;
    [self.threeView addSubview:threeButton];
    [threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.threeView).mas_offset(UIEdgeInsetsMake(15, 140, 15, 180));
        
    }];
    UILabel *tureLabel = [[UILabel alloc]init];
    tureLabel.text = @"已确诊";
    [self.threeView addSubview:tureLabel];
    [tureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.threeView).mas_offset(UIEdgeInsetsMake(5, 160, 5, 0));
        
    }];
    //    self.threeLabel = tureLabel;
    //diagnose确诊
    [threeButton addTarget:self action:@selector(diagnose:) forControlEvents:UIControlEventTouchDown];
    
    //症状疑似
    UIButton *symptomButoon = [[UIButton alloc]init];
    //    threeButton.backgroundColor = [UIColor redColor];
    [symptomButoon setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
    [symptomButoon setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateSelected];
    symptomButoon.tag = 2;
    [self.threeView addSubview:symptomButoon];
    [symptomButoon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.threeView).mas_offset(UIEdgeInsetsMake(15, 240, 15, 80));
    }];
    UILabel *symptomLabel = [[UILabel alloc]init];
    symptomLabel.text = @"疑似症状";
    [self.threeView addSubview:symptomLabel];
    [symptomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.threeView).mas_offset(UIEdgeInsetsMake(5, 260, 5, 0));
    }];
    //疑似症状
    [symptomButoon addTarget:self action:@selector(symptomButton:) forControlEvents:UIControlEventTouchDown];
    
    
    //第四条
    UIView *fourView = [[UIView alloc]init];
    fourView.backgroundColor = [UIColor whiteColor];
    self.fourView = fourView;
    [self.view addSubview:fourView];
    [fourView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.view).mas_offset(UIEdgeInsetsMake(330, 20, 290, 20));
        make.top.equalTo(threeView.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
    }];
    UILabel *fourLabel = [[UILabel alloc]init];
    fourLabel.text = @"是否接受过治疗";
    fourLabel.textColor = [UIColor colorWithRed:0.7333 green:0.7294 blue:0.7608 alpha:1.0];
    self.fourLabel = fourLabel;
    [self.fourView addSubview:fourLabel];
    [fourLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.fourView).mas_offset(UIEdgeInsetsMake(5, 5, 5, 0));
        make.right.equalTo(self.view.mas_right).offset(-10 );
        make.height.equalTo(@(screemH/16));
    }];
    //receive 接受  unsolved未接受
    UIButton *receiveButton = [[UIButton alloc]init];
    //    threeButton.backgroundColor = [UIColor redColor];
    [receiveButton setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
    [receiveButton setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateSelected];
    [self.fourView addSubview:receiveButton];
    [receiveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.fourView).mas_offset(UIEdgeInsetsMake(15, 140, 15, 180));
    }];
    UILabel *receiveLabel = [[UILabel alloc]init];
    receiveLabel.text = @"接受过";
    [self.fourView addSubview:receiveLabel];
    [receiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.fourView).mas_offset(UIEdgeInsetsMake(5, 160, 5, 0));
    }];
    [receiveButton addTarget:self action:@selector(receive:) forControlEvents:UIControlEventTouchDown];
    
    //未接受过
    UIButton *unsolvedButton = [[UIButton alloc]init];
    //    threeButton.backgroundColor = [UIColor redColor];
    [unsolvedButton setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_nor.png"] forState:UIControlStateNormal];
    [unsolvedButton setBackgroundImage:[UIImage imageNamed:@"illness_rb_img_sel.png"] forState:UIControlStateSelected];
    [self.fourView addSubview:unsolvedButton];
    [unsolvedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.fourView).mas_offset(UIEdgeInsetsMake(15, 240, 15, 80));
    }];
    
    [unsolvedButton addTarget:self action:@selector(unsolveButton:) forControlEvents:UIControlEventTouchDown];
    UILabel *unsolvedLabel = [[UILabel alloc]init];
    unsolvedLabel.text = @"未接受过";
    [self.fourView addSubview:unsolvedLabel];
    [unsolvedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.fourView).mas_offset(UIEdgeInsetsMake(5, 260, 5, 0));
    }];
    
    
    
    
    
#warning 事先创好View  隐藏
    //创建一个View
    UIView *blewView = [[UIView alloc]init];
    blewView.backgroundColor = [UIColor whiteColor];
    self.blewView = blewView;
    [self.view addSubview:blewView];
    //330, 20, 290, 20
    //    ZXView *blew1View = [[ZXView alloc]init];
    //    [self.view addSubview:blewView1];
    [blewView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(self.view).mas_equalTo(UIEdgeInsetsMake(390, 20, 240, 20));
        make.top.equalTo(fourView.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(10);
//        make.right.equalTo(self.view.mas_right).offset(-69 );
//        make.height.equalTo(@(screemH/16));
        
    }];
    //添加文字
    UILabel *blewLabel = [[UILabel alloc]init];
    //        blewLabel.textColor = [UIColor colorWithRed:0.7333 green:0.7294 blue:0.7608 alpha:1.0];
    blewLabel.text = @"请选择治疗方式";
    self.blewLabel = blewLabel;
    [self.blewView addSubview:blewLabel];
    [blewLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.blewView).mas_offset(UIEdgeInsetsMake(5, 5, 5, 100));
    }];
    //隐藏view
    blewView.hidden = YES;
    
    
    //图片
    UIImageView *blewImage = [[UIImageView alloc]init];
    blewImage.image = [UIImage imageNamed:@"illness_img_line.png"];
    [self.blewView addSubview:blewImage];
    [blewImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.blewView).mas_offset(UIEdgeInsetsMake(5, 280, 5, 54));
    }];
    UIImageView *blewimage = [[UIImageView alloc]init];
    blewimage.image = [UIImage imageNamed:@"illness_button_input_blue.png"];
    [self.blewView addSubview:blewimage];
    [blewimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.blewView).mas_equalTo(UIEdgeInsetsMake(14, 305, 14, 20));
    }];
    //文字
    UILabel *textLabel = [[UILabel alloc]init];
    textLabel.text = @"为您匹配到: 42 位医生";
    textLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:textLabel];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).mas_equalTo(UIEdgeInsetsMake(300, 0, 20, 0));
        make.top.equalTo(fourView.mas_bottom).offset(70);
        make.left.equalTo(self.view.mas_left).offset(10);
                make.right.equalTo(self.view.mas_right).offset(-10 );
                make.height.equalTo(@(40));
        
    }];
    
    //图片
    UIImageView *ImageView =[[UIImageView alloc]init];
    //    ImageView.backgroundColor = [UIColor redColor];
    ImageView.image = [UIImage imageNamed:@"illness_img_person.png"];
    [self.view addSubview:ImageView];
    [ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).mas_equalTo(UIEdgeInsetsMake(500, 140, 80, 140));
        make.top.equalTo(textLabel.mas_bottom).offset(10);
        make.left.equalTo(self.view.mas_left).offset(screemW/2-45);
        make.right.equalTo(self.view.mas_right).offset(-screemW/2+45);
        make.height.equalTo(@(90));

        
    }];
    //按钮
    UIButton *zxbutton = [[UIButton alloc]init];
    zxbutton.backgroundColor = [UIColor colorWithRed:0.0706 green:0.6824 blue:0.6706 alpha:1.0];
    //    [zxbutton setImage:[UIImage imageNamed:@"queren"] forState:UIControlStateNormal];
    [zxbutton setTitle:@"就医申请" forState:UIControlStateNormal];
    [zxbutton setTitle:@"皮卡 皮卡 啾啾揪 十万伏特" forState:UIControlStateHighlighted];
    [self.view addSubview:zxbutton];
    
    [zxbutton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view).mas_equalTo(UIEdgeInsetsMake(605, 10, 20, 10));
        make.top.equalTo(ImageView.mas_bottom).offset(20);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(@(40));

    }];
    
    UITapGestureRecognizer *tapGesutre1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mohuSearch:)];
    [firstView addGestureRecognizer:tapGesutre1];
    UITapGestureRecognizer *tapGesutre2= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bingfazheng:)];
    [secondView addGestureRecognizer:tapGesutre2];
    UITapGestureRecognizer *tapGesutre3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cureWay:)];
    [blewView addGestureRecognizer:tapGesutre3];
}

-(void)diagnose:(UIButton *)button
{
    //    NSLog(@"1");
    self.selectButton.selected = NO;
    button.selected = YES;
    
    self.threeLabel.text= @"已确诊";
    self.threeLabel.textColor = [UIColor blackColor];
    self.selectButton = button;
    
}


-(void)symptomButton:(UIButton *)button
{
    self.selectButton.selected = NO;
    button.selected = YES;
    
    self.threeLabel.text = @"症状疑似";
    self.threeLabel.textColor = [UIColor blackColor];
    
    self.selectButton = button;
    
    
}

-(void)receive:(UIButton *)button
{
    self.select2Button.selected = NO;
    button.selected = YES;
    
    self.fourLabel.text = @"接受过";
    self.fourLabel.textColor = [UIColor blackColor];
    self.select2Button = button;
    
    //开启隐藏的View
    self.blewView.hidden = NO;
    
    
}

-(void)unsolveButton:(UIButton *)button
{
    self.select2Button.selected = NO;
    
    button.selected = YES;
    
    self.fourLabel.text = @"未接受过";
    self.fourLabel.textColor = [UIColor blackColor];
    
    self.select2Button = button;
    
    
    //关闭开出的VIEW  让他隐藏起来
    self.blewView.hidden = YES;
}

-(void)mohuSearch:(UITapGestureRecognizer *)tap
{
    
    
    //        self.navigationController.navigationItem
}


-(void)bingfazheng:(UITapGestureRecognizer *)tap
{
    SyndromeViewController* bingFaZheng=[[SyndromeViewController alloc]init];
    [bingFaZheng setTempBlock:^(NSString * str) {
       
    
        self.secondLabel.text=str;
        self.secondLabel.textColor=[UIColor blackColor];
        
    }];
    [self.navigationController pushViewController:bingFaZheng animated:YES];

    
    
    //        self.navigationController.navigationItem
}
-(void)cureWay:(UITapGestureRecognizer *)tap
{
    
    
}






@end

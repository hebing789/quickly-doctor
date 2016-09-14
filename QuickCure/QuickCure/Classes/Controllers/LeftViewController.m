//
//  LeftViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "LeftViewController.h"
#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "DoctorApplyViewController.h"
#import "FocusDoctorViewController.h"
#import "CaseManagerViewController.h"
#import "SettingViewController.h"
#import "AboutProductViewController.h"
#import "SharedViewController.h"

@interface LeftViewController ()<UITableViewDelegate,UITableViewDataSource>

/** 没有登录界面 */
@property (nonatomic, strong) UIView *noLoginBGView;

/** 有登录界面 */
@property (nonatomic, strong) UIView *loginBGView;

/** tableView */
@property (nonatomic, strong) UITableView *tableview;

@property (nonatomic, strong) NSArray *arrData1;

@property (nonatomic, strong) NSArray *arrData2;

@end

@implementation LeftViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self configureUI];
    
    [self setupUI];
    
}

#pragma mark  - 配置
-(void)configureUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.hidden = YES;
    
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.arrData1 = @[@"名医通申请",@"病例管理",@"关注医生"];
    
    self.arrData2 = @[@"设置与帮助",@"关于产品",@"分享给好友"];
    
}

#pragma mark  - 设置UI
- (void)setupUI {
    
    //********登录和未登录都已写好，切换点在此，别忘了*************
    
    [self.view addSubview:self.noLoginBGView];
    
    [self.view addSubview:self.tableview];
    
    [self.tableview mas_makeConstraints:^(MASConstraintMaker *make) {
        //别忘了相对位置
        make.top.mas_equalTo(self.noLoginBGView.mas_bottom);
        make.left.bottom.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_LEFT_WIDTH);
    }];
    
}


#pragma mark  - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;  //因为数据少，就直接定死
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.section==0) {
        
        cell.textLabel.text = self.arrData1[indexPath.row];
        
    }else{
        
        cell.textLabel.text = self.arrData2[indexPath.row];
    }
    
    
    return cell;
}
#pragma mark  - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        
        return 0.01;
    }
    return 5;
}
////设置选中Cell的响应事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row     = indexPath.row;
    
    //1.创建一个空的，下面重新赋值
    UIViewController *newVC = nil;
    
    if (section==0) {
        
        switch (row) {
            case 0:
                
                //2. 赋值
                newVC = (DoctorApplyViewController *)[[DoctorApplyViewController alloc] init];
                
                break;
                
            case 1:
                
                newVC = (CaseManagerViewController *)[[CaseManagerViewController alloc] init];
                
                break;
                
            case 2:
                
                newVC = (FocusDoctorViewController *)[[FocusDoctorViewController alloc] init];
                
                break;
                
            default:
                break;
        }
        
        //3.都要设置所在控制器title值
        newVC.title = self.arrData1[row];
        
    }else{
        
        switch (row) {
            case 0:
                
                newVC = (SettingViewController *)[[SettingViewController alloc] init];
                break;
                
            case 1:
                
                newVC = (AboutProductViewController *)[[AboutProductViewController alloc] init];
                break;
                
            case 2:
                
                newVC = (SharedViewController *)[[SharedViewController alloc] init];
                break;
            default:
                break;
        }
        
        
        newVC.title = self.arrData2[row];
        
    }
    
    //4. 通过centerPanel 跳转
    [self jumpToOtherViewController: newVC];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark  - Actions
- (void)clickButton:(UIButton *)btn{
    
    //点击'登录'
    if (btn.tag == 101) {
        
        LoginViewController *loginVC = [[LoginViewController alloc] init];
        
        [self jumpToOtherViewController:loginVC];
        
    }
    //点击'注册'
    else{
        
        RegisterViewController *registerVC = [[RegisterViewController alloc] init];
        
        [self jumpToOtherViewController:registerVC];
    }
}


#pragma mark  - Lazy
-(UITableView *)tableview{
    
    if (_tableview == nil) {
        
       _tableview = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        _tableview.dataSource = self;
        _tableview.delegate = self;
        
    }
    return _tableview;
}


-(UIView *)noLoginBGView{
    
    if (_noLoginBGView == nil) {
        _noLoginBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 120)];
        _noLoginBGView.backgroundColor = kThemeColor;
        
        //头像
        UIImageView *iconV = [[UIImageView alloc] init];
        
        iconV.image = [UIImage imageNamed:@"name"];
        [_noLoginBGView addSubview:iconV];
        iconV.bounds = CGRectMake(0, 0, 45, 45);
        iconV.center = CGPointMake(SCREEN_LEFT_WIDTH/2, 50);
        
        
        //登录
        UIButton *leftButton = [[UIButton alloc] init];
        [_noLoginBGView addSubview:leftButton];
        leftButton.tag = 101;
        [leftButton setTitle:@"登录" forState:UIControlStateNormal];
        [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [leftButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(iconV.mas_bottom).offset(10);
            make.right.mas_equalTo(iconV.mas_centerX).offset(-10);
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
        
        //注册
        UIButton *rightButton = [[UIButton alloc] init];
        [_noLoginBGView addSubview:rightButton];
        rightButton.tag = 102;
        [rightButton setTitle:@"注册" forState:UIControlStateNormal];
        [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.mas_equalTo(iconV.mas_bottom).offset(10);
            make.left.mas_equalTo(iconV.mas_centerX).offset(10);
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
        
    }
    
    return _noLoginBGView;
}

-(UIView *)loginBGView{
    
    if (_loginBGView == nil) {
        _loginBGView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 120)];
        _loginBGView.backgroundColor = kThemeColor;
        
        //头像
        UIImageView *iconV = [[UIImageView alloc] init];
        iconV.image = [UIImage imageNamed:@"heima"];
        [_loginBGView addSubview:iconV];
        iconV.layer.cornerRadius = 35;
        iconV.layer.masksToBounds = YES;
        
        [iconV mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.size.mas_equalTo(CGSizeMake(70, 70));
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(30);
        }];
        
        //昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.text = @"黑吗";
        nameLabel.font = FONT(16);
        [_loginBGView addSubview:nameLabel];
        
        [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(iconV).offset(5);
            make.left.mas_equalTo(iconV.mas_right).offset(15);
            
        }];
        
        //个人资料
        UILabel *descLabel = [[UILabel alloc] init];
        descLabel.text = @"查看个人资料";
        descLabel.font = FONT(15);
        [_loginBGView addSubview:descLabel];
        [descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(iconV).offset(-5);
            make.left.mas_equalTo(iconV.mas_right).offset(15);
        }];
    }
    
    return _loginBGView;
}

@end

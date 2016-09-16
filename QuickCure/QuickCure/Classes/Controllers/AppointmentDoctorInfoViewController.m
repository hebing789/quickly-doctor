//
//  AppointmentDoctorInfoViewController.m
//  QuickCure
//
//  Created by ymQiao on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "AppointmentDoctorInfoViewController.h"
#import "DoctorApplyModel.h"

@interface AppointmentDoctorInfoViewController ()

@property(nonatomic,strong)UIImageView *patientImg;
@property(nonatomic,strong)UILabel *patientLab;
@property(nonatomic,strong)UILabel *symptomLab;
@property(nonatomic,strong)UILabel *timeLab;
@property(nonatomic,strong)UIButton *stateBtn;

@property(nonatomic,strong)UIView *separateLine1;
@property(nonatomic,strong)UILabel *appointmentDoctorLab;
@property(nonatomic,strong)UIView *separateLine2;

@property(nonatomic,strong)UILabel *doctorLab;
@property(nonatomic,strong)UILabel *roleLab;
@property(nonatomic,strong)UILabel *hospitalLab;
@property(nonatomic,strong)UIButton *commitBtn;

@property(nonatomic,strong)UIView *separateLine3;
@property(nonatomic,strong)UILabel *appointmentInfoLab;
@property(nonatomic,strong)UIView *separateLine4;

@property(nonatomic,strong)UILabel *positionLab;
@property(nonatomic,strong)UILabel *detailPositionLab;
@property(nonatomic,strong)UILabel *ticketTimeLab;
@property(nonatomic,strong)UILabel *detailTicketTimeLab;
@property(nonatomic,strong)UILabel *ticketAddressLab;
@property(nonatomic,strong)UILabel *detailTicketAddressLab;
@property(nonatomic,strong)UIView *separateLine5;

@property(nonatomic,strong)UIButton *msgResendBtn;
@property(nonatomic,strong)UIButton *cancelationBtn;

@end

@implementation AppointmentDoctorInfoViewController

#pragma mark - 控件懒加载
- (UIImageView *)patientImg
{
    if (!_patientImg) {
        _patientImg = [[UIImageView alloc] init];
    }
    return _patientImg;
}

- (UILabel *)patientLab
{
    if (!_patientLab) {
        _patientLab = [[UILabel alloc] init];
    }
    return _patientLab;
}

- (UILabel *)symptomLab
{
    if (!_symptomLab) {
        _symptomLab = [[UILabel alloc] init];
    }
    return _symptomLab;
}

- (UILabel *)timeLab
{
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
    }
    return _timeLab;
}

- (UIButton *)stateBtn
{
    if (!_stateBtn) {
        _stateBtn = [[UIButton alloc] init];
    }
    return _stateBtn;
}

- (UIView *)separateLine1
{
    if (!_separateLine1) {
        _separateLine1 = [[UIView alloc] init];
    }
    return _separateLine1;
}

- (UIView *)separateLine2
{
    if (!_separateLine2) {
        _separateLine2 = [[UIView alloc] init];
    }
    return _separateLine2;
}

- (UIView *)separateLine3
{
    if (!_separateLine3) {
        _separateLine3 = [[UIView alloc] init];
    }
    return _separateLine3;
}

- (UIView *)separateLine4
{
    if (!_separateLine4) {
        _separateLine4 = [[UIView alloc] init];
    }
    return _separateLine4;
}

- (UIView *)separateLine5
{
    if (!_separateLine5) {
        _separateLine5 = [[UIView alloc] init];
    }
    return _separateLine5;
}

- (UILabel *)appointmentDoctorLab
{
    if (!_appointmentDoctorLab) {
        _appointmentDoctorLab = [[UILabel alloc] init];
    }
    return _appointmentDoctorLab;
}

- (UILabel *)doctorLab
{
    if (!_doctorLab) {
        _doctorLab = [[UILabel alloc] init];
    }
    return _doctorLab;
}

- (UILabel *)roleLab
{
    if (!_roleLab) {
        _roleLab = [[UILabel alloc] init];
    }
    return _roleLab;
}

- (UILabel *)hospitalLab
{
    if (!_hospitalLab) {
        _hospitalLab = [[UILabel alloc] init];
    }
    return _hospitalLab;
}

- (UIButton *)commitBtn
{
    if (!_commitBtn) {
        _commitBtn = [[UIButton alloc] init];
    }
    return _commitBtn;
}

- (UILabel *)appointmentInfoLab
{
    if (!_appointmentInfoLab) {
        _appointmentInfoLab = [[UILabel alloc] init];
    }
    return _appointmentInfoLab;
}

- (UILabel *)positionLab
{
    if (!_positionLab) {
        _positionLab = [[UILabel alloc] init];
    }
    return _positionLab;
}

- (UILabel *)detailPositionLab
{
    if (!_detailPositionLab) {
        _detailPositionLab = [[UILabel alloc] init];
    }
    return _detailPositionLab;
}

- (UILabel *)ticketTimeLab
{
    if (!_ticketTimeLab) {
        _ticketTimeLab = [[UILabel alloc] init];
    }
    return _ticketTimeLab;
}

- (UILabel *)detailTicketTimeLab
{
    if (!_detailTicketTimeLab) {
        _detailTicketTimeLab = [[UILabel alloc] init];
    }
    return _detailTicketTimeLab;
}

- (UILabel *)ticketAddressLab
{
    if (!_ticketAddressLab) {
        _ticketAddressLab = [[UILabel alloc] init];
    }
    return _ticketAddressLab;
}

- (UILabel *)detailTicketAddressLab
{
    if (!_detailTicketAddressLab) {
        _detailTicketAddressLab = [[UILabel alloc] init];
    }
    return _detailTicketAddressLab;
}

- (UIButton *)msgResendBtn
{
    if (!_msgResendBtn) {
        _msgResendBtn = [[UIButton alloc] init];
    }
    return _msgResendBtn;
}

- (UIButton *)cancelationBtn
{
    if (!_cancelationBtn) {
        _cancelationBtn = [[UIButton alloc] init];
    }
    return _cancelationBtn;
}

#pragma mark - 重写模型的set方法，进行控件赋值
- (void)setAppDotInfoModel:(DoctorApplyModel *)appDotInfoModel
{
    _appDotInfoModel = appDotInfoModel;
    //病人基本信息
    self.patientImg.image = [UIImage imageNamed:@"heima"];
    self.patientLab.text = appDotInfoModel.patientName;
    self.symptomLab.text = appDotInfoModel.symptom;
    self.symptomLab.textColor = [UIColor lightGrayColor];
    self.timeLab.text = [NSString stringWithFormat:@"就诊:%@",appDotInfoModel.time];
    self.timeLab.textColor = [UIColor lightGrayColor];
    //预约状态
    [self.stateBtn setTitle:appDotInfoModel.state forState:UIControlStateNormal];
    self.stateBtn.backgroundColor = [UIColor purpleColor];
    self.stateBtn.layer.cornerRadius = 30;
    self.stateBtn.clipsToBounds = YES;
    //预约医生
    self.appointmentDoctorLab.text = @"预约医生：";
    self.appointmentDoctorLab.font = [UIFont systemFontOfSize:22];
    self.appointmentDoctorLab.textColor = [UIColor lightGrayColor];
    //分割线
    self.separateLine1.backgroundColor = [UIColor lightGrayColor];
    self.separateLine2.backgroundColor = [UIColor lightGrayColor];
    self.separateLine3.backgroundColor = [UIColor lightGrayColor];
    self.separateLine4.backgroundColor = [UIColor lightGrayColor];
    self.separateLine5.backgroundColor = [UIColor lightGrayColor];
    
    self.doctorLab.text = appDotInfoModel.doctorName;
    self.roleLab.text = appDotInfoModel.role;
    self.roleLab.textColor = [UIColor lightGrayColor];
    self.hospitalLab.text = appDotInfoModel.hospital;
    self.hospitalLab.textColor = [UIColor lightGrayColor];
    
    [self.commitBtn setTitle:@"递交反馈" forState:UIControlStateNormal];
    self.commitBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 5, 10, 5);
    self.commitBtn.backgroundColor = [UIColor lightGrayColor];
    self.commitBtn.layer.cornerRadius = 5;
    self.commitBtn.clipsToBounds = YES;
    
    self.appointmentInfoLab.text = @"预约须知：";
    self.appointmentInfoLab.font = [UIFont systemFontOfSize:22];
    self.appointmentInfoLab.textColor = [UIColor lightGrayColor];
    
    //就诊地点
    self.positionLab.text = @"就诊地点：";
    self.detailPositionLab.text = @"上海长征医院2号楼心血管内科";
    self.detailPositionLab.textColor = [UIColor lightGrayColor];
    //取号时间
    self.ticketTimeLab.text = @"取号时间：";
    self.detailTicketTimeLab.text = @"9:00 - 10:00";
    self.detailTicketTimeLab.textColor = [UIColor lightGrayColor];
    //取号地址
    self.ticketAddressLab.text = @"取号地址：";
    self.detailTicketAddressLab.text = @"上海长征医院住院部";
    self.detailTicketAddressLab.textColor = [UIColor lightGrayColor];
    
    //短信重发
    [self.msgResendBtn setTitle:@"短信重发" forState:UIControlStateNormal];
    [self.msgResendBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.msgResendBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 35, 10, 35);
    self.msgResendBtn.layer.borderWidth = 1;
    self.msgResendBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.msgResendBtn.layer.cornerRadius = 5;
    self.msgResendBtn.clipsToBounds = YES;
    
    //取消预约
    [self.cancelationBtn setTitle:@"取消预约" forState:UIControlStateNormal];
    [self.cancelationBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.cancelationBtn.contentEdgeInsets = UIEdgeInsetsMake(10, 35, 10, 35);
    self.cancelationBtn.layer.borderWidth = 1;
    self.cancelationBtn.layer.borderColor = [[UIColor lightGrayColor]CGColor];
    self.cancelationBtn.layer.cornerRadius = 5;
    self.cancelationBtn.clipsToBounds = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self setNavigationBar];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - 设置导航栏
- (void)setNavigationBar
{
    self.navigationController.navigationBar.translucent = NO;
    self.title = @"预约医生信息详情";
    
    //设置leftItem
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"jiantou"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(popController)];
    self.navigationItem.leftBarButtonItem = leftItem;
}

#pragma mark - 加载控件
- (void)setupUI
{
    [self.view addSubview:self.patientImg];
    [self.view addSubview:self.patientLab];
    [self.view addSubview:self.symptomLab];
    [self.view addSubview:self.timeLab];
    [self.view addSubview:self.stateBtn];
    
    [self.view addSubview:self.separateLine1];
    [self.view addSubview:self.appointmentDoctorLab];
    [self.view addSubview:self.separateLine2];
    
    [self.view addSubview:self.doctorLab];
    [self.view addSubview:self.roleLab];
    [self.view addSubview:self.hospitalLab];
    [self.view addSubview:self.commitBtn];
    
    [self.view addSubview:self.separateLine3];
    [self.view addSubview:self.appointmentInfoLab];
    [self.view addSubview:self.separateLine4];
    
    [self.view addSubview:self.positionLab];
    [self.view addSubview:self.detailPositionLab];
    [self.view addSubview:self.ticketTimeLab];
    [self.view addSubview:self.detailTicketTimeLab];
    [self.view addSubview:self.ticketAddressLab];
    [self.view addSubview:self.detailTicketAddressLab];
    [self.view addSubview:self.separateLine5];
    
    [self.view addSubview:self.msgResendBtn];
    [self.view addSubview:self.cancelationBtn];
    
    [self setConstraint];
}

#pragma mark - 设置约束
- (void)setConstraint
{
    [self.patientImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.equalTo(self.view).offset(15);
        make.height.width.equalTo(@44);
    }];
    
    [self.patientLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(15);
        make.leading.equalTo(self.patientImg.mas_trailing).offset(10);
    }];
    
    [self.symptomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(15);
        make.leading.equalTo(self.patientLab.mas_trailing).offset(10);
    }];
    
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.patientImg.mas_trailing).offset(10);
        make.bottom.equalTo(self.patientImg);
    }];
    
    [self.stateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(10);
        make.trailing.equalTo(self.view).offset(-15);
        make.height.width.equalTo(@60);
    }];
    
    [self.separateLine1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.stateBtn.mas_bottom).offset(5);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    
    [self.appointmentDoctorLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine1.mas_bottom).offset(5);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.separateLine2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appointmentDoctorLab.mas_bottom).offset(5);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    
    //马医生
    [self.doctorLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine2.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.roleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine2.mas_bottom).offset(10);
        make.leading.equalTo(self.doctorLab.mas_trailing).offset(20);
    }];
    
    [self.hospitalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.doctorLab.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine2.mas_bottom).offset(16);
        make.trailing.equalTo(self.view).offset(-15);
    }];
    
    [self.separateLine3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hospitalLab.mas_bottom).offset(10);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    
    //预约须知
    [self.appointmentInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine3.mas_bottom).offset(5);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.separateLine4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.appointmentInfoLab.mas_bottom).offset(5);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    //就诊地点
    [self.positionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine4.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.detailPositionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.separateLine4.mas_bottom).offset(10);
        make.leading.equalTo(self.positionLab.mas_trailing).offset(15);
    }];
    //取号时间
    [self.ticketTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.positionLab.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.detailTicketTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.positionLab.mas_bottom).offset(10);
        make.leading.equalTo(self.ticketTimeLab.mas_trailing).offset(15);
    }];
    //取号地址
    [self.ticketAddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ticketTimeLab.mas_bottom).offset(10);
        make.leading.equalTo(self.view).offset(15);
    }];
    
    [self.detailTicketAddressLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ticketTimeLab.mas_bottom).offset(10);
        make.leading.equalTo(self.ticketAddressLab.mas_trailing).offset(15);
    }];
    
    [self.separateLine5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ticketAddressLab.mas_bottom).offset(10);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    
    //短信重发
    [self.msgResendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
    //取消预约
    [self.cancelationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
}

/**
 *  pop当前控制器
 */
- (void)popController
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  DoctorViewController.m
//  QuickCure
//
//  Created by 李亚 on 9/13/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import "DoctorViewController.h"

@interface DoctorViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign)NSInteger btnTage;

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,assign)BOOL *isheight;

@end

@implementation DoctorViewController

- (UIImageView *)imageIcon
{
    if (!_imageIcon) {
        _imageIcon = [[UIImageView alloc]init];
    }
    return _imageIcon;
}

-(UILabel *)nameLable
{
    if (!_nameLable) {
        _nameLable = [[UILabel alloc]init];
    }
    return _nameLable;
}

- (UILabel *)titleLable
{
    if (!_titleLable) {
        _titleLable = [[UILabel alloc]init];
    }
    return _titleLable;
}

- (UILabel *)companyLable
{
    if (!_companyLable) {
        _companyLable =[[UILabel alloc]init];
    }
    return _companyLable;
}

- (UIButton *)plusBtn
{
    if (!_plusBtn) {
        _plusBtn = [[UIButton alloc]init];
    }
    return _plusBtn;
}

- (UIButton *)flowerBtn
{
    if (!_flowerBtn) {
        _flowerBtn = [[UIButton alloc]init];
    }
    return _flowerBtn;
}

-(UIButton *)saveBtn
{
    if (!_saveBtn) {
        _saveBtn = [[UIButton alloc]init];
    }
    return _saveBtn;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self creatDoctorView];
    
    [self creatMidView];
    
    [self creatTableView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    
    [button setImage:[UIImage imageNamed:@"kongxin"] forState:UIControlStateNormal];
    
//    button.highlighted = 1;
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = btnItem;
    
    [self creatTableView];
    
    [self creatBottomView];
}

- (void)buttonClick:(UIButton *)button
{
    
    if (self.isheight){
        
        [button setImage:[UIImage imageNamed:@"shixin"] forState:UIControlStateNormal];
        self.isheight = 0;
    }
    else
    {
        [button setImage:[UIImage imageNamed:@"kongxin"] forState:UIControlStateNormal];
        
        self.isheight = 1;
    }
}

- (void)creatBottomView
{
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height*12/13, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*1/13)];
    
    bottomView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"nav"]];
    
    UILabel *bottomLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*1/13)];
    
    bottomLable.textAlignment = NSTextAlignmentCenter;
    
    bottomLable.text = @"咨询医生";
    
    bottomLable.textColor = [UIColor whiteColor];
    
    bottomLable.font = [UIFont systemFontOfSize:18];
    
    [imageView addSubview:bottomLable];
    
    [bottomView addSubview:imageView];
    
    [self.view addSubview:bottomView];
}


- (void)creatTableView
{
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.MidView.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - CGRectGetMaxY(self.MidView.frame))style:UITableViewStyleGrouped];
    
    tableView.backgroundColor = [UIColor grayColor];
    
    tableView.delegate = self;
    
    tableView.dataSource = self;
    
    self.tableView = tableView;
    
    self.btnTage = 10;
    
    [self.tableView reloadData];
    
    [self.view addSubview:tableView];
}

- (void)creatMidView
{
    UIView *MidView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.doctorView.frame)+30, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*1/15)];
    
    self.MidView = MidView;
    
    /**
     创建中间的线
     */
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, 1.5, MidView.bounds.size.height)];
    
    imageView.image = [UIImage imageNamed:@"illness_img_line.png"];
    
    [MidView addSubview:imageView];
    
    /**
     *  创建两个button
     */
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width/2-1, MidView.bounds.size.height)];
    
    
    [leftBtn setTitle:@"就诊条件" forState:UIControlStateNormal];
    
    [leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [leftBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateHighlighted];
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2+1, 0, [UIScreen mainScreen].bounds.size.width/2-1, MidView.bounds.size.height)];
    
    [rightBtn setTitle:@"医生简介" forState:UIControlStateNormal];
    
    [rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    
    [rightBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateHighlighted];
    
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [MidView addSubview:leftBtn];
    
    [MidView addSubview:rightBtn];
    
    [self.view addSubview:MidView];
}

-(void)leftBtnClick
{
    self.btnTage = 10;
    
    [self.tableView reloadData];
    
}

-(void)rightBtnClick
{
    self.btnTage = 20;
    
    [self.tableView reloadData];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    }
    if (self.btnTage ==10) {
        cell.textLabel.text = [NSString stringWithFormat:@"就诊条件: %ld行",indexPath.row];
    }
    if (self.btnTage ==20) {
        cell.textLabel.text = [NSString stringWithFormat:@"医生介绍: %ld行",indexPath.row];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (void)creatDoctorView
{
    UIView *doctorView = [[UIView alloc]initWithFrame:CGRectMake(0, 65, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*1/6)];
    //添加控件
    
    [doctorView addSubview:self.imageIcon];
    
    [doctorView addSubview:self.nameLable];
    
    [doctorView addSubview:self.titleLable];
    
    [doctorView addSubview:self.companyLable];
    
    [doctorView addSubview:self.plusBtn];
    
    [doctorView addSubview:self.flowerBtn];
    
    [doctorView addSubview:self.saveBtn];
    
    
    //设置约束
    
    [_imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(doctorView).offset(15);
        make.left.equalTo(doctorView).offset(15);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
    }];
    
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(doctorView).offset(20);
        make.left.equalTo(self.imageIcon.mas_right).offset(10);
    }];
    
    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(doctorView).offset(20);
        make.left.equalTo(self.nameLable.mas_right).offset(10);
    }];
    
    [_companyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLable.mas_bottom).offset(20);
        make.left.equalTo(self.imageIcon.mas_right).offset(10);
    }];
    
    [_plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(doctorView).offset(15);
        make.left.equalTo(doctorView).offset(40);
    }];
    
    [_flowerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(doctorView).offset(15);
        make.left.equalTo(self.plusBtn).offset(120);
    }];
    
    [_saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(doctorView).offset(15);
        make.left.equalTo(self.flowerBtn).offset(120);
    }];
    
    self.doctorView = doctorView;
    
    [self.view addSubview:doctorView];
}







@end

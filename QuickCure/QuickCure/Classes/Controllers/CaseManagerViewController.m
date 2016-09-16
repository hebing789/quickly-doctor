//
//  CaseManagerViewController.m
//  QuickCure
//
//  Created by haoge on 16/9/10.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseManagerViewController.h"
#import "CaseCreateViewController.h"
@interface CaseManagerViewController ()
@end
@interface CaseManagerViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray* dataAry;
@property(nonatomic,weak)UITableView *blView ;
@end

@implementation CaseManagerViewController

//-(NSMutableArray *)dataAry{
//    
//    if (!_dataAry) {
//        _dataAry=[NSMutableArray new];
//        
//        
//    }
//    
//    return  _dataAry;
//}

-(void)setDataAry:(NSMutableArray *)dataAry{
    
    [dataAry enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        [_dataAry addObject:obj];
    }];
    
    
    [self.blView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataAry=[NSMutableArray new];
    self.navigationController.navigationBar.translucent = NO;
    
    UIImageView *personImgv = [[UIImageView alloc] init];
    personImgv.image = [UIImage imageNamed:@"0"];
    [self.view addSubview:personImgv];
    
    [personImgv mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.view).offset(120);
        make.top.equalTo(self.view).offset(20);
        make.width.offset(20);
        make.height.offset(20);
        
    }];
    
    UILabel *personLB = [[UILabel alloc] init];
    personLB.text = @"男  28";
    personLB.tintColor = [UIColor blackColor];
    personLB.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:personLB];
    
    [personLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(personImgv.mas_right).offset(20);
        make.top.bottom.equalTo(personImgv).offset(0);
        
    }];
    
    
    UIImageView *idImgv = [[UIImageView alloc] init];
    idImgv.image = [UIImage imageNamed:@"idCard"];
    [self.view addSubview:idImgv];
    
    [idImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(personImgv).offset(0);
        make.top.equalTo(personImgv.mas_bottom).offset(20);
        make.width.offset(20);
        make.height.offset(20);
        
    }];
    
    UILabel *idLB = [[UILabel alloc] init];
    idLB.text = @"2718672158752781";
    idLB.tintColor = [UIColor blackColor];
    idLB.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:idLB];
    
    [idLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(idImgv.mas_right).offset(20);
        make.top.bottom.equalTo(idImgv).offset(0);
        
    }];
    
    
    UIImageView *phoneImgv = [[UIImageView alloc] init];
    phoneImgv.image = [UIImage imageNamed:@"phone"];
    [self.view addSubview:phoneImgv];
    
    [phoneImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(idImgv).offset(0);
        make.top.equalTo(idImgv.mas_bottom).offset(20);
        make.width.offset(20);
        make.height.offset(20);
        
    }];
    
    UILabel *phoneLB = [[UILabel alloc] init];
    phoneLB.text = @"13848481438";
    phoneLB.tintColor = [UIColor blackColor];
    phoneLB.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:phoneLB];
    
    [phoneLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneImgv.mas_right).offset(20);
        make.top.bottom.equalTo(phoneImgv).offset(0);
        
    }];
    
    
    UIImageView *adrImgv = [[UIImageView alloc] init];
    adrImgv.image = [UIImage imageNamed:@"illness_rb_img_sel.png"];
    [self.view addSubview:adrImgv];
    
    [adrImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(phoneImgv).offset(0);
        make.top.equalTo(phoneImgv.mas_bottom).offset(20);
        make.width.offset(20);
        make.height.offset(20);
        
    }];
    
    UILabel *adrLB = [[UILabel alloc] init];
    adrLB.text = @"上海市";
    adrLB.tintColor = [UIColor blackColor];
    adrLB.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:adrLB];
    
    [adrLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(adrImgv.mas_right).offset(20);
        make.top.bottom.equalTo(adrImgv).offset(0);
        
    }];
    
//
//    UIButton *personBtn = [[UIButton alloc] initWithFrame:CGRectMake(120, 20, 150, 20)];

    
    UILabel *nameLB = [[UILabel alloc] init];
    
    nameLB.text = @"王二狗";
    nameLB.font = [UIFont systemFontOfSize:20];
    nameLB.tintColor = [UIColor clearColor];
    
    [self.view addSubview:nameLB];
    
    [nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(adrImgv.mas_bottom).offset(0);
        make.right.equalTo(adrImgv.mas_left).offset(-15);
        
    }];
    
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(nameLB.mas_bottom).offset(10);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.offset(1);
        
    }];
    
    
    
    //中间的病历
    UITableView *blView = [[UITableView alloc] init];
    self.blView=blView;
    blView.rowHeight = 140;
//    blView.allowsSelection = NO;
    
    [self.view addSubview:blView];
    blView.delegate = self;
    blView.dataSource=self;
    [blView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"bl"];
//    self.blView.rowHeight=40;
    [blView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(line.mas_bottom).offset(0);
        make.left.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(-64);
        
    }];
    
    //最下面的添加按钮
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:@"nav"] forState:UIControlStateNormal];
    [btn setTitle:@"添加病例" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
//    btn.enabled = NO;
//    [btn setHighlighted:NO];
    
    
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(blView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view).offset(-10);
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
    }];
    
    
    
    
    
}


- (void)clickBtn:(UIButton *)btn
{
    
    CaseCreateViewController* caseController=  [[CaseCreateViewController alloc] init];
    
    
    [caseController setDataBlock:^(NSMutableArray * ary) {
       
        self.dataAry=ary;
        
    }];
    [self.navigationController pushViewController:caseController animated:YES];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataAry.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bl" forIndexPath:indexPath];
    if ([self.dataAry[indexPath.item] isKindOfClass:[UIImage class]]) {
        UIImageView* temImgView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 100)];
        temImgView.image=self.dataAry[indexPath.item];
        [cell.contentView addSubview:temImgView];
//        cell.imageView.image=self.dataAry[indexPath.item];
//        cell.imageView.bounds=CGRectMake(0, 0, 100, 100);
    }
    else{
        cell.textLabel.text=self.dataAry[indexPath.item];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
////    有图片返回40
//    UITableViewCell *cell=[self.blView dequeueReusableCellWithIdentifier:@"bl" forIndexPath:indexPath];
//    UIImageView* temImgView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 100, 100)];
//    temImgView.image=self.dataAry[indexPath.item];
//    if ([cell.contentView.subviews containsObject:temImgView]) {
//        return 100;
//    }
    //没法判读有图片不
    if (indexPath.item==2) {
        return 110;
    }
    return 40;
}
@end

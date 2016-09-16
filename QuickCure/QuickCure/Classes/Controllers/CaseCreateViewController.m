//
//  CaseCreateViewController.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseCreateViewController.h"
#import "CaseUpCell.h"
#import "CaseUpModel.h"
#import "CaseSecCell.h"
#import "CaseThrCell.h"
#import "CaseTypeController.h"
#import "CaseDitailController.h"
@interface CaseCreateViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property(nonatomic,weak)UIButton *btn;
@property(nonatomic,strong)NSMutableArray* dataAry;
@property(nonatomic,strong)NSArray *upList;
@property(nonatomic,weak)UITableView *tbView ;
@end

@implementation CaseCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[CaseUpCell class] forCellReuseIdentifier:@"cellUp"];
    UITableView *tbView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    [self.view addSubview:tbView];
    self.tbView=tbView;
    tbView.delegate = self;
    tbView.dataSource=self;
    
    [tbView registerClass:[CaseUpCell class] forCellReuseIdentifier:@"cellUp"];
    
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"home_nav_button_back"]  style:UIBarButtonItemStyleDone target:self action:@selector(back)];
    self.navigationItem.title=@"增加病例";
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"提交" style:UIBarButtonItemStyleDone target:self action:@selector(provideData)];
                                            
                                            }

-(void)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(NSMutableArray *)dataAry{
    if (!_dataAry) {
        _dataAry=self.dataAry=[NSMutableArray new];
    }
    return _dataAry;
}

-(void)provideData{
    
    if (_dataBlock) {
        _dataBlock(self.dataAry);
    }
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

- (NSArray *)upList
{
    if (!_upList) {
        _upList = [CaseUpModel upList];
    }
    return _upList;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        CaseUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellUp" forIndexPath:indexPath];
        cell.model = self.upList[indexPath.row];
        return cell;
    }else
    {
        if (indexPath.row == 0) {
            CaseSecCell *cell = [[CaseSecCell alloc] init];
            return cell;
        }else
        {
            CaseThrCell *cell = [[CaseThrCell alloc] init];
            return cell;
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 50;
    }else
    {
        return 160;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

//cell的跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 ) {
        
//        //第2行,如果第一行的字为请选择,跳出弹出,并且不跳转
//        if (indexPath.row==1) {
//            
//            
//            CaseUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellUp" forIndexPath:indexPath];
//            cell.model = self.upList[indexPath.row];
//            if([cell.labelLB.text isEqualToString: @"请选择"]){
//                return;
//            }
//            
//        }
        
        CaseTypeController* casetype1= [[CaseTypeController alloc] init];
        casetype1.item=indexPath.row ;
        [casetype1 setDadaBlock:^(NSString *str) {
          
            CaseUpCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellUp" forIndexPath:indexPath];
            cell.model = self.upList[indexPath.row];
            cell.labelLB.text=str;
            
            [self.dataAry addObject:str];
            
            
        }];
        [self.navigationController pushViewController:casetype1 animated:YES];
        
    }
   

    if (indexPath.section == 1 & indexPath.row == 1) {
        //这个方法,取出来的cell内容会清空
        CaseThrCell *cell = [self.tbView dequeueReusableCellWithIdentifier:@"cellUp" forIndexPath:indexPath];
        
        
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:[UIImage imageNamed:@"compose_pic_add_highlighted"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickImg:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
        self.btn=btn;
        UILabel *label = [[UILabel alloc] init];
        label.text = @"病例照片:";
        [cell.contentView addSubview:label];
        
       
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(cell.contentView).offset(10);
            make.width.offset(80);
            make.height.offset(20);
        }];

        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.offset(80);
            make.left.equalTo(cell.contentView).offset(30);
            make.bottom.equalTo(cell.contentView).offset(-30);
            make.top.equalTo(label.mas_bottom).offset(20);
        }];
        
        [self clickImg:btn];
        
        
    }

}





- (void)clickImg:(UIButton *)btn
{
    UIImagePickerController* imgPicker=[[UIImagePickerController alloc]init];
    imgPicker.sourceType= UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    
    
    imgPicker.delegate=self;
    [self  presentViewController:imgPicker animated:YES completion:nil];
    
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    
    NSLog(@"%@",info);
    
    UIImage* imag=info[@"UIImagePickerControllerOriginalImage"];
    //图片有个模糊效果
    [self.btn setImage:imag forState:UIControlStateNormal];
    [self.dataAry addObject:imag];
    _btn.enabled=NO;
    
    [self  dismissViewControllerAnimated:YES completion:nil];
    
    
}








@end

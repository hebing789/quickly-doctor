//
//  CityableViewController.m
//  QuickCure
//
//  Created by hebing on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CityableViewController.h"
#import "ProvinceModel.h"

@interface CityableViewController ()



@end

@implementation CityableViewController

-(NSArray*)dataAry{
    if (_dataAry==nil) {
        
        
        _dataAry=[ProvinceModel provinceWithPlistFileName:@"province.plist"];
        //只有写在里面第二次才不会访问
         self.useId=@"pro";
    }
    return _dataAry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  //崩溃useid
    self.dataAry;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:self.useId];
    
   
}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataAry.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.useId forIndexPath:indexPath];
    
    ProvinceModel* model= self.dataAry[indexPath.item];
    //useId不一样,这个数据也不一样
    if ([self.useId isEqualToString:@"pro"]) {
        cell.textLabel.text=model.name;
    }else if ([self.useId isEqualToString:@"city"]){
        
        cell.textLabel.text=self.dataAry[indexPath.item];
        
    }
    
    
//    NSLog(@"%@",cell.textLabel.text);
    
//到这个位置奔溃
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //只让第一个有点击事件
//    NSLog(@"%@",self.useId);
    if ([self.useId isEqualToString:@"pro"]) {
    //获取数据
       ProvinceModel* model= self.dataAry[indexPath.item];
   
    
    CityableViewController* cityControl=[[CityableViewController alloc]init];
    //经过检查,数据没有问题,cell的重用标识符有问题
    //建立属性

    cityControl.dataAry=model.cities;
    cityControl.useId=@"city";
        cityControl.locBlock=self.locBlock;
    
    
    [self.navigationController pushViewController:cityControl animated:YES];
    
    }else if ([self.useId isEqualToString:@"city"]){
        //只有修改到最后一个,数据才同步更新
        //要刷新数据必须在view里面修改数据,数据修改后就调用model里面的数据,先赋值,在刷新
        //属性传值.必须获取到对象,因此不行
        //block传值
        
        NSLog(@"begin");
        if (_locBlock) {
            _locBlock(self.dataAry[indexPath.item],indexPath.item);
        }
        
        
      
        
    }
    
    
}


@end

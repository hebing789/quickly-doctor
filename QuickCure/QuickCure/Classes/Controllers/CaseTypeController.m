//
//  CaseTypeController.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseTypeController.h"

@interface CaseTypeController ()

@property(nonatomic,strong)NSArray *array;

@end

@interface CaseTypeController ()

@end

@implementation CaseTypeController

- (NSArray *)array
{
    if (!_array) {
        
        if (self.item==0) {
            _array = @[@"肿瘤科",@"心血管科",@"血液科",@"神经科",@"骨科"];
        }
        if (self.item==1) {
            _array = @[@"第1行",@"第2行",@"第3行",@"第4行",@"第5行",@"第6行",@"第7行",@"第8行",@"第9行",@"第10行"];

        }
        
    }
    return _array;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];                           //   init ?
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_dadaBlock) {
        _dadaBlock(self.array[indexPath.row]);
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}




@end

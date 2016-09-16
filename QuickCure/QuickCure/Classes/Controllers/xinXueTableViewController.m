//
//  xinXueTableViewController.m
//  QuickCure
//
//  Created by 李亚 on 9/16/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import "xinXueTableViewController.h"
#import "xinXue.h"
#import "NSString+pinyin.h"

@interface xinXueTableViewController ()

@property (nonatomic,strong)NSArray *modelArray;
@property (nonatomic,strong)NSArray *tempModelArray;

@end

@implementation xinXueTableViewController

- (void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    textField.backgroundColor = [UIColor whiteColor];
    textField.tintColor = [UIColor lightGrayColor];
    
    textField.layer.cornerRadius = 10;
    textField.clipsToBounds = YES;
    
    textField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 0)];
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.placeholder = @"请输入关键字";
    self.navigationItem.titleView = textField;
    
    [textField addTarget:self action:@selector(observeTextField:) forControlEvents:UIControlEventEditingChanged];

        
    if ([self.title isEqualToString:@"cure"]) {
        
        self.modelArray=@[@"手术治疗",@"药物治疗",@"保守治疗" ];
        [self.tableView reloadData];
    }
    else{
        [xinXue modelWithSuccess:^(NSArray<xinXue *> *model) {
            self.modelArray = model;
            _tempModelArray = model;
        } error:^{
            
        }];
    }
}

- (void)observeTextField:(UITextField *)textField
{
    self.modelArray = self.tempModelArray;
    
    NSMutableArray *mArr = [NSMutableArray array];
    for (xinXue *string in self.modelArray) {
        NSString *checkString = [string.ci3_name transformToPinyinFirstLetter];
        NSString *inputString = [textField.text lowercaseString];
        
        if ([checkString containsString:inputString]) {
            
            [mArr addObject:string];
            self.modelArray = mArr.copy;
            
            [self.tableView reloadData];
            
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"xinXuecell";
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:reuseId];
    
    
    if (!cell) {
        cell =[[UITableViewCell alloc]init];
    }
    if ([self.title isEqualToString:@"cure"]) {
        
        cell.textLabel.text =self.modelArray[indexPath.row];
        
    }else{
        xinXue *model = self.modelArray[indexPath.row];
        
        cell.textLabel.text = model.ci3_name;
        
    }

    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.title isEqualToString:@"cure"]) {
        
        
        if (_dataBlock) {
            
            
            
            _dataBlock(self.modelArray[indexPath.row]);
            
            [self.navigationController popViewControllerAnimated:YES];
        }
        
    }else{
        
        if (_dataBlock) {
            xinXue *model = self.modelArray[indexPath.row];
            
            
            _dataBlock(model.ci3_name);
            
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
    

    
}


@end

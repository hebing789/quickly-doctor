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
    
//    [self.tableView registerClass:[xinXue class] forCellReuseIdentifier:@"xinXuecell"];
    
    [xinXue modelWithSuccess:^(NSArray<xinXue *> *model) {
        self.modelArray = model;
        _tempModelArray = model;
    } error:^{
        
    }];
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
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *reuseId = @"xinXuecell";
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:reuseId forIndexPath:indexPath];
    }
    
    xinXue *model = self.modelArray[indexPath.row];
    
    cell.textLabel.text = model.ci3_name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

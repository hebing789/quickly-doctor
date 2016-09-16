//
//  xinXueTableViewController.m
//  QuickCure
//
//  Created by 李亚 on 9/16/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import "xinXueTableViewController.h"
#import "xinXue.h"
@interface xinXueTableViewController ()

@property (nonatomic,strong)NSArray *modelArray;

@end

@implementation xinXueTableViewController

- (void)setModelArray:(NSArray *)modelArray
{
    _modelArray = modelArray;
    
    [self.tableView reloadData];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[xinXue class] forCellReuseIdentifier:@"xinXuecell"];
    
    [xinXue modelWithSuccess:^(NSArray<xinXue *> *model) {
        self.modelArray = model;
    } error:^{
        
    }];
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

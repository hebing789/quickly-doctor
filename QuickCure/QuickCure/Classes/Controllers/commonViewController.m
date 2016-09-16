//
//  commonViewController.m
//  QuickCure
//
//  Created by hebing on 16/9/16.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "commonViewController.h"

@interface commonViewController ()

@end

@implementation commonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://202.106.210.115:18080/hyde-pluto-h360/nt/appEntrance.htm"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

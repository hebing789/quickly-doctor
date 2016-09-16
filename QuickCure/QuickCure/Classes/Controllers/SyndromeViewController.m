//
//  SyndromeViewController.m
//  QuickCure
//
//  Created by ymQiao on 16/9/16.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "SyndromeViewController.h"

@interface SyndromeViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) UITableView *syndromeTableView;

@property(nonatomic,strong) UIButton *subscribeBtn;

@end

@implementation SyndromeViewController

- (UITableView *)syndromeTableView
{
    if (!_syndromeTableView) {
        
        _syndromeTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _syndromeTableView.backgroundColor = [UIColor whiteColor];
        
        _syndromeTableView.dataSource = self;
        _syndromeTableView.delegate = self;

        [_syndromeTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"syndromeCell"];
        
        _syndromeTableView.tableFooterView = [[UIView alloc] init];
        _syndromeTableView.rowHeight = 50;
        
    }
    return _syndromeTableView;
}

- (UIButton *)subscribeBtn
{
//    if (!_subscribeBtn) {
        _subscribeBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        
        _subscribeBtn.backgroundColor = [UIColor lightGrayColor];
    _subscribeBtn.layer.cornerRadius = 5;
    _subscribeBtn.clipsToBounds = YES;
    
    [_subscribeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_subscribeBtn setTitle:@"订阅" forState:UIControlStateNormal];
//    }
    return _subscribeBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSubviews];
    
    self.title = @"并发症";
}

- (void) layoutSubviews{
    
    [self.view addSubview:self.syndromeTableView];
}

- (void)clickBtn:(UIButton *)button
{
    if([button.titleLabel.text isEqualToString:@"订阅"])
    {
        [button setTitle:@"已订阅" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    else
    {
        [button setTitle:@"订阅" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];    }
}

#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"syndromeCell" forIndexPath:indexPath];
    
    cell.textLabel.text = @"测试";
    cell.accessoryView = self.subscribeBtn;
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

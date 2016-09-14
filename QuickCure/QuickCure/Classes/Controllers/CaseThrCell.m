//
//  CaseThrCell.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseThrCell.h"

@implementation CaseThrCell

- (instancetype)init
{
    self = [super init];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self setupUI];
    return self;
}

- (void)setupUI
{
    UILabel *label = [[UILabel alloc] init];
    label.text = @"病例照片:";
    [self.contentView addSubview:label];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setBackgroundImage:[UIImage imageNamed:@"compose_pic_add_highlighted"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickImg:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.width.offset(80);
        make.height.offset(20);
    }];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(80);
        make.left.equalTo(self.contentView).offset(30);
        make.bottom.equalTo(self.contentView).offset(-30);
        make.top.equalTo(label.mas_bottom).offset(20);
    }];
}


- (void)clickImg:(UIButton *)btn
{
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

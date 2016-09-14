//
//  CaseSecCell.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseSecCell.h"

@interface CaseSecCell ()

//@property(nonatomic,assign)NSInteger tag;

@end

@implementation CaseSecCell

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
    label.text = @"病症描述:";
    [self.contentView addSubview:label];
    
    UITextField *textField = [[UITextField alloc] init];
    textField.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:textField];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(10);
        make.width.offset(80);
        make.height.offset(20);
    }];
    
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(label.mas_bottom).offset(10);
    }];
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

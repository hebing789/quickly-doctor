//
//  CaseUpCell.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseUpCell.h"

@interface CaseUpCell ()
//@property(nonatomic,strong)UILabel *titleLB;
//@property(nonatomic,strong)UILabel *labelLB;
//@property(nonatomic,strong)UIImageView *imgv;

@end

@implementation CaseUpCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super  initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (UILabel *)titleLB
{
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
       
    }
    return _titleLB;
}

- (UILabel *)labelLB
{
    if (!_labelLB) {
        _labelLB = [[UILabel alloc] init];
    }
    return _labelLB;
}

- (UIImageView *)imgv
{
    if (!_imgv) {
        _imgv = [[UIImageView alloc] init];
    }
    return _imgv;
}




- (void)setupUI
{
    [self.contentView addSubview:self.titleLB];
    [self.contentView addSubview:self.labelLB];
    [self.contentView addSubview:self.imgv];
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.bottom.equalTo(self.contentView).offset(0);
        make.width.offset(80);
        
    }];
    [self.imgv mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.equalTo(self.contentView).offset(10);
        make.bottom.right.equalTo(self.contentView).offset(-10);
        make.width.offset(20);
        
    }];
    [self.labelLB mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.top.bottom.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.imgv).offset(-10);
        make.width.offset(80);
        
    }];
}



- (void)setModel:(CaseUpModel *)model
{
    _model = model;
    
    self.titleLB.text = model.title;
    self.labelLB.text = model.label;
    self.labelLB.textColor = [UIColor grayColor];
    self.imgv.image = [UIImage imageNamed:model.img];
    
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

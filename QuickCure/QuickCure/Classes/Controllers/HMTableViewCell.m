//
//  HMTableViewCell.m
//  QuickCure
//
//  Created by 李亚 on 9/13/16.
//  Copyright © 2016 haoge. All rights reserved.
//

#import "HMTableViewCell.h"

@interface HMTableViewCell ()

@property (nonatomic,strong)UIImageView *doctorImg;

@property (nonatomic,strong)UILabel *nameLable;

@property (nonatomic,strong)UILabel *titleLable;

@property (nonatomic,strong)UILabel *hospitalLable;

@property (nonatomic,strong)UIButton *plusBtn;

@property (nonatomic,strong)UIButton *flowerBtn;

@property (nonatomic,strong)UIButton *saveBtn;

@property (nonatomic,strong)UIImageView *imageIcon;

@property (nonatomic,strong)UILabel *pipeiLable;

@end


@implementation HMTableViewCell

-(UIImageView *)doctorImg
{
    if (!_doctorImg)
    {
        _doctorImg = [[UIImageView alloc]init];
    }
    return _doctorImg;
}

- (UILabel *)nameLable
{
    if (!_nameLable)
    {
        _nameLable = [[UILabel alloc]init];
    }
    return _nameLable;
}

- (UILabel *)titleLable
{
    if (!_titleLable)
    {
        _titleLable = [[UILabel alloc]init];
    }
    return _titleLable;
}

- (UILabel *)hospitalLable
{
    if (!_hospitalLable)
    {
        _hospitalLable = [[UILabel alloc]init];
    }
    return _hospitalLable;
}

- (UIButton *)plusBtn
{
    if (!_plusBtn)
    {
        _plusBtn = [[UIButton alloc]init];
    }
    return _plusBtn;
}

- (UIButton *)flowerBtn
{
    if (!_flowerBtn)
    {
        _flowerBtn = [[UIButton alloc]init];
    }
    return _flowerBtn;
}

- (UIButton *)saveBtn
{
    if (!_saveBtn)
    {
        _saveBtn = [[UIButton alloc]init];
    }
    return _saveBtn;
}

-(UIImageView *)imageIcon
{
    if (!_imageIcon)
    {
        _imageIcon = [[UIImageView alloc]init];
    }
    return _imageIcon;
}

-(UILabel *)pipeiLable
{
    if (!_pipeiLable) {
        _pipeiLable = [[UILabel alloc]init];
    }
    return _pipeiLable;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupHMTableViewCell];
    }
    return self;
}

- (void)setupHMTableViewCell
{
    /**
     *  加载控件
     */
    [self.contentView addSubview:self.doctorImg];
    
    [self.contentView addSubview:self.nameLable];
    
    [self.contentView addSubview:self.titleLable];
    
    [self.contentView addSubview:self.hospitalLable];
    
    [self.contentView addSubview:self.plusBtn];
    
    [self.contentView addSubview:self.flowerBtn];
    
    [self.contentView addSubview:self.saveBtn];
    
    [self.contentView addSubview:self.imageIcon];
    
    [self.imageIcon addSubview:self.pipeiLable];
    
    /**
     *  设置约束
     */
    
    [_doctorImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).offset(15);
        make.left.equalTo(self.contentView.mas_left).offset(10);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(80);
        
    }];
    
    [_nameLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.doctorImg.mas_right).offset(5);
    }];

    [_titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.nameLable.mas_right).offset(10);
    }];

    [_hospitalLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLable.mas_bottom).offset(5);
        make.left.equalTo(self.doctorImg.mas_right).offset(5);
        make.right.equalTo(self.imageIcon).offset(-100);
    }];

    [_plusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hospitalLable.mas_bottom).offset(5);
        make.left.equalTo(self.doctorImg.mas_right).offset(5);
    }];

    [_flowerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hospitalLable.mas_bottom).offset(5);
        make.left.equalTo(self.plusBtn.mas_right).offset(20);
    }];

    [_saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.hospitalLable.mas_bottom).offset(5);
        make.left.equalTo(self.flowerBtn.mas_right).offset(20);
    }];

    [_imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView).offset(-5);
        make.right.equalTo(self.contentView).offset(-30);
        make.height.mas_equalTo(70);
        make.width.mas_equalTo(50);
    }];
    
    [_pipeiLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageIcon).offset(10);
        make.left.equalTo(self.imageIcon).offset(2);
        make.right.equalTo(self.imageIcon).offset(-2);
    }];
    
}



- (void)setModel:(HMModel *)model
{
    _model = model;
    
    self.nameLable.text = model.doctor_name;
    
    self.titleLable.text = model.doctor_title_name;
    
    self.hospitalLable.text = model.hospital_name;
    
    [self.plusBtn setImage:[UIImage imageNamed:@"yuyueliang"] forState:UIControlStateNormal];
    
    [self.plusBtn setTitle:[NSString stringWithFormat:@"%d",19] forState:UIControlStateNormal];
    
    [self.plusBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateNormal];
    
    self.plusBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.flowerBtn setImage:[UIImage imageNamed:@"xianhua"] forState:UIControlStateNormal];
    
    [self.flowerBtn setTitle:[NSString stringWithFormat:@"%d",20] forState:UIControlStateNormal];
    
    [self.flowerBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateNormal];
    
    self.flowerBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    [self.saveBtn setImage:[UIImage imageNamed:@"jinqi"] forState:UIControlStateNormal];
    
    [self.saveBtn setTitle:[NSString stringWithFormat:@"%d",44] forState:UIControlStateNormal];
    
    [self.saveBtn setTitleColor:[UIColor colorWithRed:(32 * 1.0)/255 green:(197 * 1.0)/255 blue:(197*1.0) /255 alpha:1] forState:UIControlStateNormal];
    
    self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    self.imageIcon.image = [UIImage imageNamed:@"pipeidu"];
    
    self.pipeiLable.text = [NSString stringWithFormat:@"匹配度%d%%",94];
    
    self.pipeiLable.font = [UIFont systemFontOfSize:14];
    
    self.pipeiLable.textAlignment = NSTextAlignmentCenter;
    
    self.pipeiLable.textColor = [UIColor whiteColor];
    
    self.pipeiLable.numberOfLines = 0;
    
    self.doctorImg.image = [UIImage imageNamed:@"illness_img_person.png"];
    
//    NSURL *url = [NSURL URLWithString:model.doctor_portrait];
    
//    [self.doctorImg sd_setImageWithURL:url];
    
    
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

//
//  DoctorApplyCell.m
//  QuickCure
//
//  Created by ymQiao on 16/9/12.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "DoctorApplyCell.h"
#import "DoctorApplyModel.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

@interface DoctorApplyCell ()
/**
 *  病人姓名
 */
@property(nonatomic,strong) UILabel *patientLab;
/**
 *  病种
 */
@property(nonatomic,strong) UILabel *symptomLab;
/**
 *  就诊时间
 */
@property(nonatomic,strong) UILabel *timeLab;
/**
 *  医生姓名
 */
@property(nonatomic,strong) UILabel *doctorLab;
/**
 *  医生职称
 */
@property(nonatomic,strong) UILabel *roleLab;
/**
 *  医院
 */
@property(nonatomic,strong) UILabel *hospitalLab;
/**
 *  就诊状态
 */
@property(nonatomic,strong) UIButton *stateBtn;
/**
 *  分割线
 */
@property(nonatomic,strong) UIView *separate;

@end


@implementation DoctorApplyCell

- (UILabel *)patientLab
{
    if (!_patientLab) {
        _patientLab = [[UILabel alloc] init];
    }
    return _patientLab;
}

- (UILabel *)symptomLab
{
    if (!_symptomLab) {
        _symptomLab = [[UILabel alloc] init];
    }
    return _symptomLab;
}

- (UILabel *)timeLab
{
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
    }
    return _timeLab;
}

- (UILabel *)doctorLab
{
    if (!_doctorLab) {
        _doctorLab = [[UILabel alloc] init];
    }
    return _doctorLab;
}

- (UILabel *)roleLab
{
    if (!_roleLab) {
        _roleLab = [[UILabel alloc] init];
    }
    return _roleLab;
}

- (UILabel *)hospitalLab
{
    if (!_hospitalLab) {
        _hospitalLab = [[UILabel alloc] init];
    }
    return _hospitalLab;
}

- (UIButton *)stateBtn
{
    if (!_stateBtn) {
        _stateBtn = [[UIButton alloc] init];
    }
    return _stateBtn;
}

- (UIView *)separate
{
    if (!_separate) {
        _separate = [[UIView alloc] init];
    }
    return _separate;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupDoctorApplyCell];
    }
    return self;
}

- (void)setupDoctorApplyCell
{
    /**
     *  加载控件
     */
    [self.contentView addSubview:self.patientLab];
    [self.contentView addSubview:self.symptomLab];
    [self.contentView addSubview:self.timeLab];
    [self.contentView addSubview:self.doctorLab];
    [self.contentView addSubview:self.roleLab];
    [self.contentView addSubview:self.hospitalLab];
    [self.contentView addSubview:self.stateBtn];
    [self.contentView addSubview:self.separate];
    
    /**
     *  设置约束
     */
    [_patientLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(10);
    }];
    
    [_symptomLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.patientLab.mas_right).offset(10);
    }];
    
    [_timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.symptomLab.mas_right).offset(20);
    }];
    
    [_doctorLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
    [_roleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(-15);
        make.left.equalTo(self.doctorLab.mas_right).offset(10);
    }];
    
    [_hospitalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.roleLab).offset(80);
        make.bottom.equalTo(self.contentView).offset(-15);
    }];
    
    [_stateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(@60);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    
    self.stateBtn.layer.cornerRadius = 30;
    [self.stateBtn clipsToBounds];
    
    [_separate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.right.equalTo(self.stateBtn.mas_left);
        make.centerY.equalTo(self.contentView);
        make.height.equalTo(@2);
    }];
    [_separate setBackgroundColor:[UIColor lightGrayColor]];
    
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
}

- (void)setModel:(DoctorApplyModel *)model
{
    _model = model;
    
    /**
     *  进行控件数据赋值
     */
    self.patientLab.text = model.patientName;
    self.symptomLab.text = model.symptom;
    self.timeLab.text = [NSString stringWithFormat:@"就诊:%@",model.time];
    self.doctorLab.text = model.doctorName;
    self.roleLab.text = model.role;
    self.hospitalLab.text = model.hospital;
    
    [self.stateBtn setTitle:model.state forState:UIControlStateNormal];
    self.stateBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 2, 0, 2);
    [self.stateBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.stateBtn setBackgroundColor:[UIColor lightGrayColor]];
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

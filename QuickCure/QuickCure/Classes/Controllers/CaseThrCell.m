//
//  CaseThrCell.m
//  QuickCure
//
//  Created by 黄凯 on 16/9/13.
//  Copyright © 2016年 haoge. All rights reserved.
//

#import "CaseThrCell.h"

@interface CaseThrCell()
//<UINavigationControllerDelegate, UIImagePickerControllerDelegate>


@end

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
//    [btn addTarget:self action:@selector(clickImg:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    _btn.enabled=NO;
    self.btn=btn;
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

//图片更新的实现,但是更新在此位置,图片难以传值,转移到contrller
//- (void)clickImg:(UIButton *)btn
//{
//    UIImagePickerController* imgPicker=[[UIImagePickerController alloc]init];
//    imgPicker.sourceType= UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//    
//    
//    
//    imgPicker.delegate=self;
//    [[self viewController]  presentViewController:imgPicker animated:YES completion:nil];
//
//
//}
//
//-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
//{
//    
//    NSLog(@"%@",info);
//    
//    UIImage* imag=info[@"UIImagePickerControllerOriginalImage"];
//    //图片有个模糊效果
//    [self.btn setImage:imag forState:UIControlStateNormal];
//    _btn.enabled=NO;
//    
//    [[self viewController] dismissViewControllerAnimated:YES completion:nil];
//    
//    
//}
//
//
//- (UIViewController *)viewController
//{
//    //获取当前view的superView对应的控制器
//    UIResponder *next = [self nextResponder];
//    do {
//        if ([next isKindOfClass:[UIViewController class]]) {
//            return (UIViewController *)next;
//        }
//        next = [next nextResponder];
//    } while (next != nil);
//    return nil;
//    
//}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

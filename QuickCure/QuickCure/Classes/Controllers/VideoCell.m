//
//  HeadLineCell.m
//  HB网易新闻
//
//  Created by hebing on 16/9/5.
//  Copyright © 2016年 hebing. All rights reserved.
//

#import "VideoCell.h"
#import "UIImageView+WebCache.h"


@implementation VideoCell


-(void)setUrlString:(NSString *)urlString{
    self.iv_img=[[UIImageView alloc]init];
    [self.iv_img sd_setImageWithURL:[NSURL URLWithString:urlString]];
    _iv_img.frame=self.bounds;
    [self.contentView addSubview:_iv_img];
    
}
-(instancetype)initWithFrame:(CGRect)frame{
    
    return [super initWithFrame:frame];
}
@end

//
//  SLSettingTableViewCell.m
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLSettingTableViewCell.h"

@implementation SLSettingTableViewCell

//赋值
-(void)setSLSettingCell:(SLSettingCellModel *)cellModel
{
    NSString *iconImage = cellModel.iconImage;
    _iconImage.image = [UIImage imageNamed:iconImage];
    
    NSString *iconArron = cellModel.imageArron;
    _iconArron.image = [UIImage imageNamed:iconArron];
    
    _lable01.text = cellModel.lable01;
    _lable02.text = cellModel.lable02;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

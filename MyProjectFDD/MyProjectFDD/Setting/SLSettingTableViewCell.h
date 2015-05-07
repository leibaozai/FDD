//
//  SLSettingTableViewCell.h
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLSettingCellModel.h"

/**
 "设置"页面-cell
 */
@interface SLSettingTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *lable01;
@property (strong, nonatomic) IBOutlet UILabel *lable02;
@property (strong, nonatomic) IBOutlet UIImageView *iconArron;

//赋值
-(void)setSLSettingCell:(SLSettingCellModel *)cellModel;
@end

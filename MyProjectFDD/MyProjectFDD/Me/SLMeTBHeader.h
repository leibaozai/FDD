//
//  SLMeTBHeader.h
//  MyProjectFDD
//
//  Created by mac on 15-5-6.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 “我”页面tableView的表头视图控制器
 */
@interface SLMeTBHeader : UIViewController

//容器
@property (strong, nonatomic) IBOutlet UIView *headerView;

//登录
@property (strong, nonatomic) IBOutlet UIButton *loginButton;

//通话
@property (strong, nonatomic) IBOutlet UIButton *phoneButton;

//预约
@property (strong, nonatomic) IBOutlet UIButton *orderButton;

//订单
@property (strong, nonatomic) IBOutlet UIButton *indentButton;

//评价
@property (strong, nonatomic) IBOutlet UIButton *evaluateButton;



@end

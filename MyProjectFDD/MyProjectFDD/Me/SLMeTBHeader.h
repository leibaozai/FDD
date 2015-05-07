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
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *phoneButton;
@property (strong, nonatomic) IBOutlet UIButton *orderButton;
@property (strong, nonatomic) IBOutlet UIButton *indentButton;
@property (strong, nonatomic) IBOutlet UIButton *evaluateButton;



@end

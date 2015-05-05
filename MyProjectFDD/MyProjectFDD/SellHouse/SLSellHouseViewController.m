//
//  SLSellHouseViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLSellHouseViewController.h"
#import "SLUIFactory.h"


@interface SLSellHouseViewController ()

@end

@implementation SLSellHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.title = @"卖房";
    
    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_xiaoxi"] target:self action:nil];
}



@end

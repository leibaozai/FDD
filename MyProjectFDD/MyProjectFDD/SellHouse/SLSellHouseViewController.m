//
//  SLSellHouseViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLSellHouseViewController.h"
#import "SLUIFactory.h"
#import "SLStartSellHouseViewController.h"

@interface SLSellHouseViewController ()

@end

@implementation SLSellHouseViewController

- (IBAction)startSellHouse:(id)sender {
    
    SLStartSellHouseViewController *startSell = [[SLStartSellHouseViewController alloc] init];
    startSell.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:startSell animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.title = @"卖房";

    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_xiaoxi"] target:self action:nil];
}



@end

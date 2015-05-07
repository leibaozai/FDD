//
//  SLStartSellVillageNameView.m
//  MyProjectFDD
//
//  Created by mac on 15-5-7.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLStartSellVillageNameView.h"
#import "SLUIFactory.h"


@interface SLStartSellVillageNameView ()

@end

@implementation SLStartSellVillageNameView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = _titleStr;
    
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(blackViewController)];
    
    
}

//返回
-(void)blackViewController
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end

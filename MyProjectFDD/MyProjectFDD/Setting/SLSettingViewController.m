//
//  SLSettingViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLSettingViewController.h"
#import "SLUIFactory.h"
#import "SLSettingTableViewCell.h"
#import "SLSettingCellModel.h"

#import "SLValuationViewController.h"
#import "SLFindManageViewController.h"
#import "SLFindHousePriceViewController.h"


@interface SLSettingViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
    //数据源
    NSMutableArray *_dataSource;
}
@end

@implementation SLSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _dataSource = [NSMutableArray array];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.title = @"更多";
    
    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_xiaoxi"] target:self action:nil];
    
    [self initTableView];
    
    [self addDataSource];
}

#pragma mark - Helper Methods
-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 360)];
    _tableView.rowHeight = 120;
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    //NSLog(@"self.view.frame.size.width:%f",self.view.frame.size.width);
    [self.view addSubview:_tableView];
    
    //注册cell
    [_tableView registerNib:[UINib nibWithNibName:@"SLSettingTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
}

-(void)addDataSource
{
    NSArray *iconImage = @[@"home_more_icon1",
                           @"home_more_icon2",
                           @"home_more_icon3"];
    NSArray *arrLable01 = @[@"找经纪人",@"估计",@"查房价"];
    NSArray *arrLable02 = @[@"全城经纪人为您服务",@"房源价格精准评估",@"了解行情，不做任性土豪"];
    for (NSInteger i = 0; i < iconImage.count; i++) {
        SLSettingCellModel *model = [[SLSettingCellModel alloc] init];
        model.iconImage = iconImage[i];
        model.lable01 = arrLable01[i];
        model.lable02 = arrLable02[i];
        model.imageArron = @"home_more_button1";

        [_dataSource addObject:model];
    }
    [_tableView reloadData];
}

#pragma mark - Event Handlers UITableViewDelegate

//cell点击
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SLFindManageViewController *findVC = [[SLFindManageViewController alloc] init];
    SLValuationViewController *valuationVC = [[SLValuationViewController alloc] init];
    SLFindHousePriceViewController *findHouseVC = [[SLFindHousePriceViewController alloc] init];
    switch (indexPath.row) {
        case 0:
            findVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:findVC animated:YES];
            break;
        case 1:
            valuationVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:valuationVC animated:YES];
            break;
        case 2:
            findHouseVC.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:findHouseVC animated:YES];
            break;
            
        default:
            break;
    }
    
}


#pragma mark -UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SLSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    SLSettingCellModel *model = _dataSource[indexPath.row];
    [cell setSLSettingCell:model];
    
    return cell;
}


@end

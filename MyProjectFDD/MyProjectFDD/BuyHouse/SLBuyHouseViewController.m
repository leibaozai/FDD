//
//  SLBuyHouseViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLBuyHouseViewController.h"
#import "SLUIFactory.h"
#import "SLCityListTableViewController.h"
#import "SLBuyHouseSearchViewController.h"
#import "SLGlobalDefine.h"
#import "AFNetworking.h"

#import <MapKit/MapKit.h>

@interface SLBuyHouseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    //列表，地图
    UIBarButtonItem *titleBBI;
    
    //详情列表
    UITableView *_tableView;
    //UISegmentedControl *segmentControl;
    
    //地图
    MKMapView *_mapView;
    
}
@property (strong, nonatomic) IBOutlet UILabel *describeLable;
//@property (strong, nonatomic) IBOutlet UIButton *btn;
@end

@implementation SLBuyHouseViewController

#pragma mark - Lifecycle Methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    //中间的titleView
    [self initTitlView];
    
    //左，右navBar
    [self initLeftAndRightNavgationBar];
    
    //加载地图
    //[self detailMap];
}

#pragma mark - Helper Methods

//中间的titleView
-(void)initTitlView
{
    //创建uiview充当容器
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 49)];
    //titleView.backgroundColor = [UIColor lightGrayColor];
    titleView.alpha = 0.5;
    
    //创建lable
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 49)];
    titleLabel.text = @"深圳";
    titleLabel.textAlignment = NSTextAlignmentRight;
    [titleView addSubview:titleLabel];
    
    //创建图片
    UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 18, 15, 15)];
    imageV.image = [UIImage imageNamed:@"nav_xiala"];
    [titleView addSubview:imageV];
    
    //打开交互
    titleView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cityList)];
    [titleView addGestureRecognizer:tapGesture];
    
    self.navigationItem.titleView = titleView;
}

//左，右navBar
-(void)initLeftAndRightNavgationBar
{
    //左边图片
    self.navigationItem.leftBarButtonItem = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_xiaoxi"] target:self action:nil];
    
    //右边图片
    UIBarButtonItem *imageBBI = [SLUIFactory createImageBBIWithImage:[UIImage imageNamed:@"nav_sousuo"] target:self action:@selector(ImageBBIClick)];
    titleBBI = [SLUIFactory createTitleBBIWithTitle:@"列表" target:self action:@selector(titleBBIClick)];
    
    self.navigationItem.rightBarButtonItems = @[titleBBI,imageBBI];
}

#pragma mark -详情列表(tableView)
-(void)detailList
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64 - 49)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tag = 2;
    [self.view addSubview:_tableView];
    
    //添加表头
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 50)];
    
   UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"二手房", @"新房"]];
    segmentControl.frame = CGRectMake(headerView.frame.size.width/2-120, 10, 240, 30);
    segmentControl.selectedSegmentIndex = 0;
    segmentControl.backgroundColor = [UIColor whiteColor];
    segmentControl.tintColor = THEME_COLOR;
    [segmentControl addTarget:self action:@selector(tableViewChange:) forControlEvents:UIControlEventValueChanged];
    
    [headerView addSubview:segmentControl];
    
    _tableView.tableHeaderView = headerView;
    
    _tableView.autoresizesSubviews = NO;
    //注册cell
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    //数据请求
    [self requestDataFromNetWork:nil];
}

#pragma mark -数据请求
-(void)requestDataFromNetWork:(id)sender
{
    NSString *urlStr = @"http://app.sh.fangdd.com/v3.0.0/house/buyer/map_search_house_list";
    
    urlStr = SECOND_HAND_HOUSE_URL;
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"100020" forKey:@"platformVersion"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"1337" forKey:@"cityId"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"6" forKey:@"platform"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"398d64daf185c10e99d3ff84091d0dce" forKey:@"data_token"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"1" forKey:@"businessType"];

    [manager POST:urlStr parameters:@{@"data":@"F942DBC528294564D4623BFF52C18D191353AE4B3B508CDB197CAF44F7DFE1BA20A40F7FFF0AE2E224345154BEB2EAF997828FE59705D893A188E625698D01C3DB8018A5E75A886F0405A451F9EB480AF8F2EA37A5A4F74138A5F7119BDEA61D57FDA28E2B19C248908EF980CAA6B74AA157FD75F2A50B201359389D165BB9347EA57DF8038263D216CA0F635FD7003A154B78FD4F946DB68A5DF136ECE25B6B1B934BA5B10516E7D1C83AE44236BF4B0471EAC7890D34D16D6D58484C9D1A57DF838A56A1DB6CBF011E3964F2C284B198CD3F08D8E594BF053D828E74BFC626EE49368DFEB75D05D495EFEB35CF42C7D6D4F4267BDDA2FA6338925B6998ABDC33A3483FD986AEDBE9F4F47343E481FD634DD21E7FD085C359C4CC6A806B68DA8879B1A9FEEC18B7BDE36435DD4BCEF4"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//        NSLog(@"success:%@",str);
        
        //解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //NSLog(@"%@",dict[@"1"][@"str"]);
        
        NSArray *arr = dict[@"3"][@"lst"];
        NSLog(@"%@",arr[0]);
        NSLog(@"%@",arr[1]);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure:%@",error);
    }];
    
}


//详情地图
-(void)detailMap
{
    _mapView = [[MKMapView alloc] initWithFrame:CGRectMake(0, 64 + 49, self.view.frame.size.width, self.view.frame.size.height - 64 - 49)];
    _mapView.tag = 1;
    //设置初始化位置
    //经纬度
    /*
     经度范围：73°E至135°E
     纬度范围：3°N至53°N
     */
    CLLocationDegrees longitude = (73  + 135) / 2.0;
    CLLocationDegrees latitude = (3 + 53) / 2.0;
    
    longitude = 113.950052;
    latitude = 22.543357;
    
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(latitude, longitude);
    
    //设置显示范围
    MKCoordinateSpan span = MKCoordinateSpanMake(0.3, 0.2);
    
    //打包交给地图
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    
    //移动地图
    [_mapView setRegion:region animated:YES];
    
    //地图类型
    _mapView.mapType = MKMapTypeStandard;
    
    [self.view addSubview:_mapView];
}

#pragma mark -点击segmentController切换tableView
-(void)tableViewChange:(UISegmentedControl *)sender
{
    
}

//点击切换描述
- (IBAction)btnClick:(UIButton *)sender
{
   
    if ([sender.titleLabel.text isEqualToString:@"只看新房"]) {
        
        [sender setTitle:@"全部房源" forState:UIControlStateNormal];
        self.describeLable.text = @"全城共232套新房";

    }else {
        [sender setTitle:@"只看新房" forState:UIControlStateNormal];
        self.describeLable.text = @"全城共29117套二手房,232套新房";
        
    }
}

#pragma mark -搜索
-(void)ImageBBIClick
{
    SLBuyHouseSearchViewController *searchVC = [[SLBuyHouseSearchViewController alloc] init];
    
    searchVC.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:searchVC animated:YES];
}

#pragma mark -点击列表(地图)
-(void)titleBBIClick
{
    if ([titleBBI.title isEqualToString:@"列表"]) {
        titleBBI.title = @"地图";
        
        //移除地图
        [_mapView removeFromSuperview];
        [self detailList];
    }
    else{
        titleBBI.title = @"列表";
        [_tableView removeFromSuperview];
        [self detailMap];
    }
    
}

//点击深圳，出现城市列表
-(void)cityList
{
    SLCityListTableViewController *cityVC  = [[SLCityListTableViewController alloc] init];
    cityVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cityVC animated:YES];
}

#pragma mark -UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


@end

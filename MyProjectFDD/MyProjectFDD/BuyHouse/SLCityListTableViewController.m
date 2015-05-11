//
//  SLCityListTableViewController.m
//  MyProjectFDD
//
//  Created by mac on 15-5-5.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "SLCityListTableViewController.h"
#import "SLUIFactory.h"
#import "AFNetworking.h"

@interface SLCityListTableViewController ()
{
    
}
@end

@implementation SLCityListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"城市列表";
    
    //返回的BBI
//    UIBarButtonItem *blackBBI = [SLUIFactory createBackBBIWithTarget:self action:@selector(backBBIClicked:)];
//    UIBarButtonItem *spaceBBI = [SLUIFactory createSpaceBBIWithWidth:-15];
//    self.navigationItem.leftBarButtonItems = @[spaceBBI,blackBBI];
    self.navigationItem.leftBarButtonItems = [SLUIFactory createBackBBIArrayWithTarget:self action:@selector(backBBIClicked:)];
    
    
    //请求数据
    [self requestDataFromNetWork];
    
    
}

#pragma mark -请求数据(城市列表)
-(void)requestDataFromNetWork
{
    NSString *urlStr = @"http://app.sh.fangdd.com/v3.0.0/combine/region/opened_citys_with_firstword";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"100020" forKey:@"platformVersion"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"1337" forKey:@"cityId"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"6" forKey:@"platform"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"50eeefe513b19f719340e9f3b2404412" forKey:@"data_token"];
    [manager.requestSerializer.mutableHTTPRequestHeaders setValue:@"1" forKey:@"businessType"];
    
    
    [manager POST:urlStr parameters:@{@"data":@"D2B35E702203172CDD8CB562DD0A0B0719A2A982A3E4AC86C0810D23FBD0B99E"} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"success:%@",str);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure:%@",error);
    }];
}


#pragma mark - Event Handlers
-(void)backBBIClicked:(id)sender
{
    // 返回
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

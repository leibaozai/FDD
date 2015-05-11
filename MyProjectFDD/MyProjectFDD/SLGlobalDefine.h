//
//  SLGlobalDefine.h
//  MyProjectFDD
//
//  Created by mac on 15-5-4.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#ifndef MyProjectFDD_SLGlobalDefine_h
#define MyProjectFDD_SLGlobalDefine_h

/**
 定义了屏幕的宽高的宏
 */
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

/**
 主题颜色
 */
#define THEME_COLOR ([UIColor colorWithRed:225/255.0f green:73/255.0f blue:0/255.0f alpha:1.0f])

/**
 地图——列表切换：——>二手房（POST）
 */
#define SECOND_HAND_HOUSE_URL @"http://app.sh.fangdd.com/v3.0.0/house/buyer/map_search_house_list"

/**
 地图——列表切换：——>新房（POST）
 */
#define NEW_HOUSE_URL @"http://buyer-api.nh.fangdd.com/xf/Building/search?protocol=json"

/**
 更多——找经纪人——>附近（POST）
 */
#define FINDMANAGE_NEARBY @"http://app.sh.fangdd.com/v3.0.0/house/buyer/get_classified_condition"

/**
 更多——找经纪人——>经纪公司（POST）
 */
#define FINDMANAGE_BROKERAGE_FIRM @" http://app.sh.fangdd.com/v3.0.0/combine/agent/get_intermediary_list"


#endif

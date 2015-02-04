//
//  RouterAddressInfo.h
//  RouterAddressDemo
//
//  Created by traximus on 14-7-8.
//  Copyright (c) 2014年 netcoretec. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RouterAddressInfo : NSObject


/*1. get local router information
     - local ip, gateway, netmask, broadcast address, interface, etc.(IPV4 address)
     - when using cellular network, I'm only sure that the ip address is correct,
       and I can not confirm other informations
 */
+(NSMutableDictionary *)getRouterInfo;


//2. get current WiFi information - SSID，MAC,etc.
+(void)displayCurrentWiFiInfotmation;

@end

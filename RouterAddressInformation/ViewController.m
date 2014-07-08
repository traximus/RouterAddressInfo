//
//  ViewController.m
//  RouterAddressInformation
//
//  Created by traximus on 14-7-8.
//  Copyright (c) 2014年 netcoretec. All rights reserved.
//

#import "ViewController.h"

//test
#import "RouterAddressInfo.h"





@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *localAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *netmaskLabel;
@property (weak, nonatomic) IBOutlet UILabel *interfaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *gatewayLabel;
@property (weak, nonatomic) IBOutlet UILabel *broadcastLabel;
@end







@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //test
    [self test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







#pragma mark -
#pragma mark - custom methods
-(void)test
{
    //1. get router information
    NSMutableDictionary *routerInfo = [RouterAddressInfo getRouterInfo];
    NSLog(@"router info: %@",routerInfo);
    
    _localAddressLabel.text = [_localAddressLabel.text stringByAppendingString:[routerInfo objectForKey:@"local"]];
    _gatewayLabel.text = [_gatewayLabel.text stringByAppendingString:[routerInfo objectForKey:@"gateway"]];
    _broadcastLabel.text = [_broadcastLabel.text stringByAppendingString:[routerInfo objectForKey:@"broadcast"]];
    _netmaskLabel.text = [_netmaskLabel.text stringByAppendingString:[routerInfo objectForKey:@"netmask"]];
    _interfaceLabel.text = [_interfaceLabel.text stringByAppendingString:[routerInfo objectForKey:@"interface"]];
    
    
    //2. current wifi information
    [RouterAddressInfo displayCurrentWiFiInfotmation];
}
@end

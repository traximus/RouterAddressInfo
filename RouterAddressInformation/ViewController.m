//
//  ViewController.m
//  RouterAddressInformation
//
//  Created by traximus on 14-7-8.
//  Copyright (c) 2014年 traximus. All rights reserved.
//

#import "ViewController.h"

//test
#import "RouterAddressInfo.h"





@interface ViewController (){
    NSMutableDictionary *routerInfo;
}
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *localAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *netmaskLabel;
@property (weak, nonatomic) IBOutlet UILabel *interfaceLabel;
@property (weak, nonatomic) IBOutlet UILabel *gatewayLabel;
@property (weak, nonatomic) IBOutlet UILabel *broadcastLabel;

@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
- (IBAction)typeBtnPressed:(id)sender;

@end







@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
#if TARGET_IPHONE_SIMULATOR
    _typeBtn.enabled = NO;
#else
    _typeBtn.enabled = YES;
#endif
    
    
    
    //1. get router information
    [self getRouterInfo];
    
    //2. current wifi information
    [RouterAddressInfo displayCurrentWiFiInfotmation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}







#pragma mark -
#pragma mark - custom methods

//1. get router information
-(void)getRouterInfo
{
    routerInfo = [RouterAddressInfo getRouterInfo];
    NSLog(@"router info: %@",routerInfo);
    
    NSMutableDictionary *addressInfoT = [routerInfo objectForKey:kTypeInfoKeyWifi];
    if (addressInfoT) {
        NSLog(@"addressInfo:%@",addressInfoT);
        [self showAddressInfo:addressInfoT];
    }
    else{
        addressInfoT = [routerInfo objectForKey:kTypeInfoKeyCellular];
        if (addressInfoT) {
            [self showAddressInfo:addressInfoT];
        }
    }
}

// display address information
-(void)showAddressInfo:(NSMutableDictionary *)addressInfo
{
#if TARGET_IPHONE_SIMULATOR
    _typeLabel.text          = [@"Type       :  " stringByAppendingString:@"simulator"];
#else
    _typeLabel.text          = [@"Type       :  " stringByAppendingString:[addressInfo objectForKey:@"type"]];
#endif
    NSString *btnTitle = [[addressInfo objectForKey:@"type"] isEqualToString:kTypeInfoKeyWifi]?kTypeInfoKeyCellular:kTypeInfoKeyWifi;
    [_typeBtn setTitle:btnTitle forState:UIControlStateNormal];
    _localAddressLabel.text  = [@"local IP   :  " stringByAppendingString:[addressInfo objectForKey:@"local"]];
    _gatewayLabel.text       = [@"gateway  :  " stringByAppendingString:[addressInfo objectForKey:@"gateway"]];
    _broadcastLabel.text     = [@"broadcast:  " stringByAppendingString:[addressInfo objectForKey:@"broadcast"]];
    _netmaskLabel.text       = [@"netmask :  " stringByAppendingString:[addressInfo objectForKey:@"netmask"]];
    _interfaceLabel.text     = [@"interface :  " stringByAppendingString:[addressInfo objectForKey:@"interface"]];
    
}

- (IBAction)typeBtnPressed:(id)sender {
    
    //1) change typeBtn title
    NSMutableDictionary *addressInfoT;
    if ([_typeBtn.titleLabel.text isEqualToString:@"wifi"]) {
        addressInfoT = [routerInfo objectForKey:kTypeInfoKeyWifi];
        NSLog(@"cellular->wifi:%@",addressInfoT);
    }
    else{
        addressInfoT = [routerInfo objectForKey:kTypeInfoKeyCellular];
        NSLog(@"wifi->cellular:%@",addressInfoT);
    }
    
    //2) change information
    if (addressInfoT) {
        [self showAddressInfo:addressInfoT];
    }
}
@end

RouterAddressInfo
=================

get and display current router information


----

##how to use
   
####//1. get router information
```
    NSMutableDictionary *routerInfo = [RouterAddressInfo getRouterInfo];
    NSLog(@"router info: %@",routerInfo);
```

####    //2. current wifi information
```
    [RouterAddressInfo displayCurrentWiFiInfotmation];
```
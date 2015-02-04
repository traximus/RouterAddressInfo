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

-----------------
##Note
Note that `inet_ntoa` works only with **IPv4 addresses**. If you are in a **IPv6** network, you have to use `inet_ntop` or better `getnameinfo` - advice from here [stackoverflow](http://stackoverflow.com/questions/15693556/how-to-get-the-cellular-ip-address-in-ios-app)


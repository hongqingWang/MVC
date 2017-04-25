//
//  HQNetworkTools.m
//  AFN
//
//  Created by 王红庆 on 16/9/23.
//  Copyright © 2016年 王红庆. All rights reserved.
//

#import "HQNetworkTools.h"

#define BASE_URL        @"http://c.m.163.com/"

@implementation HQNetworkTools

+ (instancetype)sharedTools {
    
    static HQNetworkTools *tools;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseURL = [NSURL URLWithString:BASE_URL];
        tools = [[self alloc] initWithBaseURL:baseURL];
        
//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [tools reachability];
        tools.requestSerializer = [AFJSONRequestSerializer serializer];
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
    });
    return tools;
}

#pragma mark - 检测网络情况
- (void)reachability {
    
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        // 当网络状态改变了, 就会调用这个block
        switch (status) {
            case AFNetworkReachabilityStatusUnknown: // 未知网络
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable: // 没有网络(断网)
                NSLog(@"没有网络(断网)");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                NSLog(@"手机自带网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi: // WIFI
                NSLog(@"WIFI");
                //                [MBProgressHUD showText:@"wifi"];
                break;
        }
    }];
    // 3.开始监控
    [mgr startMonitoring];
}

- (void)request:(HQRequestMethod)method urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id result, NSError *error))finished {
    
    if (method == GET) {
        
        [self GET:urlString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            finished(nil, error);
        }];
        
    } else {
        
        [self POST:urlString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finished(nil, error);
        }];
    }
}

@end

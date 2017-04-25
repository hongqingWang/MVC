//
//  HQNetworkTools.h
//  AFN
//
//  Created by 王红庆 on 16/9/23.
//  Copyright © 2016年 王红庆. All rights reserved.
//

#import "AFNetworking.h"

typedef enum : NSUInteger {
    GET,
    POST,
} HQRequestMethod;

@interface HQNetworkTools : AFHTTPSessionManager

+ (instancetype)sharedTools;

- (void)request:(HQRequestMethod)method urlString:(NSString *)urlString parameters:(id)parameters finished:(void (^)(id result, NSError *error))finished;

@end

//
//  HQModel.m
//  MVC
//
//  Created by 王红庆 on 2017/4/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

#import "HQModel.h"
#import "HQNetworkTools.h"
#import "MJExtension.h"

@implementation HQModel

+ (void)modelWithSuccess:(void (^)(NSArray *))success error:(void (^)())error {
    
    /**
     * http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html
     */
    NSString *urlString = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-10.html";
    [[HQNetworkTools sharedTools] request:GET urlString:urlString parameters:nil finished:^(id result, NSError *error) {
        if (error) {
            
            NSLog(@"%@", error);
            return;
        }
        NSLog(@"%@", result[@"T1348647853363"]);
        NSArray *dataArr = [HQModel mj_objectArrayWithKeyValuesArray:result[@"T1348647853363"]];
        success(dataArr);
    }];
}

@end

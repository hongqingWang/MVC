//
//  HQModel.h
//  MVC
//
//  Created by 王红庆 on 2017/4/25.
//  Copyright © 2017年 王红庆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQModel : NSObject

/** 新闻主标题 */
@property (nonatomic, copy) NSString *title;
/** 新闻摘要 */
@property (nonatomic, copy) NSString *digest;
/** 新闻图片地址 */
@property (nonatomic, copy) NSString *imgsrc;

/** 加载数据 */
+ (void)modelWithSuccess:(void(^)(NSArray *array))success error:(void(^)())error;

@end

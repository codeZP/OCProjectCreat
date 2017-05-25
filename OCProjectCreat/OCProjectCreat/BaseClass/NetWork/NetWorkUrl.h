//
//  NetWorkUrl.h
//  OCProjectCreat
//
//  Created by yueru on 2017/5/10.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetWorkUrl : NSObject

/**
 单例
 */
+ (instancetype)sharedNetWorkUrl;

/**
 得到基础的url
 */
- (NSString *)getBaseUrl;

@end

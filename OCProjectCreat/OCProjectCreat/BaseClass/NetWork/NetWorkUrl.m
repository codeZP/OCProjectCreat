//
//  NetWorkUrl.m
//  OCProjectCreat
//
//  Created by yueru on 2017/5/10.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import "NetWorkUrl.h"

@interface NetWorkUrl()
/** 基本的url */
@property (nonatomic, strong) NSString *baseUrl;
@end

@implementation NetWorkUrl

static id _instace = nil;

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super allocWithZone:zone];
    });
    return _instace;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instace = [super init];
    });
    return _instace;
}

+ (instancetype)sharedNetWorkUrl {
    return [[self alloc] init];
}

- (NSString *)getBaseUrl {
    return self.baseUrl;
}

@end

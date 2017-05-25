//
//  NetWorkAPI.m
//  OCProjectCreat
//
//  Created by yueru on 2017/5/10.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import "NetWorkAPI.h"
#import <AFNetworking.h>

@implementation NetWorkAPI

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

+ (instancetype)sharedNetWorkAPI {
    return [[self alloc] init];
}







#pragma mark - 定义基本的网络请求
// post请求
- (nullable NSURLSessionDataTask *)postWithUrl: (nonnull NSString *)url parameters: (nullable id)parameters success:(void (^)(_Nullable id))success failure:(void (^)(NSError * _Nullable ))failure {
    // 显示网络请求标示
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // 创建一个请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    return [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
// get请求
- (nullable NSURLSessionDataTask *)getWithUrl: (nonnull NSString *)url parameters: (nullable id)parameters success:(void (^)(_Nullable id))success failure:(void (^)(NSError * _Nullable ))failure {
    // 显示网络请求标示
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    // 创建一个请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/json"];
    return [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}
// 证书
- (AFSecurityPolicy *)customSecurityPolity {
    // 先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"api.m.yueru.com" ofType:@"cre"]; // 证书路径
    NSData *cretData = [NSData dataWithContentsOfFile:cerPath];
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = YES;
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = NO;
    securityPolicy.pinnedCertificates = [NSSet setWithObjects:cretData, nil];
    return securityPolicy;
}

@end

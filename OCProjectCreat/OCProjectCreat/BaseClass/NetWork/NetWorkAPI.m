//
//  NetWorkAPI.m
//  OCProjectCreat
//
//  Created by yueru on 2017/5/10.
//  Copyright © 2017年 赵攀. All rights reserved.
//

#import "NetWorkAPI.h"

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
//private func post(URL: String, parameters: Any?, success:((Any) -> Void)?, failure:((Error) -> Void)?) -> URLSessionDataTask? {
//    
//    var dict = parameters as? [String : AnyObject]
//    if dict != nil { // 如果传过来的参数是有值的 则添加一个key
//        dict!["yropenid"] = yropenid! as AnyObject
//    }else { // 如果传过来的参数无值 则创建地点
//        dict = ["yropenid" : yropenid! as AnyObject]
//    }
//    //显示网络请求标志
//    UIApplication.shared.isNetworkActivityIndicatorVisible = true
//    //创建一个请求管理者
//    let manager = AFHTTPSessionManager()
//    manager.requestSerializer = AFHTTPRequestSerializer()
//    // 获得版本号
//    let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String
//    // 正式的
//    //        manager.requestSerializer.setValue("YueRu-iOS/(\(version!))", forHTTPHeaderField: "User-Agent")
//    // 测试
//    manager.requestSerializer.setValue("YueRu-iOS/(\(version!)) YueRu-UAT", forHTTPHeaderField: "User-Agent")
//    if !isSendPhone {
//        //设置返回数据的种类
//        let set = NSSet(object: "application/json")
//        manager.responseSerializer.acceptableContentTypes = set as? Set<String>
//    }else {
//        manager.responseSerializer = AFHTTPResponseSerializer()
//    }
//    //设置超时时间
//    manager.requestSerializer.timeoutInterval = 30.0
//    manager.securityPolicy = customSecurityPolicy()
//    
//    return manager.post(URL, parameters: dict, progress: nil, success: { (_, responseObject) in
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        success!(responseObject as Any)
//    }) { (_, error) in
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        failure!(error)
//    }
//    
//}
//
//private func customSecurityPolicy() -> AFSecurityPolicy {
//    // /先导入证书
//    let cerPath = Bundle.main.path(forResource: "api.m.yueru.com", ofType: "cer") //证书的路径
//    let certData = NSData(contentsOfFile: cerPath!)
//    
//    // AFSSLPinningModeCertificate 使用证书验证模式
//    let securityPolicy = AFSecurityPolicy(pinningMode: .certificate)
//    
//    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
//    // 如果是需要验证自建证书，需要设置为YES
//    securityPolicy.allowInvalidCertificates = true
//    
//    //validatesDomainName 是否需要验证域名，默认为YES；
//    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
//    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
//    //如置为NO，建议自己添加对应域名的校验逻辑。
//    securityPolicy.validatesDomainName = false
//    
//    securityPolicy.pinnedCertificates = [certData! as Data]
//    
//    return securityPolicy;
//}

@end

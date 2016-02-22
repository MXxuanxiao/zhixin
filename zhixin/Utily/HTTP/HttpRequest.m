//
//  HttpRequest.m
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import "HttpRequest.h"
#import <AFNetworking.h>
@implementation HttpRequest
+ (void) request:(NSString *)url data:(NSDictionary *)data successBlock:(void(^)(id data))successBlock failureBlock:(void(^)(id error))failureBlock {
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:SF2(@"%@%@", url_rootUrl, url) parameters:data progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%lld",uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failureBlock(error.localizedDescription);
    }];
}
@end

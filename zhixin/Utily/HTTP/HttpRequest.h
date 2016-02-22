//
//  HttpRequest.h
//  zhixin
//
//  Created by yuxuezhi on 16/1/22.
//  Copyright © 2016年 MX. All rights reserved.
//

#import <Foundation/Foundation.h>

//请求接口
#define url_rootUrl @""



@interface HttpRequest : NSObject
/**网络请求*/
+ (void) request:(NSString *)url data:(NSDictionary *)data successBlock:(void(^)(id data))successBlock failureBlock:(void(^)(id error))failureBlock;
@end

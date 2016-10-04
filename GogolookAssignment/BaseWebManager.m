//
//  BaseWebManager.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "BaseWebManager.h"
#import "AFNetworking.h"

NSString *baseURLString = @"http://data.taipei/opendata/datalist";

@implementation BaseWebManager

-(void)doGETWithAPI:(NSString *)api
         parameters:(NSDictionary *)parameters
       successBlock:(void (^)(NSDictionary *responsedData))successBlock
       failureBlock:(void (^)(NSError *error))failureBlock{

    AFHTTPSessionManager *sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
    [sessionManager GET:api parameters:parameters
               progress:^(NSProgress * _Nonnull downloadProgress) {
                   
               } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                   NSLog(@"%@",responseObject);
                   successBlock([self commonParser:responseObject]);
               } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                   failureBlock(error);
                   NSLog(@"%@",error);
               }];
}

-(NSDictionary *) commonParser:(NSDictionary *)JSONDictionary{
    return [JSONDictionary objectForKey:@"result"];
}

@end

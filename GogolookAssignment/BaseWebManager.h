//
//  BaseWebManager.h
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseWebManager : NSObject

-(void)doGETWithAPI:(NSString *)api
         parameters:(NSDictionary *)parameters
       successBlock:(void (^)(NSDictionary *responsedData))successBlock
       failureBlock:(void (^)(NSError *error))failureBlock;

@end

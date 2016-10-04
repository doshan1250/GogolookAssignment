//
//  WebManager.h
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseWebManager.h"
@protocol IWeb <NSObject>

- (void) doRequestTravelDataWithSuccessBlock:(void (^)(bool hasMore, NSInteger offset, NSDictionary *result))successBlock
                                failureBlock:(void (^)(NSError *error))failureBlock;

- (void) doRequestTravelDataWithKey:(NSString *)keyword
                       SuccessBlock:(void (^)(bool hasMore, NSInteger offset, NSDictionary *result))successBlock
                       failureBlock:(void (^)(NSError *error))failureBlock;

@end

@interface WebManager : BaseWebManager<IWeb>

@end

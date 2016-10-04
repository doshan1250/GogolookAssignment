//
//  WebManager.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "WebManager.h"
#import "TravelData.h"
#import "TravelItem.h"
@implementation WebManager

- (void) doRequestTravelDataWithLimit:(NSInteger)limit
                               offset:(NSInteger)offset
                         SuccessBlock:(void (^)(bool hasMore, NSInteger offset, NSArray *resultArray))successBlock
                         failureBlock:(void (^)(NSError *error))failureBlock {
    
    
    [self doGETWithAPI:@"apiAccess"
            parameters:@{@"scope":@"resourceAquire",
                         @"rid":@"36847f3f-deff-4183-a5bb-800737591de5",
                         @"limit":@(limit),
                         @"offset":@(offset)}
          successBlock:^(NSDictionary *responsedData) {
              
              NSMutableArray *resultsArray = [NSMutableArray new];
              NSArray *jsonDataArray = responsedData[@"results"];
              
              for (NSDictionary *dataDictionary in jsonDataArray) {
                  TravelData *data = [[TravelData alloc] initWithDictionary:dataDictionary];
                  [resultsArray addObject:data];
              }
              
              successBlock((offset < [responsedData[@"count"] integerValue]),offset+jsonDataArray.count,resultsArray);
              
          } failureBlock:^(NSError *error) {
              
          }];

}
@end

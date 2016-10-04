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

- (void) doRequestTravelDataWithSuccessBlock:(void (^)(bool hasMore, NSInteger offset, NSDictionary *result))successBlock
                                failureBlock:(void (^)(NSError *error))failureBlock{
    [self doRequestTravelDataWithLimit:-1 offset:-1 key:nil SuccessBlock:successBlock failureBlock:failureBlock];
}

- (void) doRequestTravelDataWithKey:(NSString *)keyword
                       SuccessBlock:(void (^)(bool hasMore, NSInteger offset, NSDictionary *result))successBlock
                       failureBlock:(void (^)(NSError *error))failureBlock{
    [self doRequestTravelDataWithLimit:-1 offset:-1 key:keyword SuccessBlock:successBlock failureBlock:failureBlock];
}

- (void) doRequestTravelDataWithLimit:(NSInteger)limit
                               offset:(NSInteger)offset
                                  key:(NSString *)keyword
                         SuccessBlock:(void (^)(bool hasMore, NSInteger offset, NSDictionary *result))successBlock
                         failureBlock:(void (^)(NSError *error))failureBlock {
    
    NSMutableDictionary *parameter = [NSMutableDictionary new];
    [parameter setValue:@"resourceAquire" forKey:@"scope"];
    [parameter setValue:@"36847f3f-deff-4183-a5bb-800737591de5" forKey:@"rid"];
    
    // 分頁機制不適用於此assignment
    if (limit > 0) {
        [parameter setValue:@(limit) forKey:@"limit"];
        [parameter setValue:@(offset) forKey:@"offset"];
    }
    if (keyword != nil) {
        [parameter setValue:keyword forKey:@"q"];
    }
 
    [self doGETWithAPI:@"apiAccess"
            parameters:parameter
          successBlock:^(NSDictionary *responsedData) {
              
              // 直接對全部的資料進行分類
              NSMutableDictionary *resultDictionary = [NSMutableDictionary new];
              NSArray *jsonDataArray = responsedData[@"results"];
              NSArray *categories = [jsonDataArray valueForKeyPath:@"@distinctUnionOfObjects.CAT2"];
              for (NSString *category in categories) {
                  NSPredicate *bPredicate = [NSPredicate predicateWithFormat:@"SELF.CAT2 contains[cd] %@",category];
                  NSArray *jsonDataInCategory = [jsonDataArray filteredArrayUsingPredicate:bPredicate];
                  NSMutableArray *dataModelInCategory = [NSMutableArray new];
                  for (NSDictionary *dataDictionary in jsonDataInCategory) {
                      TravelData *data = [[TravelData alloc] initWithDictionary:dataDictionary];
                      [dataModelInCategory addObject:data];
                  }
                  [resultDictionary setObject:dataModelInCategory forKey:category];
              }
              
              successBlock((offset < [responsedData[@"count"] integerValue]),offset+jsonDataArray.count,resultDictionary);
              
          } failureBlock:^(NSError *error) {
              //TODO:
          }];
}
@end

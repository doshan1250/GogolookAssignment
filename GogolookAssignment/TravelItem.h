//
//  TravelItem.h
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TravelData;

@interface TravelItem : NSObject

- (void) setDataDictionary:(NSDictionary <NSString *,NSArray<TravelData *> *> *)dataDictionary;

- (void) setFilterKey:(NSString *)key;

- (void) clearFilter;

- (NSDictionary *) getDataDictionary;

- (NSArray *) getAllCategories;
@end

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

/**
 Data getter for viewModel or ViewController, this data will filter by filterKey if it was set
 
 @return data
 */
- (NSDictionary <NSString *,NSArray<TravelData *> *> *) getDataDictionary;

/**
 Categories getter, this method include "all" category
 
 @return categories
 */
- (NSArray *) getAllCategories;
@end

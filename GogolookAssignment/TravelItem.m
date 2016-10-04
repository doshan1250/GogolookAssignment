//
//  TravelItem.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "TravelItem.h"
@interface TravelItem ()

@property (nonatomic,assign) BOOL hasMore;
@property (nonatomic,assign) NSInteger offset;
@property (nonatomic,strong) NSDictionary <NSString *,NSArray<TravelData *> *> *travelDataDictionary;
@property (nonatomic, nonnull,strong) NSString *filterKey;
@end
@implementation TravelItem
-(instancetype)init{
    self = [super init];
    if (self) {
        self.hasMore = true;
        self.offset = 0;
        self.travelDataDictionary = [NSMutableDictionary new];
    }
    return self;
}

- (void) setDataDictionary:(NSDictionary <NSString *,NSArray<TravelData *> *> *)dataDictionary{
    _travelDataDictionary = dataDictionary;
}

- (void) setFilterKey:(NSString *)key{
    _filterKey = key;
}
- (void) clearFilter{
    self.filterKey = nil;
}
- (NSDictionary *) getDataDictionary {
    if ([self.travelDataDictionary.allKeys containsObject:self.filterKey]) {
        return @{self.filterKey:[self.travelDataDictionary objectForKey:self.filterKey]};
    }
    return self.travelDataDictionary;
}
- (NSArray *) getAllCategories{
    NSMutableArray *allCategories = [NSMutableArray arrayWithArray:self.travelDataDictionary.allKeys];
    [allCategories insertObject:@"all" atIndex:0];
    return allCategories;
}
@end

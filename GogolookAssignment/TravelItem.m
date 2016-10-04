//
//  TravelItem.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "TravelItem.h"

@implementation TravelItem
-(instancetype)init{
    self = [super init];
    if (self) {
        self.hasMore = true;
        self.offset = 0;
        self.travelDataArray = [NSMutableArray new];
    }
    return self;
}
@end

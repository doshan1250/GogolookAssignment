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

@property (nonatomic,assign) BOOL hasMore;
@property (nonatomic,assign) NSInteger offset;
@property (nonatomic,strong) NSMutableArray <TravelData *>*travelDataArray;

@end

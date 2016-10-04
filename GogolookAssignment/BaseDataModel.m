//
//  BaseDataModel.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "BaseDataModel.h"
#import <objc/runtime.h>
@implementation BaseDataModel
- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        unsigned int outCount, i;
        objc_property_t *properties = class_copyPropertyList([self class], &outCount);
        for (i = 0; i < outCount; i++) {
            objc_property_t property = properties[i];
            NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSMacOSRomanStringEncoding];
            [self setValue:[self getValueWithDictionary:dictionary Key:propertyName] forKey:(NSString *)propertyName];
        }
        free(properties);
    }
    return self;
}

-(id) getValueWithDictionary:(NSDictionary *)dictionary
                         Key:(NSString *)key {
    return [dictionary objectForKey:key];
}

@end

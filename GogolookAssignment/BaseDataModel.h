//
//  BaseDataModel.h
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDataModel : NSObject

/**
 init method, this method will automatically fill the json value in the same name property
 
 @param dictionary JSON data
 
 @return self
 */
- (id)initWithDictionary:(NSDictionary *)dictionary;

/**
 Override this method for customizing parser
 
 @param dictionary JSON data
 
 @param key specific key
 
 @return customizing value
 */
- (id)getValueWithDictionary:(NSDictionary *)dictionary
                         Key:(NSString *)key;

@end

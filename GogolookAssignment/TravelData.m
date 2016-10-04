//
//  TravelData.m
//  GogolookAssignment
//
//  Created by Rick Chuang on 2016/10/4.
//  Copyright © 2016年 Rick Chuang. All rights reserved.
//

#import "TravelData.h"

@implementation TravelData

- (id)getValueWithDictionary:(NSDictionary *)dictionary
                         Key:(NSString *)key{
    if ([key isEqualToString:@"file"]) {
        NSString *dirtyString = dictionary[@"file"];
        NSArray *array = [dirtyString componentsSeparatedByString:@"http://"];
        NSString *fileURLString = @"";
        for (NSString *separatedString in array) {
            fileURLString = [NSString stringWithFormat:@"http://%@",separatedString];
            if ([self validateUrl:fileURLString]) {
                return fileURLString;
            }
        }
    }
    return [super getValueWithDictionary:dictionary Key:key];
}

- (BOOL) validateUrl: (NSString *) candidate {
    NSString *urlRegEx =
    @"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:candidate];
}

@end

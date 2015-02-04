//
//  HTTPRequestParameters.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "HTTPRequestParameters.h"

@implementation HTTPRequestParameters

/**
 * This method is a stub.
 * The class shouls conform to MTLJSONSerializing so that subclasses should conform too.
 */
+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{};
}

- (NSDictionary *)dictionary
{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [[MTLJSONAdapter JSONDictionaryFromModel:self] enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
         if ([obj isEqual:[NSNull null]] == NO)
             dictionary[key] = obj;
     }];
    
    return dictionary;
}

@end

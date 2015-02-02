//
//  Course.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "Course.h"

@implementation Course

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{NSStringFromSelector(@selector(identifier)) : @"id",
             NSStringFromSelector(@selector(beginDate)) : @"begin_date",
             NSStringFromSelector(@selector(endDate)) : @"end_date",
             NSStringFromSelector(@selector(title)) : @"title",
             NSStringFromSelector(@selector(htmlDescription)) : @"description",
             NSStringFromSelector(@selector(introdution)) : @"introdution",
             NSStringFromSelector(@selector(summary)) : @"summary",
             NSStringFromSelector(@selector(languages)) : @"language"};;
}

@end

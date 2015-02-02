//
//  Courses.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "Course.h"
#import "Courses.h"

@implementation Courses

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{NSStringFromSelector(@selector(courses)) : @"courses"};
}

+ (NSValueTransformer *)coursesJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[Course class]];
}

@end

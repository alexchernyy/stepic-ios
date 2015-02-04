//
//  ImageRequest+Factory.m
//  Stepic
//
//  Created by Александр Черный on 04/02/15.
//  Copyright (c) 2015 Alexander Chernyy. All rights reserved.
//

#import "Course.h"
#import "ImageRequest.h"
#import "ImageRequest+Factory.h"

@implementation ImageRequest (Factory)

+ (instancetype)requestImageNamed:(NSString *)name
{
    return [ImageRequest requestWithImagePath:name];
}

+ (instancetype)requestCourseCover:(Course *)course
{
    return [ImageRequest requestWithImagePath:course.cover];
}

@end

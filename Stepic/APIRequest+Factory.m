//
//  APIRequest+Factory.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "APIRequest.h"
#import "APIRequest+Factory.h"
#import "Courses.h"

@implementation APIRequest (Factory)

+ (instancetype)requestOfCourses
{
    return [APIRequest requestWithPath:@"courses" parameters:nil responseClass:[Courses class]];
}

@end

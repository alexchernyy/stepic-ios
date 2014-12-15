//
//  APIRequest.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "APIRequest.h"

@implementation APIRequest

+ (instancetype)requestWithPath:(NSString *)path parameters:(HTTPRequestParameters *)parameters responseClass:(Class)class
{
    return [[self alloc] initWithPath:path parameters:parameters responseClass:class];
}

- (instancetype)initWithPath:(NSString *)path parameters:(HTTPRequestParameters *)parameters responseClass:(Class)class
{
    self = [super initWithMethod:kHTTPRequestMethodGET path:path parameters:parameters];
    
    if (self)
    {
        self.responseClass = class;
    }
    
    return self;
}

@end

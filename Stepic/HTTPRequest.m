//
//  HTTPRequest.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "HTTPRequest.h"

NSString * const kHTTPRequestMethodGET = @"GET";
NSString * const kHTTPRequestMethodPOST = @"POST";

@implementation HTTPRequest

+ (instancetype)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(HTTPRequestParameters *)parameters
{
    return [[self alloc] initWithMethod:method path:path parameters:parameters];
}

- (instancetype)initWithMethod:(NSString *)method path:(NSString *)path parameters:(HTTPRequestParameters *)parameters
{
    self = [super init];
    
    if (self)
    {
        _method = method;
        _path = path;
        _parameters = parameters;
    }
    
    return self;
}

@end

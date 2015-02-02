//
//  HTTPRequest.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "HTTPRequestParameters.h"

extern NSString * const kHTTPRequestMethodGET;
extern NSString * const kHTTPRequestMethodPOST;

@interface HTTPRequest : MTLModel

@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSString *path;
@property (nonatomic, copy) HTTPRequestParameters *parameters;
@property (nonatomic, assign) NSTimeInterval timeoutInterval;

+ (instancetype)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(HTTPRequestParameters *)parameters;

- (instancetype)initWithMethod:(NSString *)method path:(NSString *)path parameters:(HTTPRequestParameters *)parameters;

@end

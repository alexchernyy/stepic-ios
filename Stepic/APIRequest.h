//
//  APIRequest.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"

@interface APIRequest : HTTPRequest

@property (nonatomic, strong) Class responseClass;

+ (instancetype)requestWithPath:(NSString *)path parameters:(HTTPRequestParameters *)parameters responseClass:(Class)class;

- (instancetype)initWithPath:(NSString *)path parameters:(HTTPRequestParameters *)parameters responseClass:(Class)class;

@end

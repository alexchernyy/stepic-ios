//
//  HTTPRequestOperationManager.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>

typedef void (^HTTPRequestSucessBlock)(AFHTTPRequestOperation *operation, id responseObject);
typedef void (^HTTPRequestFailureBlock)(AFHTTPRequestOperation *operation, NSError *error);

@class HTTPRequest;
@class HTTPRequestOperation;

@interface HTTPRequestOperationManager : AFHTTPRequestOperationManager

- (instancetype)initWithBaseURL:(NSURL *)url;

- (HTTPRequestOperation *)fetchRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure;

- (HTTPRequestOperation *)operationWithRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure;

/**
 * Base method is overriden because we want to use 
 * HTTPRequestOperation instead of AFHTTPRequestOperation
 */
- (AFHTTPRequestOperation *)HTTPRequestOperationWithRequest:(NSURLRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure;

@end

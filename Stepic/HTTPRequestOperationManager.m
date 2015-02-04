//
//  HTTPRequestOperationManager.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIRequest.h"
#import "APIResponseSerializer.h"
#import "HTTPRequest.h"
#import "HTTPRequestOperation.h"
#import "HTTPRequestOperationManager.h"
#import "ImageRequest.h"

@implementation HTTPRequestOperationManager

- (instancetype)initWithBaseURL:(NSURL *)url
{
    self = [super initWithBaseURL:url];
    
    if (self)
    {
        self.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.reachabilityManager startMonitoring];
    }
    
    return self;
}

- (void)dealloc
{
    [self.reachabilityManager stopMonitoring];
}

#pragma mark -

- (HTTPRequestOperation *)fetchRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure
{
    HTTPRequestOperation *operation = [self operationWithRequest:request success:success failure:failure];
    [operation start];
    
    return operation;
}

- (HTTPRequestOperation *)operationWithRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure
{
    NSError *error = nil;
    NSString *absoluteURLString = [[NSURL URLWithString:request.path relativeToURL:self.baseURL] absoluteString];
    NSMutableURLRequest *urlRequest = [self.requestSerializer requestWithMethod:request.method URLString:absoluteURLString parameters:request.parameters.dictionary error:&error];
    
    if (error)
    {
    }
    
    if (request.timeoutInterval)
    {
        urlRequest.timeoutInterval = request.timeoutInterval;
    }
    
    HTTPRequestOperation *operation = (HTTPRequestOperation *)[self HTTPRequestOperationWithRequest:urlRequest success:success failure:failure];
    
    operation.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // TODO
    // Bad work
    // I am so sorry
    
    if ([request isKindOfClass:[APIRequest class]])
    {
        APIRequest *apiRequest = (APIRequest *)request;
        operation.responseSerializer = [APIResponseSerializer serializerWithModelClass:apiRequest.responseClass];
    }
    
    if ([request isKindOfClass:[ImageRequest class]])
    {
        operation.responseSerializer = [AFImageResponseSerializer serializer];
    }
    
    return operation;
}

#pragma mark -

- (AFHTTPRequestOperation *)HTTPRequestOperationWithRequest:(NSURLRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure
{
    HTTPRequestOperation *operation = [[HTTPRequestOperation alloc] initWithRequest:request];
    
    operation.responseSerializer = self.responseSerializer;
    operation.shouldUseCredentialStorage = self.shouldUseCredentialStorage;
    operation.credential = self.credential;
    operation.securityPolicy = self.securityPolicy;
    operation.completionQueue = self.completionQueue;
    operation.completionGroup = self.completionGroup;
    
    [operation setCompletionBlockWithSuccess:success failure:failure];
    
    return operation;
}

@end

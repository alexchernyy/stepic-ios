//
//  NetworkManager.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIRequest.h"
#import "APIRequest+Factory.h"
#import <Foundation/Foundation.h>
#import "HTTPRequestOperation.h"
#import "HTTPRequestOperationManager.h"

extern NSString * const kServerChangedNotification;

typedef NS_ENUM(NSInteger, ServerType)
{
    ServerTypeProduction
};

@interface NetworkManager : NSObject

+ (instancetype)sharedInstance;

@property (nonatomic, assign, readonly) ServerType serverType;
@property (nonatomic, copy, readonly) NSString *baseURL;
@property (nonatomic, copy, readonly) NSString *baseAPIURL;
@property (nonatomic, copy, readonly) NSString *baseMediaURL;

- (AFNetworkReachabilityManager *)reachabilityManager;

- (HTTPRequestOperation *)fetchRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure;

- (HTTPRequestOperation *)operationWithRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure;

@end

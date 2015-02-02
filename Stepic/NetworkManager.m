//
//  NetworkManager.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "NetworkManager.h"

NSString * const kServerChangedNotification = @"kServerChangedNotification";

static NSString * const kServerProductionName = @"Production";
static NSString * const kServerProductionBaseURL = @"https://stepic.org";
static NSString * const kServerBaseURLPostfix = @"/api";

@interface NetworkManager ()

@property (nonatomic, copy, readwrite) NSString *baseURL;
@property (nonatomic, strong) HTTPRequestOperationManager *operationManager;

- (NSString *)baseURLOfServerWithType:(ServerType)type;

@end

@implementation NetworkManager

+ (instancetype)sharedInstance
{
    static id instance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        instance = [[self alloc] init];
    });
    
    return instance;
}

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _serverType = ServerTypeProduction;
        _baseURL = [kServerProductionBaseURL stringByAppendingString:kServerBaseURLPostfix];
        _operationManager = [[HTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:_baseURL]];
    }
    
    return self;
}

#pragma mark -

- (HTTPRequestOperation *)fetchRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure
{
    return [self.operationManager fetchRequest:request success:success failure:failure];
}

- (HTTPRequestOperation *)operationWithRequest:(HTTPRequest *)request success:(HTTPRequestSucessBlock)success failure:(HTTPRequestFailureBlock)failure
{
    return [self.operationManager operationWithRequest:request success:success failure:failure];
}

#pragma mark -

- (NSString *)baseURLOfServerWithType:(ServerType)type
{
    switch (type)
    {
        case ServerTypeProduction:
        {
            return kServerProductionBaseURL;
        }
        
        default:
        {
            // TODO: Error
            break;
        }
    }
    
    // TODO: Error
    return nil;
}

#pragma mark -

- (void)setServerType:(ServerType)serverType
{
    if (_serverType == serverType)
    {
        return;
    }
    
    _serverType = serverType;
    
    NSString *serverPath = [self baseURLOfServerWithType:_serverType];
    self.baseURL = [serverPath stringByAppendingString:kServerBaseURLPostfix];
    NSURL *serverURL = [NSURL URLWithString:serverPath];
    
    // Borrowed from AFHTTPRequestOperationManager
    // Ensure terminal slash for baseURL path, so that NSURL +URLWithString:relativeToURL: works as expected
    if ([[serverURL path] length] > 0 && ![[serverURL absoluteString] hasSuffix:@"/"])
    {
        serverURL = [serverURL URLByAppendingPathComponent:@""];
    }
    
    self.operationManager = [[HTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:self.baseURL]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kServerChangedNotification object:nil];
}

- (AFNetworkReachabilityManager *)reachabilityManager
{
    return self.operationManager.reachabilityManager;
}

@end

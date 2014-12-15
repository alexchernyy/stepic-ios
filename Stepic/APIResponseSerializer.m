//
//  APIResponseSerializer.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "APIResponseSerializer.h"
#import <Mantle/Mantle.h>

NSString * const kAPIResponseSerializerErrorDomain = @"kAPIResponseSerializerErrorDomain";

@implementation APIResponseSerializer

+ (instancetype)serializerWithModelClass:(Class)modelClass
{
    return [[self alloc] initWithModelClass:modelClass];
}

- (instancetype)initWithModelClass:(Class)modelClass
{
    self = [super init];
    
    if (self)
    {
        _modelClass = modelClass;
        self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain",  nil];
    }
    
    return self;
}

#pragma mark -

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error
{
    [self validateResponse:(NSHTTPURLResponse *)response data:data error:error];
    
    if (*error)
    {
        return nil;
    }
    
    id responseObject = [NSJSONSerialization JSONObjectWithData:data options:self.readingOptions error:error];
    
    if (*error)
    {
        return nil;
    }
    
    NSAssert([responseObject isKindOfClass:[NSDictionary class]], @"Response object must be kind of NSDictionary class");
    
    if ([self.modelClass isSubclassOfClass:[NSString class]])
    {
        id responseString = [[self.modelClass alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return responseString;
    }
    
    if ([self.modelClass isSubclassOfClass:[NSDictionary class]])
    {
        NSDictionary *dictionary = [self.modelClass dictionaryWithDictionary:responseObject];
        return dictionary;
    }
    
    if (self.modelClass == nil)
    {
        return responseObject;
    }
    
    id responseModel;
    
    @try
    {
        if ([responseObject isKindOfClass:[NSDictionary class]])
        {
            responseModel = [MTLJSONAdapter modelOfClass:self.modelClass fromJSONDictionary:responseObject error:error];
        }
        else if ([responseObject isKindOfClass:[NSArray class]])
        {
            responseModel = [MTLJSONAdapter modelsOfClass:self.modelClass fromJSONArray:responseObject                                                     error:error];
        }
        
        return responseModel;
    }
    @catch (NSException *exception)
    {
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSMutableDictionary *userInfo = [@{NSLocalizedDescriptionKey : responseString} mutableCopy];
        
        *error = [NSError errorWithDomain:kAPIResponseSerializerErrorDomain code:0 userInfo:userInfo];
        
        return nil;
    }
    
    return nil;
}

@end

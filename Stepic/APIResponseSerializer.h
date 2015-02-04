//
//  APIResponseSerializer.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <Foundation/Foundation.h>

@interface APIResponseSerializer : AFHTTPResponseSerializer

@property (nonatomic, assign) NSJSONReadingOptions readingOptions;
@property (nonatomic, strong) Class modelClass;

+ (instancetype)serializerWithModelClass:(Class)modelClass;
- (instancetype)initWithModelClass:(Class)modelClass;

@end

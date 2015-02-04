//
//  ImageRequest.m
//  Stepic
//
//  Created by Александр Черный on 04/02/15.
//  Copyright (c) 2015 Alexander Chernyy. All rights reserved.
//

#import "ImageRequest.h"
#import "NetworkManager.h"

@implementation ImageRequest

+ (instancetype)requestWithImagePath:(NSString *)path
{
    return [[self alloc] initWithImagePath:path];
}

- (instancetype)initWithImagePath:(NSString *)path
{    
    self = [super initWithMethod:kHTTPRequestMethodGET path:path parameters:nil];
    
    if (self)
    {
    }
    
    return self;
}

@end

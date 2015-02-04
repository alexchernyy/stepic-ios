//
//  ImageRequest.h
//  Stepic
//
//  Created by Александр Черный on 04/02/15.
//  Copyright (c) 2015 Alexander Chernyy. All rights reserved.
//

#import "HTTPRequest.h"

@interface ImageRequest : HTTPRequest

- (instancetype)initWithImagePath:(NSString *)path;
+ (instancetype)requestWithImagePath:(NSString *)path;

@end

//
//  ImageRequest+Factory.h
//  Stepic
//
//  Created by Александр Черный on 04/02/15.
//  Copyright (c) 2015 Alexander Chernyy. All rights reserved.
//

#import "ImageRequest.h"

@interface ImageRequest (Factory)

+ (instancetype)requestImageNamed:(NSString *)name;

@end

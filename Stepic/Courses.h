//
//  Courses.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Courses : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSArray *courses;

@end

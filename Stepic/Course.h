//
//  Course.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

@interface Course : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *identifier;

@property (nonatomic, strong) NSDate *beginDate;
@property (nonatomic, strong) NSDate *endDate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *htmlDescription;
@property (nonatomic, copy) NSString *introdution;
@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSArray *languages;

@end

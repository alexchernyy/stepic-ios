//
//  Course.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import <UIKit/UIKit.h>

@interface Course : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *identifier;

@property (nonatomic, copy) NSString *beginDate;
@property (nonatomic, copy) NSString *endDate;

@property (nonatomic, copy) NSString *firstDeadline;
@property (nonatomic, copy) NSString *lastDeadline;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *htmlDescription;
@property (nonatomic, copy) NSString *introdution;
@property (nonatomic, copy) NSString *summary;

@property (nonatomic, copy) NSString *cover;
@property (nonatomic, strong) UIImage *coverImage;

@property (nonatomic, copy) NSArray *languages;

@property (nonatomic, assign) BOOL isFeatured;

- (NSString *)dates;
- (void)requestCoverWithSuccess:(void (^)(UIImage *image))success;

@end

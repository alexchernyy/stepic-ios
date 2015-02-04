//
//  Course.m
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import "Course.h"
#import "ImageRequest.h"
#import "ImageRequest+Factory.h"
#import "NetworkManager.h"
#import "NSString+UTCDate.h"

@implementation Course

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{NSStringFromSelector(@selector(identifier)) : @"id",
             NSStringFromSelector(@selector(beginDate)) : @"begin_date",
             NSStringFromSelector(@selector(endDate)) : @"end_date",
             NSStringFromSelector(@selector(firstDeadline)) : @"first_deadline",
             NSStringFromSelector(@selector(lastDeadline)) : @"last_deadline",
             NSStringFromSelector(@selector(title)) : @"title",
             NSStringFromSelector(@selector(htmlDescription)) : @"description",
             NSStringFromSelector(@selector(introdution)) : @"introdution",
             NSStringFromSelector(@selector(summary)) : @"summary",
             NSStringFromSelector(@selector(cover)) : @"cover",
             NSStringFromSelector(@selector(languages)) : @"language",
             NSStringFromSelector(@selector(isFeatured)) : @"is_featured"};
}

- (NSString *)dates
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"]];
    [dateFormatter setDateFormat:@"dd MMM yyyy"];
    
    NSString *beginDate = [dateFormatter stringFromDate:[self.beginDate stp_UTCDate]];
    NSString *endDate = [dateFormatter stringFromDate:[self.lastDeadline stp_UTCDate]];
    
    return [NSString stringWithFormat:@"[%@] %@ — %@", self.identifier, beginDate, endDate];
}

- (void)requestCoverWithSuccess:(void (^)(UIImage *image))success
{
    HTTPRequestSucessBlock localSuccess = ^(AFHTTPRequestOperation *operation, id responseObject)
    {
        UIImage *image = responseObject;
        self.coverImage = image;
        
        success(self.coverImage);
    };
    
    HTTPRequestFailureBlock localFailure = ^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Failure: %@", error);
    };
    
    [[NetworkManager sharedInstance] fetchRequest:[ImageRequest requestImageNamed:self.cover] success:localSuccess failure:localFailure];
}

@end

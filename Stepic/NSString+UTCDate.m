//
//  NSString+UTCDate.m
//  Stepic
//
//  Created by Александр Черный on 03/02/15.
//  Copyright (c) 2015 Alexander Chernyy. All rights reserved.
//

#import "NSString+UTCDate.h"

static NSString * const kUTCDateFormat = @"yyyy-MM-dd'T'HH:mm:ssZ";

@implementation NSString (UTCDate)

- (NSDate *)stp_UTCDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:kUTCDateFormat];
    
    NSDate *date = [dateFormatter dateFromString:self];
    return date;
}

@end

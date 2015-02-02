//
//  HTTPRequestParameters.h
//  Stepic
//
//  Created by Александр Черный on 15/12/14.
//  Copyright (c) 2014 Alexander Chernyy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>

/**
 * This class is a stub sinse there is no API that accept
 * URL parameters like http://site.com/method?parameter=value
 * If such parameters this class shouls be expanded and/or subclassed.
 * It conforms to MTLJSONSerializing so that it can be easily serialized to JSON
 */
@interface HTTPRequestParameters : MTLModel <MTLJSONSerializing>

- (NSDictionary *)dictionary;

@end

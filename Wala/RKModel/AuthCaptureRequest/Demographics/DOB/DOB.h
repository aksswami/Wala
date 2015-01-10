//
//  DOB.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

@interface DOB : NSObject

@property (nonatomic, strong) NSString * format;
@property (nonatomic, strong) NSString * dobType;
@property (nonatomic, strong) NSString * dobValue;

+ (RKObjectMapping *) dobMappingResponse;
+ (RKObjectMapping *) dobMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end

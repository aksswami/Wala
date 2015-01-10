//
//  POI.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

@interface POI : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, strong) NSString * dob;
@property (nonatomic, strong) NSString * gender;

+ (RKObjectMapping *) poiMappingResponse;
+ (RKObjectMapping *) poiMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end

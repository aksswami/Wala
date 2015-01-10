//
//  Location.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

@interface Location : NSObject

@property (nonatomic, strong) NSString * type;
@property (nonatomic, strong) NSString * latitude;
@property (nonatomic, strong) NSString * longitude;
@property (nonatomic, strong) NSString * altitude;
@property (nonatomic, strong) NSString * pincode;

+ (RKObjectMapping *) locationMappingResponse;
+ (RKObjectMapping *) locationMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end

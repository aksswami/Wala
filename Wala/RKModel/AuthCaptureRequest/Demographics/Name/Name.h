//
//  Name.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

@interface Name : NSObject

@property (nonatomic, strong) NSString * matchingStrategy;
@property (nonatomic, strong) NSString * matchingValue;
@property (nonatomic, strong) NSString * nameValue;

+ (RKObjectMapping *) nameMappingResponse;
+ (RKObjectMapping *) nameMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end

//
//  POI.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "POI.h"

@implementation POI


+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"name" : @"name",
             @"dob" : @"dob",
             @"gender" : @"gender"
             };
}

+ (RKObjectMapping *) poiMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[POI class]];
    [mapping addAttributeMappingsFromDictionary:[POI elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) poiMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[POI elementToPropertyMappings]];
    
    
    return mapping;
}


@end

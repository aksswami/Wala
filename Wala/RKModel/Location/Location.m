//
//  Location.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "Location.h"

@implementation Location


+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"type" : @"type",
             @"latitude" : @"latitude",
             @"longitude" : @"longitude",
             @"altitude" : @"altitude",
             @"pincode" : @"pincode"
             };
}

+ (RKObjectMapping *) locationMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Location class]];
    [mapping addAttributeMappingsFromDictionary:[Location elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) locationMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[Location elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
   // [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginDetails" toKeyPath:@"loginBeanDetail" withMapping:[LoginDetails loginDetailsMappingRequest]]];
    
    return mapping;
}
@end

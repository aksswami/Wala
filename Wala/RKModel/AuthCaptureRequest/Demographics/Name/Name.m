//
//  Name.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "Name.h"

@implementation Name

+ (NSDictionary*)elementToPropertyMappings {
    return @{
            @"matching-strategy" : @"matchingStrategy",
            @"matching-value" : @"matchingValue",
            @"name-value" : @"nameValue"
             };
}

+ (RKObjectMapping *) nameMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Name class]];
    [mapping addAttributeMappingsFromDictionary:[Name elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) nameMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[Name elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    // [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginDetails" toKeyPath:@"loginBeanDetail" withMapping:[LoginDetails loginDetailsMappingRequest]]];
    
    return mapping;
}



@end

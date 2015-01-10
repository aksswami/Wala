//
//  Demographics.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "Demographics.h"
#import "RKRelationshipMapping.h"

@implementation Demographics

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"age" : @"age",
             @"phone" : @"phone",
             @"email" : @"email",
             @"gender" : @"gender",
             @"address-format" : @"addressFormat"
             };
}

+ (RKObjectMapping *) demographicMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[Demographics class]];
    [mapping addAttributeMappingsFromDictionary:[Demographics elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) demographicMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[Demographics elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"name" toKeyPath:@"name" withMapping:[Name nameMappingRequest]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"dob" toKeyPath:@"dob" withMapping:[DOB dobMappingRequest]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"address-freetext" toKeyPath:@"addressFreetext" withMapping:[AddressFreetext addressFreetextMappingRequest]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"address-structured" toKeyPath:@"addressStructured" withMapping:[AddressStructured addressStructuredMappingRequest]]];
    
    return mapping;
}



@end

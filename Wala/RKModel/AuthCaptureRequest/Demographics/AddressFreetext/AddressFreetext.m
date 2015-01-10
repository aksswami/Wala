//
//  AddressFreetext.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "AddressFreetext.h"

@implementation AddressFreetext

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"matching-strategy" : @"matchingStrategy",
             @"matching-value" : @"matchingValue",
             @"address-value" : @"addressValue"
             };
}

+ (RKObjectMapping *) addressFreetextMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[AddressFreetext class]];
    [mapping addAttributeMappingsFromDictionary:[AddressFreetext elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) addressFreetextMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[AddressFreetext elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    // [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginDetails" toKeyPath:@"loginBeanDetail" withMapping:[LoginDetails loginDetailsMappingRequest]]];
    
    return mapping;
}


@end

//
//  AddressStructured.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "AddressStructured.h"

@implementation AddressStructured

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"care-of" : @"careOf",
             @"house" : @"house",
             @"street" : @"street",
             @"landmark" : @"landmark",
             @"locality" : @"locality",
             @"vtc" : @"vtc",
             @"subdistrict" : @"subdistrict",
             @"district" : @"district",
             @"state" : @"state",
             @"pin-code" : @"pinCode",
             @"postOffice" : @"postOffice"
             };
}

+ (RKObjectMapping *) addressStructuredMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[AddressStructured class]];
    [mapping addAttributeMappingsFromDictionary:[AddressStructured elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) addressStructuredMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[AddressStructured elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    // [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginDetails" toKeyPath:@"loginBeanDetail" withMapping:[LoginDetails loginDetailsMappingRequest]]];
    
    return mapping;
}

//KYC Response Address POA

+ (NSDictionary *) elementToPropertyMappingsPOA {
    return @{
             @"co": @"careOf",
             @"street": @"street",
             @"house": @"house",
             @"subdist": @"subdistrict",
             @"dist": @"district",
             @"state": @"state",
             @"pc": @"pinCode"
             };
}

+ (RKObjectMapping *) poaMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[AddressStructured class]];
    [mapping addAttributeMappingsFromDictionary:[AddressStructured elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}
@end

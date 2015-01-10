//
//  KYCResponse.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "KYCResponse.h"
#import "AddressStructured.h"

@implementation KYCResponse

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"aadhaarId" : @"aadhaar-id",
             @"photo" : @"photo",
             @"localData" : @"local-data"
             };
}

+ (RKObjectMapping *) kycResponseMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[KYCResponse class]];
    [mapping addAttributeMappingsFromDictionary:[KYCResponse elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"poi" toKeyPath:@"poi" withMapping:[POI poiMappingResponse]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"poa" toKeyPath:@"poa" withMapping:[AddressStructured addressStructuredMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) kycResponseMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[KYCResponse elementToPropertyMappings]];
    
    
    return mapping;
}

@end

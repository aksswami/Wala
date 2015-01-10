//
//  KYCResponse.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "KYCResponse.h"

@implementation KYCResponse

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"aadhaar-id" : @"aadhaarId",
             @"photo" : @"photo",
             @"local-data" : @"localData"
             };
}

+ (RKObjectMapping *) kycResponseMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[KYCResponse class]];
    [mapping addAttributeMappingsFromDictionary:[KYCResponse elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) kycResponseMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[KYCResponse elementToPropertyMappings]];
    
    
    return mapping;
}

@end

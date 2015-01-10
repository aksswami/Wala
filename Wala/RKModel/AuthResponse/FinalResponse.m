//
//  AuthResponse.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "FinalResponse.h"
#import "RKRelationshipMapping.h"

@implementation FinalResponse

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"aadhaar-id" : @"aadhaarId",
             @"success" : @"success",
             @"aadhaar-status-code" : @"aadhaarStatusCode",
             @"aadhaar-reference-code" : @"aadhaarReferenceCode"
             };
}

+ (RKObjectMapping *) finalResponseMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[FinalResponse class]];
    [mapping addAttributeMappingsFromDictionary:[FinalResponse elementToPropertyMappings]];
    
    
    // Add some relation mappings (if any.)
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"kyc" toKeyPath:@"kyc" withMapping:[KYCResponse kycResponseMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) finalResponseMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[FinalResponse elementToPropertyMappings]];
    
    
    
    return mapping;
}


@end

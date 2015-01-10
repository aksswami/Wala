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
             @"aadhaarId" : @"aadhaar-id",
             @"success" : @"success",
             @"aadhaarStatusCode" :@"aadhaar-status-code",
             @"aadhaarReferenceCode" : @"aadhaar-reference-code" 
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

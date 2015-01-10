//
//  KYCRequest.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "KYCRequest.h"

#import "RKRelationshipMapping.h"

@implementation KYCRequest
+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"consent" : @"consent"
             };
}

+ (RKObjectMapping *) kycReuqestMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[KYCRequest class]];
    [mapping addAttributeMappingsFromDictionary:[KYCRequest elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) kycReuqestMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[KYCRequest elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"auth-capture-request" toKeyPath:@"authCaptureRequest" withMapping:[AuthCaptureRequest authCaptureRequestMappingRequest]]];
    
    
    return mapping;
}




@end

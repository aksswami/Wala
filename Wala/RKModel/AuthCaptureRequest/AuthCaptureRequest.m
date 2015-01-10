//
//  AuthCaptureRequest.m
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//abcd

#import "AuthCaptureRequest.h"
#import "RKRelationshipMapping.h"

@implementation AuthCaptureRequest

+ (NSDictionary*)elementToPropertyMappings {
    return @{
             @"aadhaar-id" : @"aadhaarId",
             @"modality" : @"modality",
             @"modality-type" : @"modalityType",
             @"number-of-fingers-to-capture" : @"numberOfFingersToCapture",
             @"number-of-iris-to-capture" : @"numberOfIrisToCapture",
             @"otp" : @"otp",
             @"device-id" : @"deviceId",
             @"certificate-type" : @"certificateType"
             };
}

+ (RKObjectMapping *) authCaptureRequestMappingResponse {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[AuthCaptureRequest class]];
    [mapping addAttributeMappingsFromDictionary:[AuthCaptureRequest elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
    //[mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"loginBeanDetail" toKeyPath:@"loginDetails" withMapping:[LoginDetails loginDetailsMappingResponse]]];
    
    return mapping;
}

+ (RKObjectMapping *) authCaptureRequestMappingRequest {
    // Create an object mapping.
    RKObjectMapping *mapping = [RKObjectMapping requestMapping];
    [mapping addAttributeMappingsFromDictionary:[AuthCaptureRequest elementToPropertyMappings]];
    
    // Add some relation mappings (if any.)
     [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"demographics" toKeyPath:@"demographics" withMapping:[Demographics demographicMappingRequest]]];
    [mapping addPropertyMapping:[RKRelationshipMapping relationshipMappingFromKeyPath:@"location" toKeyPath:@"location" withMapping:[Location locationMappingRequest]]];
    
    
    return mapping;
}

@end

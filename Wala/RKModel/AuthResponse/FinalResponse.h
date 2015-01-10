//
//  AuthResponse.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"

#import "KYCResponse.h"


@interface FinalResponse : NSObject

@property (nonatomic, strong) NSString * aadhaarId;
@property (nonatomic) BOOL success;
@property (nonatomic, strong) NSString * aadhaarStatusCode;
@property (nonatomic, strong) NSString * aadhaarReferenceCode;

@property (nonatomic, strong) KYCResponse * kyc;


+ (RKObjectMapping *) finalResponseMappingResponse;
+ (RKObjectMapping *) finalResponseMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end

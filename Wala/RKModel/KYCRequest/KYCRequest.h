//
//  KYCRequest.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AuthCaptureRequest.h"

@interface KYCRequest : NSObject

@property (nonatomic, strong) NSString * consent;
@property (nonatomic, strong) AuthCaptureRequest * authCaptureRequest;

+ (RKObjectMapping *) kycReuqestMappingResponse;
+ (RKObjectMapping *) kycReuqestMappingRequest;
+ (NSDictionary*)elementToPropertyMappings;

@end

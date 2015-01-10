//
//  OTPObjectManager.h
//  Wala
//
//  Created by Amit kumar Swami on 11/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "FIObjectManager.h"
#import "AuthCaptureRequest.h"
#import "FinalResponse.h"

@interface OTPObjectManager : FIObjectManager


-(void) otpSendRequest:(AuthCaptureRequest *)authCaptureRequest
    andCompletionBlock:(void (^)(FinalResponse *))success
               failure:(void (^)(RKObjectRequestOperation *, NSError *))failure;

-(void) otpSendRequest:(AuthCaptureRequest *)authCaptureRequest
   andHeaderDictionary:(NSDictionary *)headerDictionary
    andCompletionBlock:(void (^)(FinalResponse *))success
               failure:(void (^)(RKObjectRequestOperation *, NSError *))failure;

@end

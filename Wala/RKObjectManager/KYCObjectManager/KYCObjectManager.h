//
//  KYCObjectManager.h
//  Wala
//
//  Created by Amit kumar Swami on 11/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "FIObjectManager.h"

#import "KYCRequest.h"
#import "FinalResponse.h"

@interface KYCObjectManager : FIObjectManager


-(void) getKYCDetailsRequest:(KYCRequest *)kycRequest
    andCompletionBlock:(void (^)(FinalResponse *))success
               failure:(void (^)(RKObjectRequestOperation *, NSError *))failure;

-(void) getKYCDetailsRequest:(KYCRequest *)kycRequest
   andHeaderDictionary:(NSDictionary *)headerDictionary
    andCompletionBlock:(void (^)(FinalResponse *))success
               failure:(void (^)(RKObjectRequestOperation *, NSError *))failure;


@end

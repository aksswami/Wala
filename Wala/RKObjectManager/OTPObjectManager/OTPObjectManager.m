//
//  OTPObjectManager.m
//  Wala
//
//  Created by Amit kumar Swami on 11/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "OTPObjectManager.h"

static OTPObjectManager * sharedManager;
@implementation OTPObjectManager


+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [super sharedManager];
    });
    return sharedManager;
}

-(void) otpSendRequest:(AuthCaptureRequest *)authCaptureRequest
                andCompletionBlock:(void (^)(FinalResponse *))success
                           failure:(void (^)(RKObjectRequestOperation *, NSError *))failure{
    NSMutableString* path = [BASE_URL mutableCopy];
    [path appendString:OTP_URL];
    
    [self postObject:authCaptureRequest path:path parameters:nil success:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
       // NSHTTPURLResponse *response = [[operation HTTPRequestOperation] response]; //operation is an
        if (success) {
                success([mappingResult firstObject]);
            }
        
        
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        if (failure) {
            failure(operation, error);
        }
    }];
}

-(void) otpSendRequest:(AuthCaptureRequest *)authCaptureRequest
               andHeaderDictionary:(NSDictionary *)headerDictionary
                andCompletionBlock:(void (^)(FinalResponse *))success
                           failure:(void (^)(RKObjectRequestOperation *, NSError *))failure{
    
    [headerDictionary enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL* stop){
        [sharedManager.HTTPClient setDefaultHeader:(NSString*)value value:(NSString*)key];
    }];
    [self otpSendRequest:authCaptureRequest andCompletionBlock:success failure:failure ];
}
#pragma mark - Setup Helpers

- (void) setupResponseDescriptors {
    [super setupResponseDescriptors];
    NSMutableString* path = [BASE_URL mutableCopy];
    [path appendString:OTP_URL];
    
    RKResponseDescriptor *responseDescriptors = [RKResponseDescriptor responseDescriptorWithMapping:[FinalResponse finalResponseMappingResponse] method:RKRequestMethodPOST pathPattern:nil keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    // RKResponseDescriptor *responseDescriptor = [RKResponseDescriptor responseDescriptorWithMapping:articleMapping method:RKRequestMethodAny pathPattern:@"/articles" keyPath:nil statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    [self addResponseDescriptor:responseDescriptors];
}

-(void) setupRequestDescriptors {
    [super setupRequestDescriptors];
    
    RKRequestDescriptor *requestDescriptors = [RKRequestDescriptor requestDescriptorWithMapping:[AuthCaptureRequest otpMappingRequest] objectClass:[AuthCaptureRequest class] rootKeyPath:nil method:RKRequestMethodPOST];
    [self addRequestDescriptor:requestDescriptors];
}


@end

//
//  Constant.h
//  Wala
//
//  Created by Amit kumar Swami on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#ifndef Wala_Constant_h
#define Wala_Constant_h


#define BASE_URL @"https://ac.khoslalabs.com/hackgate/hackteam18"

#define OTP_URL @"/otp"
#define KYC_URL @"/kyc/raw"



#define AADHAARID @"303101911154"
#define CHANNEL @"SMS"
#define CERTIFICATE_TYPE @"preprod"
#define DEVICE_ID @"ad00191"
#define LOCATION_TYPE_PINCODE @"pincode"
#define DUMMY_PINCODE @"560067"

#define CONSENT_YES @"Y"
#define COSENT_NO @"N"

#define MODALITY_OTP @"otp"



/*
 -(void)askForOTP
 {
 AuthCaptureRequest * authCaptureRequest = [[AuthCaptureRequest alloc]init];
 authCaptureRequest.aadhaarId = AADHAARID;
 authCaptureRequest.certificateType = CERTIFICATE_TYPE;
 authCaptureRequest.channel = CHANNEL;
 authCaptureRequest.deviceId = DEVICE_ID;
 
 
 Location * location = [[Location alloc]init];
 location.type = LOCATION_TYPE_PINCODE;
 location.pincode = DUMMY_PINCODE;
 
 authCaptureRequest.location = location;
 
 [[OTPObjectManager sharedManager] otpSendRequest:authCaptureRequest andCompletionBlock:^(FinalResponse * finalResponse){
 if(!finalResponse.success){
 [self showErrorDialog:finalResponse.aadhaarStatusCode];
 }
 NSLog(@"OTP Sent %@", finalResponse.description);
 }failure:^(RKObjectRequestOperation *requestOperation, NSError *error){
 NSLog(@"OTP ERROR %@", error.localizedDescription);
 }];
 
 
 }
 
 -(void) askForKYC {
 KYCRequest * kycRequest = [[KYCRequest alloc]init];
 kycRequest.consent = CONSENT_YES;
 
 AuthCaptureRequest * authCaptureRequest = [[AuthCaptureRequest alloc]init];
 kycRequest.authCaptureRequest = authCaptureRequest;
 authCaptureRequest.aadhaarId = AADHAARID;
 
 Location * location = [[Location alloc]init];
 authCaptureRequest.location = location;
 location.type = LOCATION_TYPE_PINCODE;
 location.pincode = DUMMY_PINCODE;
 
 authCaptureRequest.modality = MODALITY_OTP;
 authCaptureRequest.certificateType = CERTIFICATE_TYPE;
 authCaptureRequest.otp = @"";
 
 [[KYCObjectManager sharedManager] getKYCDetailsRequest:kycRequest andCompletionBlock:^(FinalResponse * finalResponse){
 NSLog(@"KYC RECEIVED %@", finalResponse.description);
 if(!finalResponse.success)
 [self showErrorDialog:finalResponse.aadhaarStatusCode];
 }failure:^(RKObjectRequestOperation *requestOperation, NSError *error){
 NSLog(@"KYC ERROR %@", error.localizedDescription);
 }];
 }
 
 
 - (void) showErrorDialog: (NSString *) errorCode{
 //Load Dictionary with wood name cross refference values for image name
 NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"ErrorCodeMsg" ofType:@"plist"];
 NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
 
 self.errorCodeAndMsg = creatureDictionary[@"UIDAIError"];
 
 [[[UIAlertView alloc] initWithTitle:@"Error in Authentication"
 message:[self.errorCodeAndMsg objectForKey:errorCode]
 cancelButtonItem:[RIButtonItem itemWithLabel:@"Ok" action:^{
 [self.navigationController popViewControllerAnimated:YES];
 }]
 otherButtonItems: nil] show];
 
 
 }
 
 */



#endif

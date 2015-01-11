//
//  WLRegisterViewController.m
//  Wala
//
//  Created by Tapish on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "WLRegisterViewController.h"
#import "UIAlertView+Blocks.h"
#import "AuthCaptureRequest.h"
#import "OTPObjectManager.h"
#import "KYCObjectManager.h"
#import "KYCRequest.h"
#import "KYCResponse.h"
#import "FinalResponse.h"
#import "WLProfileViewController.h"
#import "POI.h"
#import "AddressStructured.h"

#define PROFILE_SEGUE_IDENTIFIER @"profileViewSegue"


@interface WLRegisterViewController ()
@property (nonatomic,strong) NSDictionary *errorCodeAndMsg;
@end

@implementation WLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.errorCodeAndMsg = [[NSDictionary alloc]init];
    self.aadhaarTextBox.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonTouched:(id)sender {
    
    
    //Trigger Service
    [MRProgressOverlayView showOverlayAddedTo:self.view animated:YES];
    [self askForOTP];
    
    
    
}

#pragma mark
#pragma mark - TextFieldDelegateMethod
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}

// It is important for you to hide kwyboard

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self view] endEditing:YES];
}


#pragma mark -
#pragma mark - OTP web service methods
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
        [MRProgressOverlayView dismissAllOverlaysForView:self.view animated:YES];
        if(!finalResponse.success){
            [self showErrorDialog:finalResponse.aadhaarStatusCode];
        }
        else
        {
            [self showOTPAlert];
        }
        NSLog(@"OTP Sent %@", finalResponse.description);
    }failure:^(RKObjectRequestOperation *requestOperation, NSError *error){
        NSLog(@"OTP ERROR %@", error.localizedDescription);
    }];
    
    
}

-(void)showOTPAlert
{
    NSString *title = @"Please enter the OTP sent to your Aadhaar registered mobile.";
    NSString *message = @"I hereby give my consent to share my demographic details.";
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message cancelButtonItem:[RIButtonItem itemWithLabel:@"Submit" action:^{
        
        //trigger Web Service
        [self askForKYC:[alert textFieldAtIndex:0].text];
        
    }] otherButtonItems: nil] ;
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (void) showErrorDialog: (NSString *) errorCode{
    //Load Dictionary with wood name cross refference values for image name
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"ErrorCodeMsg" ofType:@"plist"];
    NSDictionary *createDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    self.errorCodeAndMsg = createDictionary[@"UIDAIError"];
    
    [[[UIAlertView alloc] initWithTitle:@"Error in Authentication"
                                message:[self.errorCodeAndMsg objectForKey:errorCode]
                       cancelButtonItem:[RIButtonItem itemWithLabel:@"OK" action:^{
        [self performSegueWithIdentifier:PROFILE_SEGUE_IDENTIFIER sender:nil];
    }]
                       otherButtonItems: nil] show];
    
    
}

#pragma mark -
#pragma mark - KYC web service methods

-(void) askForKYC:(NSString *)otp {
    [MRProgressOverlayView showOverlayAddedTo:self.view animated:YES];
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
    authCaptureRequest.otp = otp;
    
    [[KYCObjectManager sharedManager] getKYCDetailsRequest:kycRequest andCompletionBlock:^(FinalResponse * finalResponse){
        [MRProgressOverlayView dismissAllOverlaysForView:self.view animated:YES];
        NSLog(@"KYC RECEIVED %@", finalResponse.description);
        
        if(!finalResponse.success){
            [self showErrorDialog:finalResponse.aadhaarStatusCode];
            
        }
        else
        {
            [self performSegueWithIdentifier:PROFILE_SEGUE_IDENTIFIER sender:finalResponse];
        }
        
    }failure:^(RKObjectRequestOperation *requestOperation, NSError *error){
        NSLog(@"KYC ERROR %@", error.localizedDescription);
    }];
}

#pragma mark -
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    //FinalResponse *responseObject = (FinalResponse *)sender;
    
    FinalResponse *responseObject = [self setUpDummyData];
    
    WLProfileViewController *profileVC = [segue destinationViewController];
    profileVC.kycResponse = responseObject.kyc;
}

#pragma mark -
#pragma mark - Dummy Data

-(FinalResponse *)setUpDummyData
{
    FinalResponse *responseObject = [[FinalResponse alloc]init];
    responseObject.kyc = [[KYCResponse alloc]init];
    responseObject.kyc.poa = [[AddressStructured alloc]init];
    responseObject.kyc.poi = [[POI alloc]init];
    
    responseObject.kyc.aadhaarId = @"303101911154";
    responseObject.kyc.poi.name = @"Ragesh";
    responseObject.kyc.poi.dob = @"17-08-1991";
    responseObject.kyc.poi.gender = @"M";
    responseObject.kyc.poa.careOf = @"S/O: Shashi Kumar Mishra";
    responseObject.kyc.poa.street = @"Plot 8 pocket P 4";
    responseObject.kyc.poa.house = @"N 472";
    responseObject.kyc.poa.landmark = @"Bilder Area";
    responseObject.kyc.poa.vtc = @"Rampur Jagir";
    responseObject.kyc.poa.subdistrict = @"Gautam Buddha Nagar";
    responseObject.kyc.poa.district = @"Gautam Buddha Nagar";
    responseObject.kyc.poa.state = @"Uttar Pradesh";
    responseObject.kyc.poa.pinCode = @"201306";
    responseObject.kyc.poa.postOffice = @"I.a. Surajpur";
    
    responseObject.kyc.photo = @"/9j/4AAQSkZJRgABAgAAAQABAAD/2wBDAAgGBgcGBQgHBwcJCQgKDBQNDAsLDBkSEw8UHRofHh0a\r\nHBwgJC4nICIsIxwcKDcpLDAxNDQ0Hyc5PTgyPC4zNDL/2wBDAQkJCQwLDBgNDRgyIRwhMjIyMjIy\r\nMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjL/wAARCADIAKADASIA\r\nAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA\r\nAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3\r\nODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm\r\np6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA\r\nAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx\r\nBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK\r\nU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3\r\nuLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwC4FNBD\r\nZxUyjvTgM1djEhAOOlJgjtVoKAKcqA9hRYClyDktilGPrVxkX+6KjKruIAA4poCLA60xuDxTnU88\r\n4qGRtoPNADHYCq0koBPNJNL/APqrPnnHPNJjHz3QXPNZk17/ALVV7m5681myz5JqblpFqW/OeDVZ\r\nr588GqjsTTc0mVYsi8lB+8au29256nNZPep4HOcUgsdDBMSBk1ficmsa3fIBrUgPSqIZpRnjirSH\r\nIqlEatxnimI1AKULzTguTTtoqiRoHH40uCBTyvFJjAJzxQAzBIph+XJHIqcIZOvC+nrTJPlyP0oA\r\nrO/y1n3Eg5q3PgDjpWZcPgH3oYyrPNgn1rHurkYPPFWLuXGfSsO4m3E1LKSGTSlmNQE8UE01jUFi\r\n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\r\nBn1oopDP/9k=\r\n";
    
    return responseObject;
}

@end

//
//  WLRegisterViewController.m
//  Wala
//
//  Created by Tapish on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "WLRegisterViewController.h"
#import "UIAlertView+Blocks.h"


@interface WLRegisterViewController ()
@property (nonatomic,strong) NSString *aadharID;
@end

@implementation WLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)submitButtonTouched:(id)sender {
    
    NSString *message = @"I hereby give my consent to share my demographic details";
    
    //Trigger Service
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aadhaar Verification" message:message cancelButtonItem:[RIButtonItem itemWithLabel:@"Submit" action:^{
        
        self.aadharID = self.aadhaarTextBox.text;
        //trigger Web Service
        
    }] otherButtonItems: nil] ;
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

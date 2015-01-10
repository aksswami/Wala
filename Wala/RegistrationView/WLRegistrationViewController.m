//
//  WLRegistrationViewController.m
//  Wala
//
//  Created by Tapish on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "WLRegistrationViewController.h"
#import "XLForm.h"
#import "UIAlertView+Blocks.h"

@interface WLRegistrationViewController ()

@property(nonatomic , strong)NSString *otp;

@end

@implementation WLRegistrationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeSection];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initializeForm];
    }
    return self;
}

#pragma mark -
#pragma mark - Form initialization Methods

-(void)initializeForm
{
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"Register"];
    self.form = form;
}

-(void)initializeSection
{
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    //Aadhar Id
    XLFormRowDescriptor *row = [XLFormRowDescriptor formRowDescriptorWithTag:@"aadhaarIDTag" rowType:XLFormRowDescriptorTypeText title:@"Aadhar ID"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //First Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"FirstNameTag" rowType:XLFormRowDescriptorTypeText title:@"First Name"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //Middle Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"MiddleNameTag" rowType:XLFormRowDescriptorTypeText title:@"Middle Name"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //Last Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"LastNameTag" rowType:XLFormRowDescriptorTypeText title:@"Last Name"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //Gender
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"GenderTag" rowType:
           XLFormRowDescriptorTypeSelectorActionSheet title:@"Gender"];
    NSMutableArray *optionsArray = [[NSMutableArray alloc]init];
    
    //Male
    XLFormOptionsObject *options = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"Male"];
    [optionsArray addObject:options];
    
    //Female
    options = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Female"];
    [optionsArray addObject:options];
    
    //Transgender
    options = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"Transgender"];
    [optionsArray addObject:options];
    
    row.selectorOptions = optionsArray;
    [section addFormRow:row];
    
    //Date of Birth
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"DateofBirthTag" rowType:XLFormRowDescriptorTypeDate title:@"Date of Birth"];
    row.value = [NSDate date];
    [section addFormRow:row];
    
    //Mobile
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"MobileTag" rowType:XLFormRowDescriptorTypePhone title:@"Mobile"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //Address
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"AddressTag" rowType:XLFormRowDescriptorTypeText title:@"Address"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //Postal Code
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"PostalCodeTag" rowType:XLFormRowDescriptorTypeText title:@"Postal Code"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //City
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"CityTag" rowType:XLFormRowDescriptorTypeText title:@"City"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //State
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"StateTag" rowType:XLFormRowDescriptorTypeText title:@"State"];
    [section addFormRow:row];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    
    //Continue Button
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"CreateProfileTag" rowType:XLFormRowDescriptorTypeButton title:@"Create Profile"];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.action.formBlock = ^(XLFormRowDescriptor *row)
    {
        
    };
    [section addFormRow:row];
    
    [self.form addFormSection:section];
}

-(void)askForOTP
{
    NSString *message = @"I hereby give my consent to share my demographic details";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aadhaar Verification" message:message cancelButtonItem:[RIButtonItem itemWithLabel:@"Submit" action:^{
        
        self.otp = [alert textFieldAtIndex:0].text;
        
    }] otherButtonItems: nil] ;
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
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

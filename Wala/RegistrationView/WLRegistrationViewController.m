//
//  WLRegistrationViewController.m
//  Wala
//
//  Created by Tapish on 10/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "WLRegistrationViewController.h"
#import "XLForm.h"

@interface WLRegistrationViewController ()

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
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@""];
    self.form = form;
}

-(void)initializeSection
{
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    //Aadhar Id
    XLFormRowDescriptor *row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    
    //First Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //Middle Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //Last Name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //Gender
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:
           XLFormRowDescriptorTypeSelectorActionSheet title:@""];
    NSMutableArray *optionsArray = [[NSMutableArray alloc]init];
    
    //Male
    XLFormOptionsObject *options = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@""];
    [optionsArray addObject:options];
    
    //Female
    options = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@""];
    [optionsArray addObject:options];
    
    //Transgender
    options = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@""];
    [optionsArray addObject:options];
    
    row.selectorOptions = optionsArray;
    [section addFormRow:row];
    
    //Date of Birth
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeDate title:@""];
    row.value = [NSDate date];
    [section addFormRow:row];
    
    //Mobile
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypePhone title:@""];
    [section addFormRow:row];
    
    //Address
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //Zip
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //City
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //State
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeText title:@""];
    [section addFormRow:row];
    
    //Continue Button
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"" rowType:XLFormRowDescriptorTypeButton title:@""];
    [row.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    row.action.formBlock = ^(XLFormRowDescriptor *row)
    {
        
    };
    [section addFormRow:row];
    
    [self.form addFormSection:section];
}

-(void)askForOTP
{
    
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

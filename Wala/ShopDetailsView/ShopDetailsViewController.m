//
//  ShopDetailsViewController.m
//  Wala
//
//  Created by Tapish on 11/01/15.
//  Copyright (c) 2015 Amit kumar Swami. All rights reserved.
//

#import "ShopDetailsViewController.h"
#import "XLForm.h"


@interface ShopDetailsViewController ()

@end

@implementation ShopDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeSections];
    // Do any additional setup after loading the view.
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


-(void)initializeForm
{
    self.form = [XLFormDescriptor formDescriptor];
}

-(void)initializeSections
{
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSectionWithTitle:@""];
    
    XLFormRowDescriptor *row = [XLFormRowDescriptor formRowDescriptorWithTag:@"walaTypeTag" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Type of Wala"];
    
    row.selectorOptions = @[
                            @"SUBJI",
                            @"KIRANA",
                            @"ELECTRICIAN",
                            @"PLUMBER",
                            @"CHEMIST"
                            ];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"employmentTypeTag" rowType:XLFormRowDescriptorTypeSelectorActionSheet title:@"Choose Employment Type"];
    
    row.selectorOptions = @[
                            @"OWNER",
                            @"MANAGER",
                            @"ASSISTANT"
                            ];
    [section addFormRow:row];
    
     row = [XLFormRowDescriptor formRowDescriptorWithTag:@"shopTag" rowType:XLFormRowDescriptorTypeSelectorPush title:@"Choose your shop"];
    
    row.selectorOptions = @[
                            @"ABC KIRANA",
                            @"XYZ CHEMIST",
                            @"WS ELECTRICALS",
                            @"MOVERS AND SHAKERS",
                            @"NANDU'S CHAI SHOP",
                            @"GOVIND'S KIRANA"
                            ];
    [section addFormRow:row];
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"newShopTag" rowType:XLFormRowDescriptorTypeButton title:@"Is your shop not listed? Click to Add Shop"];
    row.action.formBlock = ^(XLFormRowDescriptor *row)
    {
        [self performSegueWithIdentifier:@"" sender:nil];
    };
    
    [section addFormRow:row];
    
    [self.form addFormSection:section];

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

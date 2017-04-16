//
//  NewUserViewController.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "NewUserViewController.h"

@interface NewUserViewController ()

@end

@implementation NewUserViewController
@synthesize txtCardName, txtCardNum, txtCardCVC, txtCardMM, txtCardYY, segPayment,
txtPPUsername, txtPPPass, lblPPPass, lblPPUsername;

- (IBAction)unwindToNewRegistrationController:(UIStoryboardSegue *)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder]; // Hide the keyboard and return the control
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [lblPPUsername setEnabled:NO]; // Disable the Paypal Username Label by default
    [lblPPPass setEnabled:NO]; // Disable the Paypal Password label by Default
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)segmentDidChange:(id)sender // Segment Control for Payment
{
    [self updatePayment];
}

-(void)updatePayment
{
    NSInteger payment = segPayment.selectedSegmentIndex;
    
    if(payment == 0 || payment == 1) { // Debit or Visa
        [lblPPUsername setEnabled:NO];
        [lblPPPass setEnabled:NO];
        [txtPPPass setEnabled:NO];
        [txtPPUsername setEnabled:NO];
    } else { // Paypal
        [lblPPUsername setEnabled:YES];
        [lblPPPass setEnabled:YES];
        [txtPPPass setEnabled:YES];
        [txtPPUsername setEnabled:YES];
    }
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

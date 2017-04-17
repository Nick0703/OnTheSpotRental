//
//  NewUserViewController.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "NewUserViewController.h"
#import "RentalsViewController.h"
#import "AppDelegate.h"

@interface NewUserViewController ()

@end

@implementation NewUserViewController
@synthesize txtCardName, txtCardNum, txtCardCVC, txtCardMM, txtCardYY, segPayment,
txtPPUsername, txtPPPass, lblPPPass, lblPPUsername, txtName, txtStreet, txtCity, txtPostal, txtPhoneNum, txtUsername, txtPass, txtPassConf;

- (IBAction)unwindToNewRegistrationController:(UIStoryboardSegue *)sender {
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder]; // Hide the keyboard and return the control
    return NO;
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

- (IBAction)informUser:(id)sender { // Submit button
    NSString *password = [txtPass text];
    NSString *password_conf = [txtPassConf text];
    
    if ((txtName.text && txtName.text.length > 0)
        && (txtStreet.text && txtStreet.text.length > 0)
        && (txtCity.text && txtCity.text.length > 0)
        && (txtPostal.text && txtPostal.text.length > 0)
        && (txtPhoneNum.text && txtPhoneNum.text.length > 0)
        && (txtUsername.text && txtUsername.text.length > 0)) {
        //&& (txtCardName.text && txtCardName.text.length > 0)
        //&& (txtCardNum.text && txtCardNum.text.length > 0)
        //&& (txtCardCVC.text && txtCardCVC.text.length > 0)
        //&& (txtCardMM.text && txtCardMM.text.length > 0)
        //&& (txtCardYY.text && txtCardYY.text.length > 0)) { // All the fields filled and avatar selected
        if ([password isEqualToString:password_conf]) {
            [self addUser]; // Add to Database
            /*UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank You!" message:@"Thank you for registering." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];*/
            
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            RentalsViewController *rentalVC = (RentalsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"1"];
            [self presentViewController:rentalVC animated:YES completion:nil];
        } else {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Please make sure that your password matches!" preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }

    } else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:@"Please fill out the necessary fields!" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

-(void)addUser { // Add person to DB
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *name = [txtName text];
    NSString *street = [txtStreet text];
    NSString *city = [txtCity text];
    NSString *postal_code = [txtPostal text];
    NSString *phone_num = [txtPhoneNum text];
    NSString *username = [txtUsername text];
    NSString *password = [txtPass text];
    NSInteger payment = segPayment.selectedSegmentIndex;
    NSString *paymentType;
    if(payment == 0) { // Debit
        paymentType = @"Debit";
    } else if(payment == 1) {
        paymentType = @"Visa";
    } else { // Paypal
        paymentType = @"Paypal";
    }
    NSString *card_name = [txtCardName text];
    NSString *card_num = [txtCardNum text];
    NSString *card_cvc = [txtCardCVC text];
    NSString *card_mm = [txtCardMM text];
    NSString *card_yy = [txtCardYY text];
    NSString *paypal_user = [txtPPUsername text];
    NSString *paypal_pass = [txtPPPass text];
    
    CustomerInfo *customer = [[CustomerInfo alloc] initWithData:name theStreet:street theCity:city thePostal:postal_code thePhone:phone_num thePayment:paymentType theCardName:card_name theCardNum:card_num theCardCVC:card_cvc theCardMM:card_mm theCardYY:card_yy thePaypalU:paypal_user thePayPalP:paypal_pass];
    NSString *user_ID = [mainDelegate readDataFromCustomerInfoID:name thePhone:phone_num];
    LoginInfo *login = [[LoginInfo alloc] initWithData:username thePassword:password theCustomer:user_ID];
    
    BOOL returnCode = [mainDelegate insertIntoCustomerInfo:customer];
    BOOL returnCode1 = [mainDelegate insertIntoLoginInfo:login];
    
    if(returnCode == NO || returnCode1 == NO) {
        NSString *returnMsg = @"User Add Failed!";
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"SQLite Insert" message:returnMsg preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

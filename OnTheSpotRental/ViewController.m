//
//  ViewController.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "ViewController.h"
#import "RentalsViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tfUsername, tfPassword, customerID, mainDelegate;

- (IBAction)unwindToMainController:(UIStoryboardSegue *)sender {
}

- (IBAction)goToRentals:(id)sender {
    if ((tfUsername.text && tfUsername.text.length > 0) && (tfPassword.text && tfPassword.text.length > 0)) {
        NSString *username = [tfUsername text];
        NSString *password = [tfPassword text];
        BOOL returnCode = [mainDelegate readDataFromLoginInfo:username thePassword:password];
        if(returnCode) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            RentalsViewController *rentalVC = (RentalsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"1"];
            [self presentViewController:rentalVC animated:YES completion:nil];
        } else {
            NSString *msg = @"Incorrect username or password";
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error!" message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:ok];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mainDelegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

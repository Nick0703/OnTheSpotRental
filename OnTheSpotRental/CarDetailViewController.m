//
//  CarDetailViewController.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-04-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "CarDetailViewController.h"
#import "RentalsViewController.h"

@interface CarDetailViewController ()

@end

@implementation CarDetailViewController
@synthesize imgCar, tfMake, tfModel, tfMpg, tfCost, tfDuration, tfTotalCost, picture, mpg, model, make, cost, duration, totalCost, user_ID, car_ID;

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder]; // Hide the keyboard and return the control
    return NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    imgCar.image = [UIImage imageNamed:picture];
    tfMake.text = make;
    tfModel.text = model;
    tfCost.text = cost;
    tfMpg.text = mpg;
    NSLog(@"Client ID IS %@", user_ID);
    NSLog(@"Car ID IS %@", car_ID);
}

- (void)addRental {
    AppDelegate *mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    NSString *days = [tfDuration text];
    NSString *total = [tfTotalCost text];
    
    RentedInfo *rent = [[RentedInfo alloc] initWithData:total carID:car_ID custID:user_ID
                                                rentDur:days];
    
    BOOL returnCode = [mainDelegate insertIntoRentedInfo:rent];
    
    if(returnCode == NO) {
        NSString *returnMsg = @"Rent Add Failed!";
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"SQLite Insert" message:returnMsg preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (IBAction)confRent:(id)sender {
    if (tfDuration.text && tfDuration.text.length > 0) {
        [self addRental];
        
        /*UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Thank you!" message:@"An agent will contact you soon." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        
        [alert addAction:ok];
        [self presentViewController:alert animated:YES completion:^{
            [self confirmationCompleted];
        }];*/
        [self confirmationCompleted];

    }
}

-(void)confirmationCompleted{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RentalsViewController *rentalVC = (RentalsViewController *)[storyboard instantiateViewControllerWithIdentifier:@"1"];
    [self presentViewController:rentalVC animated:YES completion:nil];
    

}
- (IBAction)updateCost:(id)sender {
    double days = [tfDuration.text doubleValue];
    double price = [tfCost.text doubleValue];
    double total = days * price;
    NSString* tc = [NSString stringWithFormat:@"%.2f", total];
    tfTotalCost.text = tc;
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

//
//  CarDetailViewController.h
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-04-17.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CarDetailViewController : UIViewController<UITextViewDelegate> {
    IBOutlet UIImageView *imgCar;
    IBOutlet UITextField *tfMake;
    IBOutlet UITextField *tfModel;
    IBOutlet UITextField *tfMpg;
    IBOutlet UITextField *tfCost;
    IBOutlet UITextField *tfDuration;
    IBOutlet UITextField *tfTotalCost;
    NSString *picture;
    NSString *make;
    NSString *model;
    NSString *mpg;
    NSString *cost;
    NSString *duration;
    NSString *totalCost;
    NSString *user_ID;
    NSString *car_ID;
}

@property (strong, nonatomic) IBOutlet UIImageView *imgCar;
@property (strong, nonatomic) IBOutlet UITextField *tfMake;
@property (strong, nonatomic) IBOutlet UITextField *tfModel;
@property (strong, nonatomic) IBOutlet UITextField *tfMpg;
@property (strong, nonatomic) IBOutlet UITextField *tfCost;
@property (strong, nonatomic) IBOutlet UITextField *tfDuration;
@property (strong, nonatomic) IBOutlet UITextField *tfTotalCost;
@property (strong, nonatomic) NSString *picture;
@property (strong, nonatomic) NSString *make;
@property (strong, nonatomic) NSString *model;
@property (strong, nonatomic) NSString *mpg;
@property (strong, nonatomic) NSString *cost;
@property (strong, nonatomic) NSString *duration;
@property (strong, nonatomic) NSString *totalCost;
@property (strong, nonatomic) NSString *user_ID;
@property (strong, nonatomic) NSString *car_ID;

@end

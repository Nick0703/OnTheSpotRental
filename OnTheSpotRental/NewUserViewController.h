//
//  NewUserViewController.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewUserViewController : UIViewController<UITextViewDelegate> {
    IBOutlet UISegmentedControl *segPayment;
    IBOutlet UITextField *txtCardName;
    IBOutlet UITextField *txtCardNum;
    IBOutlet UITextField *txtCardCVC;
    IBOutlet UITextField *txtCardMM;
    IBOutlet UITextField *txtCardYY;
    IBOutlet UILabel *lblPPUsername;
    IBOutlet UILabel *lblPPPass;
    IBOutlet UITextField *txtPPUsername;
    IBOutlet UITextField *txtPPPass;
}

@property (strong, nonatomic) UISegmentedControl *segPayment;
@property (strong, nonatomic) IBOutlet UITextField *txtCardName;
@property (strong, nonatomic) IBOutlet UITextField *txtCardNum;
@property (strong, nonatomic) IBOutlet UITextField *txtCardCVC;
@property (strong, nonatomic) IBOutlet UITextField *txtCardMM;
@property (strong, nonatomic) IBOutlet UITextField *txtCardYY;
@property (strong, nonatomic) IBOutlet UILabel *lblPPUsername;
@property (strong, nonatomic) IBOutlet UILabel *lblPPPass;
@property (strong, nonatomic) IBOutlet UITextField *txtPPUsername;
@property (strong, nonatomic) IBOutlet UITextField *txtPPPass;

@end

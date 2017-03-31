//
//  ReturnUserViewController.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-17.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReturnUserViewController : UIViewController {
    IBOutlet UITextField *txtUsername;
    IBOutlet UITextField *txtPassword;
}

@property(strong, nonatomic) IBOutlet UITextField *txtUsername;
@property(strong, nonatomic) IBOutlet UITextField *txtPassword;

@end

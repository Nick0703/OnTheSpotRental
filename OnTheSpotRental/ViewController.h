//
//  ViewController.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-03-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<UITextViewDelegate> {
    AppDelegate *mainDelegate;
    IBOutlet UITextField *tfUsername;
    IBOutlet UITextField *tfPassword;
    NSString *customerID;
}

@property(nonatomic, strong) AppDelegate *mainDelegate;
@property(nonatomic, strong) IBOutlet UITextField *tfUsername;
@property(nonatomic, strong) IBOutlet UITextField *tfPassword;
@property(nonatomic, strong) NSString *customerID;
@end


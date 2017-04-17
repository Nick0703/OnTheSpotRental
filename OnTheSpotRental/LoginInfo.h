//
//  LoginInfo.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-04-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginInfo : NSObject {
    NSString *username;
    NSString *password;
    NSString *customerID;
}

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *customerID;

- (id)initWithData:(NSString *)un thePassword:(NSString *)pp theCustomer:(NSString *)ci;

@end

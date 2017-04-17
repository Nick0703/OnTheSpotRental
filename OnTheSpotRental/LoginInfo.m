//
//  LoginInfo.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-04-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "LoginInfo.h"

@implementation LoginInfo
@synthesize username, password, customerID;

- (id)initWithData:(NSString *)un thePassword:(NSString *)pp theCustomer:(NSString *)ci {
    self = [super init];
    
    if(self) {
        [self setUsername:un];
        [self setPassword:pp];
        [self setCustomerID:ci];
    }
    
    return self;
}

- (id)init {
    return [self initWithData:@"No Username" thePassword:@"No Password" theCustomer:@"No ID"];
}

@end

//
//  RentedInfo.m
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-04-17.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import "RentedInfo.h"

@implementation RentedInfo
@synthesize tota_Cost, car_Id, customer_Id, rent_Duration;

- (id)initWithData:(NSString *)tc carID:(NSString *)ci custID:(NSString *)cu rentDur:(NSString *)rd {
    self = [super init];
    
    if(self) {
        [self setRent_Duration:rd];
        [self setTota_Cost:tc];
        [self setCar_Id:ci];
        [self setCustomer_Id:cu];
    }
    
    return self;
}

- (id)init {
    return [self initWithData:@"No Cost" carID:@"No ID" custID:@"No ID" rentDur:@"No Duration"];
}
@end

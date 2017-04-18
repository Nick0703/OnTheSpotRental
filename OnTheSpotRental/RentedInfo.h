//
//  RentedInfo.h
//  OnTheSpotRental
//
//  Created by Vidur Prakash on 2017-04-17.
//  Copyright © 2017 Vidur Prakash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RentedInfo : NSObject {
    NSString *rent_Duration;
    NSString *tota_Cost;
    NSString *car_Id;
    NSString *customer_Id;
}

@property (nonatomic, strong) NSString *rent_Duration;
@property (nonatomic, strong) NSString *tota_Cost;
@property (nonatomic, strong) NSString *car_Id;
@property (nonatomic, strong) NSString *customer_Id;

- (id)initWithData:(NSString *)tc carID:(NSString *)ci custID:(NSString *)cu rentDur:(NSString *)rd;

@end

//
//  CustomerInfo.m
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-04-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import "CustomerInfo.h"

@implementation CustomerInfo
@synthesize name, street, city, postal_code, phone_number, payment_type, card_name, card_number, card_cvc, card_expmm, card_expyy, paypal_pass, paypal_user;

- (id)initWithData:(NSString *)na theStreet:(NSString *)st theCity:(NSString *)ci thePostal:(NSString *)pc thePhone:(NSString *)ph thePayment:(NSString *)py theCardName:(NSString *)cn theCardNum:(NSString *)co theCardCVC:(NSString *)cv theCardMM:(NSString *)mm theCardYY:(NSString *)yy thePaypalU:(NSString *)pu thePayPalP:(NSString *)pp {
    
    self = [super init];
    
    if(self) {
        [self setName:na];
        [self setStreet:st];
        [self setCity:ci];
        [self setPostal_code:pc];
        [self setPhone_number:ph];
        [self setPayment_type:py];
        [self setCard_name:cn];
        [self setCard_number:co];
        [self setCard_cvc:cv];
        [self setCard_expmm:mm];
        [self setCard_expyy:yy];
        [self setPaypal_user:pu];
        [self setPaypal_pass:pp];
    }
    
    return self;
}

- (id)init {
    return [self initWithData:@"No name" theStreet:@"No Street" theCity:@"No City" thePostal:@"No Postal Code" thePhone:@"No Phone" thePayment:@"No Payment" theCardName:@"No Card" theCardNum:@"No Card Number" theCardCVC:@"No CVC" theCardMM:@"No MM" theCardYY:@"No YY" thePaypalU:@"No Paypal User" thePayPalP:@"No Paypal Pass"];
}


@end

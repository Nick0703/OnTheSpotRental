//
//  CustomerInfo.h
//  OnTheSpotRental
//
//  Created by Lokesh Chamane on 2017-04-16.
//  Copyright © 2017 Lokesh Chamane. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomerInfo : NSObject {
    NSString *name;
    NSString *street;
    NSString *city;
    NSString *postal_code;
    NSString *phone_number;
    NSString *payment_type;
    NSString *card_name;
    NSString *card_number;
    NSString *card_cvc;
    NSString *card_expmm;
    NSString *card_expyy;
    NSString *paypal_user;
    NSString *paypal_pass;
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *street;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *postal_code;
@property (strong, nonatomic) NSString *phone_number;
@property (strong, nonatomic) NSString *payment_type;
@property (strong, nonatomic) NSString *card_name;
@property (strong, nonatomic) NSString *card_number;
@property (strong, nonatomic) NSString *card_cvc;
@property (strong, nonatomic) NSString *card_expmm;
@property (strong, nonatomic) NSString *card_expyy;
@property (strong, nonatomic) NSString *paypal_user;
@property (strong, nonatomic) NSString *paypal_pass;

- (id)initWithData:(NSString *)na theStreet:(NSString *)st theCity:(NSString *)ci thePostal:(NSString *)pc thePhone:(NSString *)ph thePayment:(NSString *)py theCardName:(NSString *)cn theCardNum:(NSString *)co theCardCVC:(NSString *)cv theCardMM:(NSString *)mm theCardYY:(NSString *)yy thePaypalU:(NSString *)pu thePayPalP:(NSString *)pp;

@end

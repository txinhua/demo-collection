//
//  ViewController.m
//  AppPaydemo
//
//  Created by VcaiTec on 16/2/19.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"
#import <PassKit/PassKit.h>
#import "NSString+Trim.h"


@interface ViewController ()<PKPaymentAuthorizationViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *hasTrimStr =@" haha  ";
    NSLog(@"bb--%@--ee",hasTrimStr);
    hasTrimStr = [hasTrimStr trimString];
    NSLog(@"bb--%@--ee",hasTrimStr);
    
    PKPaymentButton *payButton = [PKPaymentButton buttonWithType:PKPaymentButtonTypeBuy style:PKPaymentButtonStyleWhiteOutline];
//    [payButton setTitle:@"付款" forState:UIControlStateNormal];
    [payButton addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
    [payButton setFrame:CGRectMake(10, 80, self.view.frame.size.width-20, 30)];
    [self.view addSubview:payButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)payAction:(id)sender{
    if ([PKPaymentAuthorizationViewController canMakePayments]) {
        NSLog(@"Woo! Can make payments!");
        
        PKPaymentRequest *request = [[PKPaymentRequest alloc] init];
        
//        PKPaymentSummaryItem *widget1 = [PKPaymentSummaryItem summaryItemWithLabel:@"Widget 1"
//                                                                            amount:[NSDecimalNumber decimalNumberWithString:@"0.99"]];
//        
//        PKPaymentSummaryItem *widget2 = [PKPaymentSummaryItem summaryItemWithLabel:@"Widget 2"
//                                                                            amount:[NSDecimalNumber decimalNumberWithString:@"1.00"]];
//        
//        //折扣
//        NSDecimalNumber *discountAmount = [NSDecimalNumber decimalNumberWithMantissa:100 exponent:-2 isNegative:YES];
//        
//        PKPaymentSummaryItem *discount = [PKPaymentSummaryItem summaryItemWithLabel:@"Discount" amount:discountAmount];
//        
//        
//        PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"Grand Total"
//                                                                          amount:[NSDecimalNumber decimalNumberWithString:@"0.99"]];
        
//        设置费用项
//        在这里可以设置费用的各组成部分及最后结算，包括小计、运费、折扣等项，每一项包含标签字符串和金额两个属性。
        //小计
        NSDecimalNumber *subtotalAmount = [NSDecimalNumber decimalNumberWithMantissa:1275 exponent:-2 isNegative:NO];
        PKPaymentSummaryItem *subtotal = [PKPaymentSummaryItem summaryItemWithLabel:@"Subtotal" amount:subtotalAmount];
        //折扣
        NSDecimalNumber *discountAmount = [NSDecimalNumber decimalNumberWithMantissa:200 exponent:-2 isNegative:YES];
        PKPaymentSummaryItem *discount = [PKPaymentSummaryItem summaryItemWithLabel:@"Discount" amount:discountAmount];
        
        // 合计
        NSDecimalNumber *totalAmount = [NSDecimalNumber zero];
        totalAmount = [totalAmount decimalNumberByAdding:subtotalAmount];
        totalAmount = [totalAmount decimalNumberByAdding:discountAmount];
        PKPaymentSummaryItem *total = [PKPaymentSummaryItem summaryItemWithLabel:@"My Company Name" amount:totalAmount];
        
        request.paymentSummaryItems = @[subtotal, discount,total];
        
        request.countryCode = @"CN";
        request.currencyCode = @"CNY";
        request.supportedNetworks = @[PKPaymentNetworkChinaUnionPay, PKPaymentNetworkMasterCard, PKPaymentNetworkVisa];
        request.merchantIdentifier = @"merchant.com.lieyi.eapay";
        request.merchantCapabilities = PKMerchantCapabilityEMV;
        
        PKPaymentAuthorizationViewController *paymentPane = [[PKPaymentAuthorizationViewController alloc] initWithPaymentRequest:request];
        
        paymentPane.delegate = self;
        
        [self presentViewController:paymentPane animated:TRUE completion:nil];
        
    }else{
        
        NSLog(@"该设备不支持Apple Pay");
        
    }
}



- (void)paymentAuthorizationViewController:(PKPaymentAuthorizationViewController *)controller
                       didAuthorizePayment:(PKPayment *)payment
                                completion:(void (^)(PKPaymentAuthorizationStatus status))completion
{
    NSLog(@"Payment was authorized: %@", payment);
    
    // do an async call to the server to complete the payment.
    
    // See PKPayment class reference for object parameters that can be passed
    BOOL asyncSuccessful = FALSE;
    
    // When the async call is done, send the callback.
    // Available cases are:
    //    PKPaymentAuthorizationStatusSuccess, // Merchant auth'd (or expects to auth) the transaction successfully.
    //    PKPaymentAuthorizationStatusFailure, // Merchant failed to auth the transaction.
    //
    //    PKPaymentAuthorizationStatusInvalidBillingPostalAddress,  // Merchant refuses service to this billing address.
    //    PKPaymentAuthorizationStatusInvalidShippingPostalAddress, // Merchant refuses service to this shipping address.
    //    PKPaymentAuthorizationStatusInvalidShippingContact        // Supplied contact information is insufficient.
    
//    if(asyncSuccessful) {
    
        completion(PKPaymentAuthorizationStatusSuccess);
        //do something to let the user know the status
        //[Crittercism endTransaction:@"checkout"];
        NSLog(@"Payment was successful");
        
//    } else {
//        
//        completion(PKPaymentAuthorizationStatusFailure);
//        //do something to let the user know the status
//        NSLog(@"Payment was unsuccessful");
//        //[Crittercism failTransaction:@"checkout"];
//        
//    }
}

- (void)paymentAuthorizationViewControllerDidFinish:(PKPaymentAuthorizationViewController *)controller{
    
    NSLog(@"Finishing payment view controller");
    
    // hide the payment window
    [controller dismissViewControllerAnimated:TRUE completion:nil];
    
}




@end

//
//  ViewController.m
//  BlueServer
//
//  Created by VcaiTec on 15/12/30.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

static NSString * const kServiceUUID = @"880D4921-631B-4D3D-899D-D6BB8E268D80";

static NSString * const kCharacteristicUUID = @"98AC34BE-BF82-49B9-995D-9CE7E06E7EE3";

@interface ViewController ()<CBPeripheralManagerDelegate>

@property(nonatomic,strong)dispatch_queue_t oprationQueue;

@end

@implementation ViewController

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral{

    switch (peripheral.state) {
        case CBPeripheralManagerStatePoweredOn:
            [self setupService];
            break;
        default:
            NSLog(@"Peripheral Manager did change state");
            break;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    oprationQueue = dispatch_queue_create(<#const char *label#>, <#dispatch_queue_attr_t attr#>)
    self.cbPeripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self queue:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupService {
    // Creates the characteristic UUID
    CBUUID *characteristicUUID = [CBUUID UUIDWithString:kCharacteristicUUID];
    // Creates the characteristic
    self.customCharacteristic = [[CBMutableCharacteristic alloc] initWithType:
                                 characteristicUUID properties:CBCharacteristicPropertyNotify
                                                                        value:nil permissions:CBAttributePermissionsReadable];
    // Creates the service UUID
    CBUUID *serviceUUID = [CBUUID UUIDWithString:kServiceUUID];
    // Creates the service and adds the characteristic to it
    self.customService = [[CBMutableService alloc] initWithType:serviceUUID
                                                        primary:YES];
    // Sets the characteristics for this service
    [self.customService setCharacteristics:
  @[self.customCharacteristic]];
    // Publishes the service
    [self.cbPeripheralManager addService:self.customService];
}


- (void)peripheralManager:(CBPeripheralManager *)peripheral
            didAddService:(CBService *)service error:(NSError *)error {
    if (error == nil) {
        // Starts advertising the service
        [self.cbPeripheralManager startAdvertising:
  @{ CBAdvertisementDataLocalNameKey :
         @"ICServer", CBAdvertisementDataServiceUUIDsKey :
         @[[CBUUID UUIDWithString:kServiceUUID]] }];
    }
    
}





@end

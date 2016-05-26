//
//  ViewController.m
//  Blueclient
//
//  Created by VcaiTec on 15/12/30.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

static NSString * const kServiceUUID = @"880D4921-631B-4D3D-899D-D6BB8E268D80";
static NSString * const kCharacteristicUUID = @"98AC34BE-BF82-49B9-995D-9CE7E06E7EE3";

@interface ViewController ()<CBCentralManagerDelegate,
CBPeripheralDelegate>

@property (nonatomic, strong) CBCentralManager *manager;
@property (nonatomic, strong) NSMutableData *data;
@property (nonatomic, strong) CBPeripheral *peripheral;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.manager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)centralManagerDidUpdateState:
(CBCentralManager *)central {
//    @[ [CBUUID UUIDWithString:kServiceUUID] ]

    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
            // Scans for any peripheral
            [self.manager scanForPeripheralsWithServices:nil
                                                 options:@{CBCentralManagerScanOptionAllowDuplicatesKey :
                                                               @NO }];
            break;
        default:
            NSLog(@"Central Manager did change state");
            break;
    }
}

- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary *)advertisementData
                  RSSI:(NSNumber *)RSSI {
    // Stops scanning for peripheral
//    [self.manager stopScan];
//    if (self.peripheral != peripheral) {
//        self.peripheral = peripheral;
        NSLog(@"peripheral %@ RSSI %@ services %@ distance %.f", peripheral,RSSI,peripheral.services,[self calcDistByRSSI:[RSSI intValue]]);
        // Connects to the discovered peripheral
//        [self.manager connectPeripheral:peripheral options:nil];
//    }
//    [peripheral discoverServices:nil];
}

- (void)centralManager:(CBCentralManager *)central
  didConnectPeripheral:(CBPeripheral *)peripheral {
    // Clears the data that we may already have
    [self.data setLength:0];
    // Sets the peripheral delegate
    [self.peripheral setDelegate:self];
    // Asks the peripheral to discover the service
    [self.peripheral discoverServices:nil];
}

//统计该连接的service 个数

- (void)peripheral:(CBPeripheral *)aPeripheral didDiscoverServices:(NSError *)error {
    if (error) {
        NSLog(@"Error discovering service:%@", [error localizedDescription]);
//        [self cleanup];
        return;
    }
    for (CBService *service in aPeripheral.services) {
        NSLog(@"Service found with UUID: %@",service.UUID);
//        // Discovers the characteristics for a given service
//        if ([service.UUID isEqual:[CBUUID UUIDWithString:kServiceUUID]]) {
//            [self.peripheral discoverCharacteristics:@[[CBUUID UUIDWithString:kCharacteristicUUID]] forService:service];
//            
//        }
        
    }
    
}
              
- (void)peripheral:(CBPeripheral *)peripheral didDiscoverCharacteristicsForService:(CBService *)service error:(NSError *)error
{
    if (error) {
        NSLog(@"Error discovering characteristic:%@", [error localizedDescription]);
//        [self cleanup];
        return;
    }
    if ([service.UUID isEqual:[CBUUID UUIDWithString:kServiceUUID]])
    {
        for (CBCharacteristic *characteristic in service.characteristics) {
            if ([characteristic.UUID isEqual:[CBUUID UUIDWithString:kCharacteristicUUID]]) {
                  [peripheral setNotifyValue:YES 
                           forCharacteristic:characteristic];
              }
        }
    }
}

- (float)calcDistByRSSI:(int)rssi {
    int iRssi = abs(rssi);
    float power = (iRssi-59)/(10*2.0);
    return pow(10, power);
}

@end

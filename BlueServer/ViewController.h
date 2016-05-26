//
//  ViewController.h
//  BlueServer
//
//  Created by VcaiTec on 15/12/30.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(nonatomic,strong)CBPeripheralManager *cbPeripheralManager;

@property(nonatomic,strong)CBMutableCharacteristic *customCharacteristic;

@property(nonatomic,strong)CBMutableService *customService;
@end


//
//  ViewController.h
//  GPSSpeed
//
//  Created by VcaiTec on 15/12/30.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong,nonatomic)CLLocationManager *cllocationManager;
@property(nonatomic,weak)IBOutlet UILabel *speedScreen;

@end


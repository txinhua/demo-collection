//
//  ViewController.m
//  CoreMotionDemo
//
//  Created by VcaiTec on 15/12/31.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize motionManager;
@synthesize accelerometerLabel;
@synthesize gyroscopeLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.motionManager = [[CMMotionManager alloc] init];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    //加速计
    if (motionManager.accelerometerAvailable) {
        motionManager.accelerometerUpdateInterval = 1.0/10.0;
        [motionManager startAccelerometerUpdatesToQueue:queue withHandler:^(CMAccelerometerData *accelerometerData,NSError *error){
            NSString *labelText;
            if (error) {
                [motionManager stopAccelerometerUpdates];
                labelText = [NSString stringWithFormat:@"Accelerometer encountered error: %@",error];
            }else{
                labelText = [NSString stringWithFormat:@"加速计\nx: %+.2f\ny: %+.2f\nz: %+.2f",accelerometerData.acceleration.x,accelerometerData.acceleration.y,accelerometerData.acceleration.z];
            }
            [accelerometerLabel performSelectorOnMainThread:@selector(setText:) withObject:labelText waitUntilDone:NO];
        }];
    }else{
        accelerometerLabel.text = @"This device has no accelerometer.";
    }
    //陀螺仪
    if (motionManager.gyroAvailable) {
        motionManager.gyroUpdateInterval = 1.0/10.0;
        [motionManager startGyroUpdatesToQueue:queue withHandler:^(CMGyroData *gyroData,NSError *error){
            NSString *labelText;
            if (error) {
                [motionManager stopGyroUpdates];
                labelText = [NSString stringWithFormat:@"Gyroscope encountered error: %@",error];
            }else{
                labelText = [NSString stringWithFormat:@"陀螺仪\nx: %+.2f\ny: %+.2f\nz: %+.2f",gyroData.rotationRate.x,gyroData.rotationRate.y,gyroData.rotationRate.z];
            }
            [gyroscopeLabel performSelectorOnMainThread:@selector(setText:) withObject:labelText waitUntilDone:NO];
        }];
    }else{
        gyroscopeLabel.text = @"This device has no gyroscope";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  ViewController.m
//  GPSSpeed
//
//  Created by VcaiTec on 15/12/30.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CLLocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cllocationManager =[[CLLocationManager alloc]init];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    // 如果可以利用本地服务时
    if([CLLocationManager locationServicesEnabled]){
        // 接收事件的实例
        self.cllocationManager.delegate = self;
        // 发生事件的的最小距离间隔（缺省是不指定）
        self.cllocationManager.distanceFilter = kCLDistanceFilterNone;
        // 精度 (缺省是Best)
        self.cllocationManager.desiredAccuracy = kCLLocationAccuracyBest;
        // 开始测量
        NSComparisonResult orderResult =[[[UIDevice currentDevice] systemVersion]compare:@"8.0" options:NSNumericSearch];
        if (orderResult==NSOrderedAscending) {
        }else{
            [self.cllocationManager requestWhenInUseAuthorization];
        }
        [self.cllocationManager startUpdatingLocation];
    }
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.cllocationManager stopUpdatingLocation];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 如果GPS测量成果以下的函数被调用
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    CLLocationSpeed speed = newLocation.speed;
    if (speed>0) {
       
       self.speedScreen.text = [NSString stringWithFormat:@"%.f km/h",speed*3.6];
        
    }else{
       self.speedScreen.text = [NSString stringWithFormat:@"%.f km/h",0*3.6];
    }
    
}

// 如果GPS测量失败了，下面的函数被调用
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
    NSLog(@"%@",[error localizedDescription]);
    self.speedScreen.text = [NSString stringWithFormat:@"%.f km/h",0.0f];
}

@end

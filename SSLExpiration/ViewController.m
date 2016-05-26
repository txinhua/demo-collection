//
//  ViewController.m
//  SSLExpiration
//
//  Created by VcaiTech on 16/4/5.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"https://www.vcainfo.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.sslWebView loadRequest:request];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end

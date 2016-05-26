//
//  ViewController.m
//  SignLetionDemo
//
//  Created by VcaiTec on 16/1/8.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //正则表达式测试
//    NSString *orgStr = @"10. 6";
//    NSString *numericStr = [self doregx:orgStr];
//    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString *)doregx:(NSString *)orgStr{
    
    NSRange range = [orgStr rangeOfString:@"^[1-9]+(\\d?.?\\d)*$" options:NSRegularExpressionSearch];
    
    if (range.location != NSNotFound) {
        NSLog(@"%@", [orgStr substringWithRange:range]);
        return [orgStr substringWithRange:range];
    }
    
    return nil;
    
}

@end

//
//  ViewController.m
//  RemoveTextFieldGestures
//
//  Created by VcaiTech on 16/5/4.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSInteger i = [self.textField.gestureRecognizers count] - 1; i >= 0; --i)
    {
        [self.textField removeGestureRecognizer:[self.textField.gestureRecognizers objectAtIndex:i]];
    }
    
    NSString *hanziText = @"123";
    if ([hanziText length]) {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:hanziText];
        //带第几声
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            NSLog(@"pinyin: %@", ms);
        }
        //不带第几声
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            NSLog(@"pinyin: %@", ms);
        }  
    }
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

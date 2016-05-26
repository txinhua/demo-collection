//
//  NSString+Trim.m
//  DemoCollection
//
//  Created by VcaiTec on 16/2/22.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "NSString+Trim.h"

@implementation NSString (Trim)

- (NSString *)trimString {
    
    NSMutableString *mStr = [self mutableCopy];
    
    CFStringTrimWhitespace((CFMutableStringRef)mStr);
    
    NSString *result = [mStr copy];
    
    return result;
}

@end

//
//  AssComUser.m
//  DemoCollection
//
//  Created by VcaiTec on 16/1/30.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "AssComUser.h"

@implementation AssComUser
+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{
             @"name": @"name",
             @"age": @"age",
             @"companyName":@"companyName"
             };
    
}
@end

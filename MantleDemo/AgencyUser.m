//
//  AgencyUser.m
//  DemoCollection
//
//  Created by VcaiTec on 16/1/30.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "AgencyUser.h"

@implementation AgencyUser

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{
             @"name": @"name",
             @"age": @"age",
             @"department":@"department"
             };
    
}

@end

//
//  User.m
//  DemoCollection
//
//  Created by VcaiTec on 16/1/29.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "User.h"
#import "AgencyUser.h"
#import "AssComUser.h"

@implementation User

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    
    return @{
             @"name": @"name",
             @"age": @"age"
             };
    
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;
        
    return self;
}


+ (Class)classForParsingJSONDictionary:(NSDictionary *)JSONDictionary {
    
    if (JSONDictionary[@"department"] != nil) {
        return AgencyUser.class;
    }
    
    if (JSONDictionary[@"companyName"] != nil) {
        return AssComUser.class;
    }
    
    return self;
}





@end

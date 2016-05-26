//
//  User.h
//  DemoCollection
//
//  Created by VcaiTec on 16/1/29.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

@interface User : MTLModel <MTLJSONSerializing>

@property(nonatomic,copy,readonly)NSString *name;
@property(nonatomic,assign,readonly)NSInteger age;

@end

//
//  DistrictModel.h
//  DemoCollection
//
//  Created by VcaiTech on 16/3/23.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bizcircle : NSObject

@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *value;

@end

@interface DistrictModel : NSObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *value;
@property(nonatomic,strong)NSArray <Bizcircle *> *bizcircles;

@end

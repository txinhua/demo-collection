//
//  OrderDetailHeadView.h
//  DemoCollection
//
//  Created by VcaiTec on 16/3/3.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderInfo : NSObject
@property(nonatomic,strong)NSNumber *payNum;
@property(nonatomic,strong)NSNumber *orderPrice;
@property(nonatomic,strong)NSString *orderContent;
@property(nonatomic,strong)NSString *orderId;
@end

@interface OrderDetailHeadView : UIView
-(void)fillOrderWithInfo:(OrderInfo *)info;
@end

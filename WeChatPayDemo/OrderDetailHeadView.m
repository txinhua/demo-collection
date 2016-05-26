//
//  OrderDetailHeadView.m
//  DemoCollection
//
//  Created by VcaiTec on 16/3/3.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "OrderDetailHeadView.h"
#import "NSString+Size.h"

#define BOTTOM_VIEW_HEIGHT  45
#define ITEM_SPACE_HEIGHT 10
#define HEAD_VIEW_HEIGHT  100

@interface OrderDetailHeadView ()
{
    UIView *headView;
    
    UIView *bottomView;
    
    UILabel *cdAddress;
    
    UILabel *priceTag;
    
    UILabel *price;
    
    UILabel *payAmount;
    
}
@end

@implementation OrderDetailHeadView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor colorWithRed:239/255.0 green:239/255.0 blue:246/255.0 alpha:1.0f];
        [self setUpViews];
        
    }
    return self;
}

-(void)setUpViews{
    
    headView =[[UIView alloc]initWithFrame:CGRectMake(0, ITEM_SPACE_HEIGHT, self.frame.size.width, HEAD_VIEW_HEIGHT)];
    headView.backgroundColor =[UIColor whiteColor];
    [self addSubview:headView];
    
    bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, ITEM_SPACE_HEIGHT+headView.frame.size.height+ITEM_SPACE_HEIGHT, self.frame.size.width, BOTTOM_VIEW_HEIGHT)];
    bottomView.backgroundColor =[UIColor whiteColor];
    [self addSubview:bottomView];
    UIView *sepLine =[[UIView alloc]initWithFrame:CGRectMake(0, bottomView.frame.size.height-1, bottomView.frame.size.width, 1)];
    sepLine.backgroundColor =[UIColor colorWithRed:210/255.0 green:210/255.0 blue:210/255.0 alpha:1.0];
    [bottomView addSubview:sepLine];
    
    UILabel *cdAddressTag =[[UILabel alloc]initWithFrame:CGRectMake(20, ITEM_SPACE_HEIGHT-2, 65, 19)];
    [cdAddressTag setFont:[UIFont systemFontOfSize:15]];
    [cdAddressTag setBackgroundColor:[UIColor clearColor]];
    cdAddressTag.text = @"产证地址:";
    [headView addSubview:cdAddressTag];
    
    cdAddress =[[UILabel alloc]initWithFrame:CGRectMake(20+cdAddressTag.frame.size.width+ITEM_SPACE_HEIGHT, ITEM_SPACE_HEIGHT-3, headView.frame.size.width-ITEM_SPACE_HEIGHT-(20+cdAddressTag.frame.size.width+ITEM_SPACE_HEIGHT), 19)];
    [cdAddress setFont:[UIFont systemFontOfSize:15]];
    [cdAddress setBackgroundColor:[UIColor clearColor]];
    cdAddress.numberOfLines = 0;
    cdAddress.lineBreakMode = NSLineBreakByWordWrapping;
    [headView addSubview:cdAddress];
    
    priceTag =[[UILabel alloc]initWithFrame:CGRectMake(20, headView.frame.size.height-ITEM_SPACE_HEIGHT-17, 65, 19)];
    [priceTag setFont:[UIFont systemFontOfSize:15]];
    [priceTag setBackgroundColor:[UIColor clearColor]];
    priceTag.text = @"订单金额:";
    [headView addSubview:priceTag];
    
    
    price = [[UILabel alloc]initWithFrame:CGRectMake(20+priceTag.frame.size.width+ITEM_SPACE_HEIGHT, headView.frame.size.height-ITEM_SPACE_HEIGHT-17, headView.frame.size.width-ITEM_SPACE_HEIGHT-(20+priceTag.frame.size.width+ITEM_SPACE_HEIGHT), 19)];
    [price setTextColor:[UIColor colorWithRed:74/255.0 green:121/255.0 blue:181/255.0 alpha:1.0]];
    [price setFont:[UIFont systemFontOfSize:15]];
    [price setBackgroundColor:[UIColor clearColor]];
    [headView addSubview:price];
    
    
    UILabel *payTag = [[UILabel alloc]initWithFrame:CGRectMake(20, (bottomView.frame.size.height-19)*0.5, 65, 19)];
    [payTag setFont:[UIFont systemFontOfSize:15]];
    [payTag setBackgroundColor:[UIColor clearColor]];
    payTag.text = @"实付金额:";
    [bottomView addSubview:payTag];
    
    payAmount = [[UILabel alloc]initWithFrame:CGRectMake(20+payTag.frame.size.width+ITEM_SPACE_HEIGHT, (bottomView.frame.size.height-19)*0.5, bottomView.frame.size.width-ITEM_SPACE_HEIGHT-(20+payTag.frame.size.width+ITEM_SPACE_HEIGHT), 19)];
    [payAmount setTextColor:[UIColor colorWithRed:248/255.0 green:32/255.0 blue:73/255.0 alpha:1.0]];
    [payAmount setFont:[UIFont systemFontOfSize:15]];
    [payAmount setBackgroundColor:[UIColor clearColor]];
    [bottomView addSubview:payAmount];
    
}

-(void)fillOrderWithInfo:(OrderInfo *)info{
    
    CGSize textSize = [info.orderContent textSizeWithFont:[UIFont systemFontOfSize:19] constrainedToSize:CGSizeMake(cdAddress.frame.size.width, 0) lineBreakMode:NSLineBreakByWordWrapping];
    [cdAddress setFrame:CGRectMake(cdAddress.frame.origin.x, cdAddress.frame.origin.y, cdAddress.frame.size.width, textSize.height)];
    cdAddress.text = info.orderContent;
    
    [price setText:[NSString stringWithFormat:@"￥ %.2f",[info.orderPrice doubleValue]]];
    
    [payAmount setText:[NSString stringWithFormat:@"￥ %.2f",[info.payNum doubleValue]]];
    
}

@end

//订单信息的实现
@implementation OrderInfo

@end

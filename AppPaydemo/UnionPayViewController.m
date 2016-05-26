//
//  UnionPayViewController.m
//  DemoCollection
//
//  Created by VcaiTec on 16/2/26.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "UnionPayViewController.h"
#import "UPAPayPluginDelegate.h"

#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#import "UPAPayPlugin.h"
#import <PassKit/PassKit.h>

#define kVCTitle          @"商户测试"
#define kBtnFirstTitle    @"获取订单，开始测试"
#define kWaiting          @"正在获取TN,请稍后..."
#define kNote             @"提示"
#define kConfirm          @"确定"
#define kErrorNet         @"网络错误"
#define kResult           @"支付结果：%@"

#define KBtn_width       80
#define KBtn_height      40
#define KXOffSet         (self.view.frame.size.width - KBtn_width) / 2
#define KYOffSet         120
#define kWithNavigation  44
#define kAppleMechantID        @"merchant.com.am.gu"

@interface UnionPayViewController ()<UPAPayPluginDelegate, UIAlertViewDelegate>

@end

@implementation UnionPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)applePayAction:(id)sender{


}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

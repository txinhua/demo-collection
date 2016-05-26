//
//  DetailViewController.m
//  DemoCollection
//
//  Created by VcaiTec on 16/3/2.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "DetailViewController.h"
#import "OrderTableViewCell.h"
#import "OrderDetailHeadView.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    OrderDetailHeadView *tableHeadInfoView;
}
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"订单确认";
    [self.tableOrder registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"payWays"];
    OrderInfo *orderInfo = [[OrderInfo alloc]init];
    [orderInfo setPayNum:@45];
    [orderInfo setOrderContent:@"嘉定区和静路1188弄1号102室"];
    [orderInfo setOrderId:@"2016030314485325501"];
    [orderInfo setOrderPrice:@45];
    tableHeadInfoView = [[OrderDetailHeadView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 165)];
    [tableHeadInfoView fillOrderWithInfo:orderInfo];
    [self.tableOrder setTableHeaderView:tableHeadInfoView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentify = @"payWays";
    OrderTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentify owner:self options:nil] objectAtIndex:0];
    }
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


@end

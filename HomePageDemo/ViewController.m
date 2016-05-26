//
//  ViewController.m
//  HomePageDemo
//
//  Created by VcaiTec on 15/12/29.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import "ViewController.h"
#import "NSString+SNFoundation.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UILabel *label;
    UIView *navBgView;
}
@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //从url地址中解析出字典的方法 demo
//    NSString *url = @"http://service_address/version/service_method?token=acd6ca652f3eca7a8dac31e3b40830cd2bab319c&timestamp=1441002131059&nonce=dCKm&un=baoyuan&case_id=10086";
//    
//    NSRange range = [url rangeOfString:@"?"];
//    if (range.location != NSNotFound)
//    {
//        NSString *result = [url substringFromIndex:range.location+1];
//        NSDictionary *params = [result queryDictionaryUsingEncoding:NSUTF8StringEncoding];
//        NSLog(@"%@",[params description]);
//    }
    homePageTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    homePageTable.dataSource = self;
    homePageTable.delegate = self;
    [homePageTable setRowHeight:100];
    [homePageTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UIView *headView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 264)];
    headView.backgroundColor = [UIColor redColor];
    [homePageTable setTableHeaderView:headView];
    [self.view addSubview:homePageTable];
    
    //初始化渐变层
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, 64);
    [self.view.layer addSublayer:self.gradientLayer];
    
    //设置渐变颜色方向
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(0, 1);
    
    //设定颜色组
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor clearColor].CGColor];
    
    //设定颜色分割点
    self.gradientLayer.locations = @[@(0.0f) ,@(1.0f)];
    
    navBgView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    navBgView.backgroundColor =[UIColor clearColor];
    [self.view addSubview:navBgView];
    navBgView.alpha = 0;
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeSystem];
    [button setFrame:CGRectMake(10, 27, 40, 30)];
    [button addTarget:self action:@selector(clickeAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"点我" forState:UIControlStateNormal];
    [navBgView addSubview:button];
    
    UILabel *navLabel =[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)*0.5, 30, 200, 24)];
    navLabel.textAlignment = NSTextAlignmentCenter;
    navLabel.textColor =[UIColor blackColor];
    navLabel.font =[UIFont systemFontOfSize:22];
    navLabel.backgroundColor = [UIColor clearColor];
    navLabel.text = @"滑动效果测试";
    [navBgView addSubview:navLabel];
    
    
    UIView *headBgView =[[UIView alloc]initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, 64)];
    headBgView.backgroundColor =[UIColor clearColor];
    [headView addSubview:headBgView];
    
    UIButton *button_h =[UIButton buttonWithType:UIButtonTypeSystem];
    [button_h setFrame:CGRectMake(10, 27, 40, 30)];
    [button_h addTarget:self action:@selector(clickeAction) forControlEvents:UIControlEventTouchUpInside];
    [button_h setTitle:@"点我" forState:UIControlStateNormal];
    [headBgView addSubview:button_h];
    
    label =[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-200)*0.5, 30, 200, 24)];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor =[UIColor whiteColor];
    label.font =[UIFont systemFontOfSize:22];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"滑动效果测试";
    [headBgView addSubview:label];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectioc{
//    return 64;
//}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    
//    
//    return label;
//}


#pragma mark -
#pragma mark scroll delagate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    NSLog(@"%.f",scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y > 116 && scrollView.contentOffset.y<200) {
        CGFloat rate = (scrollView.contentOffset.y-116)*1.0/84;
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:222.0/255
                                                                   green:222.0/255
                                                                    blue:222.0/255                                                                   alpha:rate*0.8].CGColor,
                                      (__bridge id)[UIColor colorWithRed:222.0/255
                                                                   green:222.0/255
                                                                    blue:222.0/255                                                                   alpha:rate*0.8].CGColor];
        navBgView.alpha = 0;
        //定时改变分割点
        self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
        if (scrollView.contentOffset.y>156) {
            label.textColor =[UIColor blackColor];
        }else if(scrollView.contentOffset.y < 166){
            label.textColor =[UIColor whiteColor];
        }
    }else if (scrollView.contentOffset.y >= 200){
        navBgView.alpha = 1;
        
        self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:222.0/255
                                                                   green:222.0/255
                                                                    blue:222.0/255                                                                   alpha:1].CGColor,
                                      (__bridge id)[UIColor colorWithRed:222.0/255
                                                                   green:222.0/255
                                                                    blue:222.0/255                                                                   alpha:1].CGColor];
        
        //定时改变分割点
        self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
    }else{
        navBgView.alpha = 0;
        
        self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                      (__bridge id)[UIColor clearColor].CGColor];
        
        //定时改变分割点
        self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
    }
    
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
   
    
}

-(void)clickeAction{
    NSLog(@"啊");
}









@end

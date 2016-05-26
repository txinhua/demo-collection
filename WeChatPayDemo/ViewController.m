//
//  ViewController.m
//  WeChatPayDemo
//
//  Created by VcaiTec on 16/3/2.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "DetailViewController.h"
#import "AboutViewController.h"

@interface ViewController ()
{
    NSTimer *changTextTimer;
    float totalPrice;
    float amountPrice ;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    UIFont *font = [UIFont boldSystemFontOfSize:18.0];
    self.navigationController.navigationBar.titleTextAttributes=@{NSFontAttributeName:font,NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.navigationController.navigationBar.barStyle = UIStatusBarStyleDefault;
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    self.title = @"返回";
    [super viewDidLoad];
    
    totalPrice  = 20000.00f;
    
    amountPrice = totalPrice/5/100;
    
    self.numberCountLabel.text = [NSString stringWithFormat:@"%.2f",totalPrice];
    
    changTextTimer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changText) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)changText{
    
    self.numberCountLabel.text = [NSString stringWithFormat:@"%.2f",amountPrice];
    if (amountPrice == totalPrice) {
        [changTextTimer invalidate];
    }else{
        amountPrice += totalPrice/5/100;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)submitAction:(id)sender{
    
    DetailViewController *detailViewController =[self loadViewControllerWithStoryBoardId:@"DetailView"];
    [self.navigationController pushViewController:detailViewController animated:NO];
}

-(IBAction)aboutAction:(id)sender{
    
    AboutViewController *detailViewController =[self loadViewControllerWithStoryBoardId:@"AboutView"];
    [self.navigationController pushViewController:detailViewController animated:NO];

}


-(id)loadViewControllerWithStoryBoardId:(NSString *)identify{
    
    AppDelegate *delegate =(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    return [delegate.storyboard instantiateViewControllerWithIdentifier:identify];
    
}

@end

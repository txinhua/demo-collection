//
//  ViewController.m
//  IFontDemo
//
//  Created by VcaiTech on 16/3/21.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"
//#import "IconFontToolBar+IconFont.h"

@interface ViewController ()
{
//    IconFontToolBar *bottomToolBar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    UIFont *iconfont = [UIFont fontWithName:@"iconfont" size: 26];
//    self.fontLabel.font = iconfont;
//    
//    self.fontLabel.text = @"\U0000e605";
//    
//    bottomToolBar = [[IconFontToolBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
//    
//    [bottomToolBar setBackgroundColor:[UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0]];
//    
//    [self.view addSubview:bottomToolBar];
//    
//    ICFontButtonConfig *config1 = [[ICFontButtonConfig alloc]initWithTitle:@"test1" titleFont:[UIFont systemFontOfSize:12] iconFontName:@"iconfont" iconCode:@"\U0000e605" iconFontSize:26 buttonSelector:@selector(doCaculator:) sender:self];
//    
//    [bottomToolBar setIconFontItems:@[config1,config1,config1,config1,config1]];
//    
//    [bottomToolBar setSelectedItem:0];
    
    
//    UITabBar *tabBar = [[UITabBar alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)];
//    
//    [tabBar setItems:@[]];
//    
//    UITabBarItem *tabBarItem = [[UITabBarItem alloc]init];
//    [tabBarItem setTitlePositionAdjustment:UIOffsetMake(0,-20)];
//    [tabBarItem setTitleTextAttributes:@{} forState:UIControlStateNormal];
//    [tabBarItem setTitleTextAttributes:@{} forState:UIControlStateSelected];
//    [tabBarItem setTitle:@"\U0000e605"];
//    tabBarItem seti
    
    
//    //读取Plist文件
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"ljDistrictAndSubway" ofType:@"plist"];
    NSDictionary *sh_city = [NSDictionary dictionaryWithContentsOfFile:filePath];
    NSArray *districts = [[sh_city objectForKey:@"310000"] objectForKey:@"district"];
    NSMutableString *districtInfo = [NSMutableString string];
    for (NSDictionary *district in districts) {
        if (![district objectForKey:@"bizcircle"]) {
            continue;
        }
        NSString *disName = [district objectForKey:@"name"];
        NSString *disValue = [district objectForKey:@"value"];
        
        NSArray *items = [district objectForKey:@"bizcircle"];
        for (NSDictionary *item in items) {
            NSString *itemName = [item objectForKey:@"name"];
            NSString *itemValue = [item objectForKey:@"value"];
            [districtInfo appendFormat:@"%@|%@|%@|%@\r\n",disName,disValue,itemName,itemValue];
        }
    }
    NSLog(@"%@",districtInfo);
    NSArray *paths;
    NSString  *arrayPath;
    
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                NSUserDomainMask, YES);
    arrayPath = [[paths objectAtIndex:0]
                 stringByAppendingPathComponent:@"district.txt"];
    NSError *error = nil;
    
    [districtInfo writeToFile:arrayPath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    
    
    
    
    
}


//-(void)doCaculator:(UIView *)sender{
//    [bottomToolBar setSelectedItem:sender.tag];
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

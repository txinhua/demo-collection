//
//  ViewController.m
//  MantleDemo
//
//  Created by VcaiTec on 16/1/29.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"
#import "User.h"
#import "AgencyUser.h"
#import "AssComUser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *userDic = @{    @"name": @"tyrone",
                                  @"age": @26
                             };
    NSError *error = nil;
    
    User *user = [MTLJSONAdapter modelOfClass:User.class fromJSONDictionary:userDic error:&error];
    
    
    NSDictionary *agencyUserDic = @{
                                     @"name": @"wendy",
                                     @"age": @28,
                                     @"department":@"客服事业部"
                                  };
    NSError *error1 = nil;
    
    AgencyUser *agencyUser = [MTLJSONAdapter modelOfClass:User.class fromJSONDictionary:agencyUserDic error:&error1];
    
    
    
    NSDictionary *assComUserDic = @{
                                  @"name": @"haorong",
                                  @"age": @24,
                                  @"companyName":@"立信"
                                  };
    NSError *error2 = nil;
    
    AssComUser *assComUser = [MTLJSONAdapter modelOfClass:User.class fromJSONDictionary:assComUserDic error:&error2];
    
    NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:assComUser];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

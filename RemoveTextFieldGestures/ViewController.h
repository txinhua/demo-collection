//
//  ViewController.h
//  RemoveTextFieldGestures
//
//  Created by VcaiTech on 16/5/4.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

@property(nonatomic,weak)IBOutlet UITextField *textField;

@end


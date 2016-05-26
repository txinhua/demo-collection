//
//  ViewController.m
//  ALAssetDemo
//
//  Created by VcaiTec on 16/1/4.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "ViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//相机
-(IBAction)takePohots:(id)sender{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];//初始化
        picker.delegate = self;
        picker.allowsEditing = NO;//设置可编辑
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            
        }];
    }else{
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:nil message:@"该设备不支持拍照" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        [alert show];
        alert = nil;
    }
    
}


#pragma mark imagePicker delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage* imageOrg = [info objectForKey: @"UIImagePickerControllerOriginalImage"];
    __weak ViewController *weakself = self;
    ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc]init];
    [assetsLibrary writeImageToSavedPhotosAlbum:imageOrg.CGImage orientation:(ALAssetOrientation)imageOrg.imageOrientation completionBlock:^(NSURL *assetURL, NSError *error) {
        [assetsLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset) {
            NSData *data = [weakself dataFromALAsset:asset];
            
        } failureBlock:^(NSError *error) {
            
        }];
        [weakself dismissViewControllerAnimated:YES completion:nil];
    }];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

-(NSData *)dataFromALAsset:(ALAsset *)asset
{
    ALAssetRepresentation *rep = [asset defaultRepresentation];
    NSDictionary *medata = rep.metadata;
    Byte *buffer = (Byte *)malloc((NSInteger)rep.size);
    NSUInteger buffered = [rep getBytes:buffer fromOffset:0 length:(NSInteger)rep.size error:nil];
    return [NSData dataWithBytesNoCopy:buffer length:buffered freeWhenDone:YES];
}

@end

//
//  ViewController.h
//  RadarParty
//
//  Created by VcaiTec on 15/12/30.
//  Copyright © 2015年 Tang guifu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@end

@protocol RDDRotationControlSurfaceDelegate <NSObject>
@optional

-(void)trackingDidBeginAtAbsoluteAngle:(CGFloat)angle;
-(void)rotationDidChangeByAngle:(CGFloat)angle;            // Just report the change since the last cycle.
-(void)trackingDidEndAtAbsoluteAngle:(CGFloat)angle withDeceleration:(BOOL)decelerating; // If deceleration is YES, then the delegate knows that subsequent rotationDidChangeByAngle calls are coming from the deceleration.
-(void)decelerationDidEnd;
-(void)trackingCanceled;

@end


@interface RDDRotationControlSurface : UIView {
    id<RDDRotationControlSurfaceDelegate> IBOutlet __unsafe_unretained delegate;
}

@property (nonatomic, unsafe_unretained) id<RDDRotationControlSurfaceDelegate> delegate;
@property (assign) BOOL inertiaEnabled;

@end


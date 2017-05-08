//
//  MaskView.h
//  Toby
//
//  Created by small T on 17/4/1.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MaskView : UIView<UIGestureRecognizerDelegate>

-(instancetype)initWithFrame:(CGRect)frame;
+(instancetype)makeViewWithMask:(CGRect)frame andView:(UIView*)view;
+(instancetype)makeViewWithMask:(CGRect)frame andView:(UIView*)view withView1:(UIView*)view1 withView2:(UIView *)view2 withView3:(UIView*)view3 withView4:(UIView*)view4 withView5:(UIView*)view5 withView6:(UIView *)view6 withView7:(UIView*)view7 withView8:(UIView*)view8;
-(void)block:(void(^)())block;
@end

//
//  MaskView.m
//  Toby
//
//  Created by small T on 17/4/1.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "MaskView.h"
#import "AppDelegate.h"
@implementation MaskView

//初始化View以及添加单击蒙层逻辑
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.frame = frame;
        //在这里需要用下边的方法设定Alpha值,第一种方法会使子视图的Alpha值和父视图的一样.
        //        self.backgroundColor = [UIColor colorWithRed:(40/255.0f) green:(40/255.0f) blue:(40/255.0f) alpha:1.0f];
        self.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:1];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}
//蒙层添加到Window上
+(instancetype)makeViewWithMask:(CGRect)frame andView:(UIView*)view{
    MaskView *mview = [[self alloc]initWithFrame:frame];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.window addSubview:mview];
    [mview addSubview:view];
    
    return mview;
}

//蒙层添加到Window上
+(instancetype)makeViewWithMask:(CGRect)frame andView:(UIView*)view withView1:(UIView*)view1 withView2:(UIView *)view2 withView3:(UIView*)view3 withView4:(UIView*)view4 withView5:(UIView*)view5 withView6:(UIView *)view6 withView7:(UIView*)view7 withView8:(UIView*)view8{
    MaskView *mview = [[self alloc]initWithFrame:frame];
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [delegate.window addSubview:mview];
     [mview addSubview:view];
     [mview addSubview:view1];
     [mview addSubview:view2];
     [mview addSubview:view3];
     [mview addSubview:view4];
     [mview addSubview:view5];
     [mview addSubview:view6];
     [mview addSubview:view7];
     [mview addSubview:view8];
    
    
    return mview;
}





//单击蒙层取消蒙层
-(void)removeView{
    
    [self removeFromSuperview];
    
}
//通过回调取消蒙层
-(void)block:(void(^)())block{
    [self removeFromSuperview];
    block();
}
@end

//
//  DTGTAlertView.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTAlertView : UIView
+ (void)showWithTitle:(NSString *)title andFont:(CGFloat)fontSize andTime:(CGFloat)time  andFrame:(CGRect)customFrame addTarget:(UIView *)superView;
@end

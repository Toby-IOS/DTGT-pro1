//
//  GJLNewPasswordViewController.h
//  Toby
//
//  Created by small T on 17/3/30.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"
@interface GJLNewPasswordViewController : UIViewController
{

    TextField *_phoneNumberField;/**<手机号码*/
    TextField *_identifyingField;/**<验证码*/
    UILabel *_phoneError;/**手机号错误提示*/
    UILabel *_alertLabel;/**验证码错误提示*/
    NSTimer *_timer;/**<时间控制器*/
    NSInteger _time;
    UILabel *_timeLabel;/**<倒计时显示*/
    UIButton *getIdentifyingBnt;/**<获取验证吗*/
    UIButton *nextBnt;/**<下一步按钮*/
    NSString *titleStr;
}
@end

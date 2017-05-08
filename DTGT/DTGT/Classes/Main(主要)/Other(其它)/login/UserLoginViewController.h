//
//  UserLoginViewController.h
//  MallProject
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 jianlong. All rights reserved.
//  登录

#import <UIKit/UIKit.h>
#import "TextField.h"
@interface UserLoginViewController : UIViewController<TextFieldDelegate>{

    TextField *userNameField;/**<用户名*/
    TextField *passWordField;/**<密码*/
    UIButton *autoLoginBnt;/**<自动登录*/
    UIButton *rememberBnt;/**<记住密码*/
    UIImage*bntImageOn;
    UIImage*bntImageOff;
    UIButton *loginBnt;/**<登录按钮*/
    
    UIButton *leftBtn;
    
}
@property (nonatomic, assign) BOOL isStorePassword; //是否保存密码
@property (nonatomic,strong)UISwitch *passSwich;//密码是否显示开关
@property (nonatomic,strong)UIButton *loginBnt;//登录按钮
@end

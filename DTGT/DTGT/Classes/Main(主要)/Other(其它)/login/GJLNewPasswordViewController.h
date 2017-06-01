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

    TextField *oldPasswordField;/**<手机号码*/
    TextField *newPasswordField;/**<验证码*/
    TextField *confirmPasswordField;
    
}
@end

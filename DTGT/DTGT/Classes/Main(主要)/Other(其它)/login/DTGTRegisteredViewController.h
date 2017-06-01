//
//  DTGTRegisteredViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/6/1.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"
@interface DTGTRegisteredViewController : UIViewController<TextFieldDelegate>
@property(strong,nonatomic)TextField *userField;
@property(strong,nonatomic)TextField *passwordField;
@end

//
//  DTGTtransferAccountsViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/31.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"

@interface DTGTtransferAccountsViewController : UIViewController<TextFieldDelegate>

@property(strong,nonatomic)UIImageView *headImgView;
@property(strong,nonatomic)UILabel *moneyLab;
@property(strong,nonatomic)UILabel *myAccountlab;
@property(strong,nonatomic)TextField *otherAccountField;
@property(strong,nonatomic)TextField *transferMoneyField;
@property(strong,nonatomic)TextField *noteField;
@property(strong,nonatomic)UIButton *doneBnt;


@end

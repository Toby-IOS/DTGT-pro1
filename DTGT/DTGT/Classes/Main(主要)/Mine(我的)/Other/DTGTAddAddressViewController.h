//
//  DTGTAddAddressViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"
#import "AdressModel.h"

@interface DTGTAddAddressViewController : UIViewController<UITextViewDelegate>
{

    UITextView *detailedAddressView;
    UILabel *zipCode;
    UILabel *detailedAddressLab;
    UIButton *areBnt;

    TextField *collectionField;
    TextField *phoneNumberField;
    TextField *zipCodeField;
}

@property (nonatomic,strong) AdressModel *model;
@property (nonatomic,strong) NSString *titleString;
@end

//
//  DTGTChangePersonalInfoViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/19.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTChangePersonalInfoViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
   NSString *titleStr;
   NSString* contentStr;
}

-(instancetype)initWithString:(NSString*)titleString withContent:(NSString*)string;

@end

//
//  DTGTIdentityViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/15.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"

@interface DTGTIdentityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,TextFieldDelegate>
{

    TextField *nameField;
    TextField *cardNumberField;

 
}
@property(nonatomic,strong)   UITableView *mainView;
@end

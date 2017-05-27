//
//  DTGTIdentityViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/15.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextField.h"

@interface DTGTIdentityViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,TextFieldDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate>
{

    TextField *nameField;
    TextField *cardNumberField;

    UIActionSheet *avataSeet;
    UIImageView *imageView1;
    UIImageView *imageView2;
    UIImageView *imageView3;
    
    int index;
    
}
@property(nonatomic,strong)   UITableView *mainView;

@end

//
//  DTGTMineViewController.h
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTMineViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{
    
    UIButton *rightBtn;
    UIImageView *topBackView;
    UILabel *loginStateLab;
    UIButton *loginBnt;
    UITableView *mainTableView;
    
    NSArray *array;
    UIButton*logOutBnt;
    NSString *cacheSizeStr;
    UILabel  *cacheLab;
}

@end

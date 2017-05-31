//
//  DTGTaccountBalanceViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/31.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTaccountBalanceViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>{

    UITableView *mainTableView;
    UIButton *queryDetailsBnt;
    UIButton  *extractBnt;
    UIButton  *rechargeBnt;
    
    NSString *balanceStr;
    UILabel  *promptLab;
    UILabel  *balanceLab;
    UILabel *lineLab;
    UILabel *vLine;
    
}


@end

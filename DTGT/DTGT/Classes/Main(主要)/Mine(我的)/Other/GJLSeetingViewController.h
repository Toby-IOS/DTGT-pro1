//
//  GJLSeetingViewController.h
//  Toby
//
//  Created by small T on 17/3/28.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GJLSeetingViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>{
    UITableView *mainTableView;
    NSArray *array;
    UIButton*logOutBnt;
    NSString *cacheSizeStr;
    UILabel  *cacheLab;
}

@end

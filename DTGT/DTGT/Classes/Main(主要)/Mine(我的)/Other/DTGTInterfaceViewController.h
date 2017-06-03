//
//  DTGTInterfaceViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/6/3.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTInterfaceViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>{
    UITableView *mainTableView;
    NSArray *array;
    UILabel *resultLab;
}
@end

//
//  DTGTPersonalViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/15.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTPersonalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{



    UITableView *mainTableView;
    
    NSArray *array;
    UIActionSheet *sexSheet;
    UIActionSheet *avataSeet;
    
    NSArray *provinces;//省份
    NSArray *cities;//城市
    
//    NSString *areaString;//所在地区
//    NSString *provinceStr;
//    NSString *cityStr;
//    UIActionSheet *areaSeet;
    
}

@end

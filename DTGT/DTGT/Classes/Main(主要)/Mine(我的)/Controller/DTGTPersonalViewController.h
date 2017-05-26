//
//  DTGTPersonalViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/15.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTPersonalViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate,UIImagePickerControllerDelegate>{



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
    
    UIImageView *myAvataView;
    UIImageView *myQrView;
//    UILabel *myInfoLab;
    UILabel *myAreaLab;
//    UILabel *myAddressLab;
    UILabel *mySexLab;
//    UILabel *myhobbyLab;
}
//@property(nonatomic,strong)UIImageView *myAvataView;
//@property(nonatomic,strong)  UIImageView *myQrView;
@property(nonatomic,strong)UILabel *myInfoLab;
//@property(nonatomic,strong)UILabel *myAreaLab;
@property(nonatomic,strong)UILabel *myAddressLab;
//@property(nonatomic,strong) UILabel *mySexLab;
@property(nonatomic,strong) UILabel *myhobbyLab;

@end

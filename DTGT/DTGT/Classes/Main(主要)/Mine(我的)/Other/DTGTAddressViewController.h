//
//  DTGTAddressViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdressModel.h"

typedef void (^selectGoodAddressBlock)(AdressModel *model);
@interface DTGTAddressViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate>{

    UIView * emptyView;
    
    NSMutableArray *stateArray;
    NSMutableArray *dataArray;


}
@property(nonatomic,strong)UITableView *maintTbale;
@property(nonatomic,copy)selectGoodAddressBlock  selectAddressBlock;
@end

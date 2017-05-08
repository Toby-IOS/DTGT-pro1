//
//  DTGTHomePageViewController.h
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFScrollView.h"
@interface DTGTHomePageViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,FFScrollViewDelegate>
{
    UITableView *homeTableView;
    NSArray *bannerImgArray;
    NSArray *categoryTitleArray;
    NSArray *categoryImgArray;
    NSArray *productTitleArray;
    NSArray *productImgArray;
    NSArray *productPriceArray;

    UILabel *hedlineLab;
}
@end

//
//  DTGTInformationTableViewCell.h
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyLabel.h"
@interface DTGTInformationTableViewCell : UITableViewCell
@property(nonatomic,strong)UILabel *titleLab;
@property(nonatomic,strong)MyLabel *contentLab;
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,strong) MyLabel*timeLab;
@end

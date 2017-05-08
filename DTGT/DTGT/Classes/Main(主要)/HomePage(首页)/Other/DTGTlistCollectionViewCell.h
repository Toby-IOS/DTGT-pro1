//
//  DTGTlistCollectionViewCell.h
//  DTGT
//
//  Created by small T on 17/4/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCellIdentifier_CollectionViewCell @"DTGTlistCollectionViewCell"

@interface DTGTlistCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel*titleLabel;
@property(nonatomic,strong)UILabel*priceLabel;
@end

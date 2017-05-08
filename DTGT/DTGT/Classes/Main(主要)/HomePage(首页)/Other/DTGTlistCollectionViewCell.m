//
//  DTGTlistCollectionViewCell.m
//  DTGT
//
//  Created by small T on 17/4/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTlistCollectionViewCell.h"


@interface DTGTlistCollectionViewCell()





@end

@implementation DTGTlistCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{

    if(self=[super initWithFrame:frame]){
      self.backgroundColor = [UIColor whiteColor];
        [self configureUI];
    
    }
    return self;


}

-(void)configureUI{

    _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width)];
    [self.contentView addSubview:_imageView];
    
    _titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+5, self.frame.size.width-10, 40)];
    _titleLabel.numberOfLines=0;
    _titleLabel.font=[UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:_titleLabel];
    
    _priceLabel= [[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.width+5+40, self.frame.size.width, 20)];
    _priceLabel.textColor=[UIColor redColor];
    _priceLabel.font=[UIFont systemFontOfSize:16];
    [self.contentView addSubview:_priceLabel];
    
}


@end

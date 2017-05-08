//
//  DTGTHomeTableViewCell.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTHomeTableViewCell.h"
#import "macros.pch"
@implementation DTGTHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createHomeTabViewCell];
    }
    return self;
}

/** 创建分类类目cell*/
- (void)createHomeTabViewCell {
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10,300, 20)];
    //    _titleLabel.backgroundColor=[UIColor redColor];
    _titleLabel.font = [UIFont systemFontOfSize:13];
    _titleLabel.textColor=[UIColor grayColor];
    [self.contentView addSubview:_titleLabel];
    
    _priceLabel= [[UILabel alloc] initWithFrame:CGRectMake(WITCH-60, 10,60, 20)];
    _priceLabel.textColor=[UIColor redColor];
    _priceLabel.font = [UIFont systemFontOfSize:11];
    [self.contentView addSubview:_priceLabel];
    
    _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 30, WITCH, 170) ];
    _imgView.backgroundColor = [UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f];
    [self.contentView addSubview:_imgView];
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

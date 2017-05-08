//
//  DTGTInformationTableViewCell.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTInformationTableViewCell.h"
#import "macros.pch"
@implementation DTGTInformationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createTableViewCell];
    }
    return self;
}
-(void)createTableViewCell{

    _titleLab=[[UILabel alloc] initWithFrame:CGRectMake(5, 5, WITCH-10, 20)];
    _titleLab.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:_titleLab];
    
    _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(5, 30, 80, 50)];
    [self.contentView addSubview:_imgView];
    
    _contentLab=[[UILabel alloc] initWithFrame:CGRectMake(5+80,30, WITCH-10-80, 50)];
    _contentLab.font=[UIFont systemFontOfSize:12];
    _contentLab.numberOfLines=3;
    _contentLab.textColor=[UIColor grayColor];
    [self.contentView addSubview:_contentLab];

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

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

    _titleLab=[[UILabel alloc] initWithFrame:CGRectMake(90, 10, WITCH-95, 20)];
    _titleLab.font=[UIFont boldSystemFontOfSize:14];
    [self.contentView addSubview:_titleLab];
    
    _imgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 70, 70)];
    [self.contentView addSubview:_imgView];
    
    _contentLab=[[MyLabel alloc] initWithFrame:CGRectMake(90,30, WITCH-95, 30)];
    _contentLab.font=[UIFont systemFontOfSize:12];
    _contentLab.numberOfLines=2;
    _contentLab.textColor=ZPJColor(70, 70, 70);
     [_contentLab setContentMode:UIViewContentModeTop];
    [_contentLab setVerticalAlignment:VerticalAlignmentTop];
    [self.contentView addSubview:_contentLab];
   
    _timeLab=[[MyLabel alloc]initWithFrame:CGRectMake(90, 60, WITCH-95, 20)];
    _timeLab.textColor=[UIColor grayColor];
    _timeLab.text=@"2017_98_09 13:23:34";
    [_timeLab setVerticalAlignment:VerticalAlignmentBottom];
    _timeLab.font=[UIFont systemFontOfSize:10];
    [self.contentView addSubview:_timeLab];
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

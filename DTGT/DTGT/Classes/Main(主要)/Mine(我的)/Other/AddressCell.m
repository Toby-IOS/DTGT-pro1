//
//  AddressCell.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "AddressCell.h"
#import "macros.pch"
@implementation AddressCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createAddressCell];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)createAddressCell{

    // 姓名
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(19, 53-5, 80, 20)];
    _nameLabel.font = [UIFont systemFontOfSize:15];
    _nameLabel.textColor=ZPJColor(51, 51, 51);
    [self.contentView addSubview:_nameLabel];
    // 电话
    _phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(120, 53-5, kBoundsSize.width-120, 20)];
    _phoneLabel.font = [UIFont systemFontOfSize:15];
    _phoneLabel.textColor=ZPJColor(51, 51, 51);
    [self.contentView addSubview:_phoneLabel];

    // 收货地址
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(19, 86-10, kBoundsSize.width-19*2, 40)];
    _addressLabel.numberOfLines = 2;
    _addressLabel.textColor=ZPJColor(102, 102, 102);
    _addressLabel.adjustsFontSizeToFitWidth = YES;
    _addressLabel.font= [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_addressLabel];
    // 中间的分割线
    UIImageView *lineImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 121, kBoundsSize.width, 1)];
    lineImg.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [self.contentView addSubview:lineImg];
    // 默认按钮
    _defaultAddressBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _defaultAddressBtn.frame = CGRectMake(14, 14, 25, 25);
    [_defaultAddressBtn setBackgroundImage:[UIImage imageNamed:@"The_shopping_cart_select"] forState:UIControlStateNormal];
    [self.contentView addSubview:_defaultAddressBtn];
    _addressShowLabel = [[UILabel alloc] initWithFrame:CGRectMake(43, 16, 60, 20)];
    _addressShowLabel.textColor=ZPJColor(136, 136, 136);
    _addressShowLabel.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_addressShowLabel];
    // 编辑
    _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _editBtn.frame = CGRectMake(WITCH-90, 3, 44, 44);
    [_editBtn setImage:[UIImage imageNamed:@"edit"] forState:UIControlStateNormal];
    [_editBtn setImage:[UIImage imageNamed:@"edit_down"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:_editBtn];
    // 删除
    _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _deleteBtn.frame = CGRectMake(WITCH-44, 3, 44, 44);
    [_deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [_deleteBtn setImage:[UIImage imageNamed:@"delete_down"] forState:UIControlStateHighlighted];
    [self.contentView addSubview:_deleteBtn];


}
- (void)setChecked:(BOOL)checked {
    if (checked) {
        [_defaultAddressBtn setBackgroundImage:[UIImage imageNamed:@"The_shopping_cart_select"] forState:UIControlStateNormal];
    }else {
        [_defaultAddressBtn setBackgroundImage:[UIImage imageNamed:@"The_shopping_cart_Not_to_choose"] forState:UIControlStateNormal];
    }
    m_checked = checked;
}
@end

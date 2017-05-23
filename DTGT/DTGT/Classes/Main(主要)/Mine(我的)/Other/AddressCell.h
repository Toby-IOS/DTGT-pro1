//
//  AddressCell.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressCell : UITableViewCell
{

    BOOL m_checked;

}

@property (nonatomic,strong) UILabel *nameLabel;/**< 收货人姓名*/
@property (nonatomic,strong) UILabel *phoneLabel;/**< 收货人电话*/
@property (nonatomic,strong) UILabel *addressLabel;/**< 收货地址*/
@property (nonatomic,strong) UIButton *defaultAddressBtn;/**< 默认按钮*/
@property (nonatomic,strong) UIButton *editBtn;/**< 编辑按钮*/
@property (nonatomic,strong) UIButton *deleteBtn;/**< 删除按钮*/
@property (nonatomic,strong) UILabel *addressShowLabel;/**< 默认地址*/

- (void)setChecked:(BOOL)checked;
@end

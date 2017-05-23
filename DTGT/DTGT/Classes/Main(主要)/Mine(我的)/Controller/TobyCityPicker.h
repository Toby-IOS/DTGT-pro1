//
//  TobyCityPicker.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/18.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TobyCityPicker : UIView<UIPickerViewDelegate, UIPickerViewDataSource>

typedef void (^getSelectCity) (NSMutableDictionary *dicSelectCity);
@property (nonatomic,strong) getSelectCity getSelectCity;


@property NSArray *arrProvince;
@property NSArray *arrCity;
@property NSArray *arrDistrict;
@property NSMutableDictionary *dicSelectCityAndCityCode;

@property (strong, nonatomic) UIPickerView *cityPicker;
@property (strong, nonatomic) UILabel *btnSelectShow;

/*block获取选择的城市的信息
 */
- (void)cityPikerGetSelectCity:(getSelectCity)getSelectCity;
- (void)cityPickerSetSelectCity;
@end

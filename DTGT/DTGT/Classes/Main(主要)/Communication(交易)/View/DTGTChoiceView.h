//
//  DTGTChoiceView.h
//  DTGT
//
//  Created by small T on 17/4/24.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGTChoiceView : UIView
@property(nonatomic,weak)UIButton *button;
-(instancetype)initWithFrame:(CGRect)frame;
+(instancetype)selectViewFrame:(CGRect)frame withArray:(NSArray*)arry;
@end

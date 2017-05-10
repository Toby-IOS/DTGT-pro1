//
//  MyLabel.h
//  DTGT
//
//  Created by small T on 17/5/10.
//  Copyright © 2017年 guojianlong. All rights reserved.
//
/*
 实现UILabel的居上对齐，居中对齐，居下对齐。
 
 */



#import <UIKit/UIKit.h>
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;
@interface MyLabel : UILabel
{
@private
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic) VerticalAlignment verticalAlignment;
@end

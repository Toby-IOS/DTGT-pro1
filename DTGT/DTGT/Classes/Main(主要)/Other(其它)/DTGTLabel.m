//
//  DTGTLabel.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTLabel.h"

@implementation DTGTLabel

/** 设置字体显示的位置 */
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    
    /** 设置上下左右都居中对齐 */
    textRect.origin.x = (self.bounds.size.width - textRect.size.width) * 0.5;
    textRect.origin.y = (self.bounds.size.height - textRect.size.height) * 0.5;
    
    return textRect;
}

/** 在给定区域绘制文本，如果文本过长，此区域不能完全显示，则以省略号代替 */
-(void)drawTextInRect:(CGRect)rect
{
    CGRect actualRect = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    
    [super drawTextInRect:actualRect];
}
@end

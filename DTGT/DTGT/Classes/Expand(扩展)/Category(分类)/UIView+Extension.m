//
//  UIView+Extension.m
//  DTGT
//
//  Created by small T on 17/5/2.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)
-(void)setX:(CGFloat)x{
    CGRect frame=self.frame;
    frame.origin.x=x;
    self.frame=frame;

}
-(CGFloat)x
{
    return self.frame.origin.x;
}
@end

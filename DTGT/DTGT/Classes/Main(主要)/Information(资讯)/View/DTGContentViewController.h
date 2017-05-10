//
//  DTGContentTViewController.h
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
@interface DTGContentViewController : UIViewController
{
    NSString* contentStr;
    NSString*titleStr;
    NSString*imgName;
    UITextView *textView;
    NSURL *imgUrl;
    NSString *timeStr;

}
-(instancetype)initWithTitle:(Product*) product;
@end

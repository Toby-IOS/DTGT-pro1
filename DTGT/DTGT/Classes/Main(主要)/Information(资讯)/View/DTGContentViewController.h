//
//  DTGContentTViewController.h
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTGContentViewController : UIViewController
{
    NSString* contentStr;
    NSString*titleStr;
    NSString*imgName;
    UITextView *textView;

}
-(instancetype)initWithTitle:(NSString*)titleString withImgName:(NSString*)imgStr;
@end

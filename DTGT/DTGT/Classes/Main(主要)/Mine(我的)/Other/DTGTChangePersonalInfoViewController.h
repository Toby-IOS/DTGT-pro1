//
//  DTGTChangePersonalInfoViewController.h
//  DTGT
//
//  Created by 郭建龙 on 2017/5/19.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>




@interface DTGTChangePersonalInfoViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
{
   NSString *titleStr;
   NSString* contentStr;
}
typedef void (^ReturnTextBlock)(NSMutableDictionary*showTextDic);
-(instancetype)initWithString:(NSString*)titleString withContent:(NSString*)string;

@property(copy,nonatomic)ReturnTextBlock textBlock;
@property (nonatomic,copy)NSString *string;
@property (nonatomic,copy)NSMutableDictionary *dic;


//-(void)testLabBlock;
-(void)returnText:(ReturnTextBlock)block;

@end

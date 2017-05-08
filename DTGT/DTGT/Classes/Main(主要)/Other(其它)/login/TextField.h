//
//  TextField.h
//  SYLMall
//
//  Created by apple on 15/7/25.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldDelegate <NSObject>

-(void)setTextHide:(BOOL)bol;
-(void)returnFieldText:(NSString *)str;
-(void)setDoneBnt;
@end


@interface TextField : UIView<UITextFieldDelegate>
{
    
    UITextField *textField;
    int typeIndex;/**<区别不同的特性*/

}
@property(assign,nonatomic) id <TextFieldDelegate> textFieldDelegate;
@property(retain,nonatomic) UITextField *textField;
- (id)initWithFrame:(CGRect)frame withPlaceholderStr:(NSString*)str andKeyboardTypeNumberPad :(BOOL)bol withIndex:(int)index;
- (BOOL)validateUserPhone:(NSString *)str;/**手机号码验证*/
@end

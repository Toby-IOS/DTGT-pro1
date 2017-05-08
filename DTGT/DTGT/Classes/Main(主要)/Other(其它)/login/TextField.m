//
//  TextField.m
//  SYLMall
//
//  Created by apple on 15/7/25.
//  Copyright (c) 2015年 apple. All rights reserved.


#import "TextField.h"

@implementation TextField

@synthesize textField,textFieldDelegate;

- (id)initWithFrame:(CGRect)frame withPlaceholderStr:(NSString*)str andKeyboardTypeNumberPad :(BOOL)bol withIndex:(int)index;
{
    self = [super initWithFrame:frame];
    if (self)
    {
    
        self.textField=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.textField.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.92f alpha:1.00f];
        self.textField.placeholder = str;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [self.textField setBorderStyle:UITextBorderStyleNone];
        [self.textField setFont:[UIFont fontWithName:@"Helvetica" size:14.0]];
//        self.textField.textColor=ZPJColor(51,51,51);
        if(bol)
        self.textField.keyboardType = UIKeyboardTypeNumberPad;// 数字键盘
        self.textField.returnKeyType = UIReturnKeyDone;
        self.textField.delegate=self;
        typeIndex=index;
        [self addSubview: self.textField];
        
        [self.textField addTarget:self
                           action:@selector(textFieldDidChange:)
                 forControlEvents:UIControlEventEditingChanged];
    }
    return self;
    
}

-(void)textFieldDidChange:(id)sender
{
    if(typeIndex==5||typeIndex==6||typeIndex==3){
        [textFieldDelegate setDoneBnt];
    }
}
/**编辑开始时系统代理执行方法*/
#pragma mark search delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField1
{
 
    [textField becomeFirstResponder];
//    if(typeIndex==3){
//    [textFieldDelegate setTextHide:YES];
//    }
}
/**编辑完时系统代理执行方法*/
- (void)textFieldDidEndEditing:(UITextField *)textField1
{
    [textField resignFirstResponder];
    
    if (typeIndex ==3)
    {
        [self validateUserPhone:textField.text];
    }else  if(typeIndex==15){
    
     [textFieldDelegate returnFieldText:textField.text];
    
    }
}
/**点击键盘按钮执行方法 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField1
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
  
    return YES;
}

/**键盘输入校验时调用 */
-(BOOL)textField:(UITextField *)field  shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
  
    return  YES;
    
}
- (BOOL)textFieldShouldClear:(UITextField *)textField3{

 
    return YES;
}
/**校验用户手机号码*/
- (BOOL)validateUserPhone:(NSString *)str
{
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"^1[3|4|5|7|8][0-9][0-9]{8}$"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:str
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, str.length)];
    if(numberofMatch > 0)
    {
        NSLog(@"phone-ok");
        return YES;
    }else {
        NSLog(@"phone-no");
        return NO;
    }
}



@end

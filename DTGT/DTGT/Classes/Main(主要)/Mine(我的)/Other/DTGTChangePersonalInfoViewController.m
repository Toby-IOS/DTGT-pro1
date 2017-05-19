//
//  DTGTChangePersonalInfoViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/19.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTChangePersonalInfoViewController.h"
#import "macros.pch"
@interface DTGTChangePersonalInfoViewController ()

@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UITextView *textView;


@end

@implementation DTGTChangePersonalInfoViewController

-(instancetype)initWithString:(NSString*)titleString withContent:(NSString*)string{

    if(self==[super init]){
    
         titleStr=titleString;
         contentStr=string;
        NSLog(@"titleStr==%@==%@",titleStr,contentStr);
      
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.view.backgroundColor=[UIColor lightGrayColor];
    self.navigationItem.title=titleStr;
    if([titleStr isEqualToString:@"昵称"])
    {
        
    [self.view addSubview:self.textField];
        
    }else if([titleStr isEqualToString:@"收藏爱好"])
    {
        
    [self.view addSubview:self.textView];
        
    }
    
    
    
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveClick)];
    self.navigationItem.rightBarButtonItem=rightButton;
    
}
-(void)saveClick{

    [self.navigationController popViewControllerAnimated:YES];
    
    NSLog(@"saveClick");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITextField*)textField{

    UITextField *textfield=[[UITextField alloc]initWithFrame:CGRectMake(0, 64+10, WITCH, 44)];
    _textField=textfield;
    _textField.text=contentStr;
    _textField.textColor=[UIColor grayColor];
    _textField.backgroundColor=[UIColor whiteColor];
    _textField.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    _textField.returnKeyType=UIReturnKeyDone;
    _textField.delegate=self;
    _textField.clearButtonMode = UITextFieldViewModeAlways;
    return _textField;

}
-(UITextView*)textView{

    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(0, 64+10, WITCH, 80)];
    _textView=textView;
    _textView.text=contentStr;
    _textView.textColor=[UIColor grayColor];
    _textView.backgroundColor=[UIColor whiteColor];
    _textView.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    _textView.returnKeyType=UIReturnKeyDone;
    _textView.textAlignment=NSTextAlignmentLeft;
    _textView.delegate=self;
    _textView.keyboardType=UIKeyboardTypeDefault;
    self.automaticallyAdjustsScrollViewInsets = NO;
    return _textView;

}





- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    [_textField becomeFirstResponder];
 
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    _textField.text=textField.text;
    [_textField resignFirstResponder];
    return YES;
}


-(void)textViewDidBeginEditing:(UITextView *)textView{

    [_textView becomeFirstResponder];

}




-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        _textView.text=textView.text;
        [_textView resignFirstResponder];
        return NO;
    }
    return YES;
}






-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [_textField resignFirstResponder];
    [_textView resignFirstResponder];

}



@end

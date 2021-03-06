//
//  DTGTSubmitViewController.m
//  DTGT
//
//  Created by small T on 17/4/24.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTSubmitViewController.h"
#import "macros.pch"
#import "DTGTChoiceView.h"

@interface DTGTSubmitViewController (){
   NSArray *arry;
    
}
@property(nonatomic,strong)UITextView *contentText;
@property(nonatomic,strong)UITextField *phoneText;
@end

@implementation DTGTSubmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=ZPJColor(225, 225, 225);
    
    UIImageView *topBackView=[[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, kBoundsSize.width, kTitleBarH)];
        [topBackView setBackgroundColor:[UIColor lightGrayColor]];
    topBackView.userInteractionEnabled=YES;
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 5,kBoundsSize.width, kTitleBarH)];
    titleLab.text=@"信息提交";
    titleLab.textColor=[UIColor blackColor];
    titleLab.textAlignment=NSTextAlignmentCenter;
    [titleLab setBackgroundColor:[UIColor clearColor]];
    titleLab.font=[UIFont fontWithName:@"Helvetica" size:18.0];
    [topBackView addSubview:titleLab];
    [self.view addSubview:topBackView];
    
    
   UIButton* leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setFrame:CGRectMake(15, 20, 29, 29)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon_cancel_pwd"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon_cancel_pwd"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(leftButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
    [topBackView addSubview:leftBtn];
    
    arry=[NSArray arrayWithObjects:@"关于交易问题",@"关于收宝问题",  @"关于鉴宝问题",@"其它", nil];
    UILabel *questionLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
    questionLab.text=@"问题类型";
    questionLab.font=[UIFont  systemFontOfSize:15];
    [self.view addSubview:questionLab];
    _contentText=[[UITextView alloc]initWithFrame:CGRectMake(0, 180, WITCH, 130)];
    _contentText.backgroundColor=[UIColor whiteColor];
    _contentText.text=@" 请具体描述下你的需求，我们尽快会帮您解决";
    _contentText.textColor=[UIColor grayColor];
    [self.view addSubview:_contentText];
    
    _phoneText=[[UITextField alloc]initWithFrame:CGRectMake(0, 180+130+1, WITCH, 40)];
    _phoneText.backgroundColor=[UIColor whiteColor];
    
    _phoneText.placeholder =@"  手机号码：方便联系你";
    _phoneText.font=[UIFont systemFontOfSize:13];
    _phoneText.textColor=[UIColor grayColor];
    [self.view addSubview:_phoneText];
    
    UIButton *submitBnt=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WITCH, 49)];
    submitBnt.backgroundColor=[UIColor orangeColor];
    [submitBnt setTitle:@"提交" forState:UIControlStateNormal];
    [submitBnt addTarget:self action:@selector(sumbitBntClick) forControlEvents:UIControlEventTouchUpInside];
    [ self.view addSubview:submitBnt];
    
    
    UILabel *promitLab=[[UILabel alloc]initWithFrame:CGRectMake(10, HEIGHT-49-25, 250, 20)];
    promitLab.text=@"提交信息后，公司会尽快和您联系";
    promitLab.font=[UIFont  systemFontOfSize:12];
    promitLab.textColor=[UIColor grayColor];
    [self.view addSubview:promitLab];
    
    [self.view addSubview:[DTGTChoiceView selectViewFrame:CGRectMake(100, 100, WITCH-100, [arry count]/2*40) withArray:arry]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)sumbitBntClick{
    NSLog(@"sumbitBntClick");
[ self dismissViewControllerAnimated: YES completion: nil ];

}
-(void)leftButtonOnClick{

    [self dismissViewControllerAnimated:YES completion:nil];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
/**点击屏幕空白处取消键盘*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_contentText resignFirstResponder];
    [_phoneText resignFirstResponder];
    
}
@end

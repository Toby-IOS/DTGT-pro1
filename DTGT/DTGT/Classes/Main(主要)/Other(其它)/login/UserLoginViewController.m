//
//  UserLoginViewController.m
//  MallProject
//
//  Created by apple on 15/6/10.
//  Copyright (c) 2015年 jianlong. All rights reserved.
//

#import "UserLoginViewController.h"
#import "macros.pch"
#import "ForgetPasswordViewController.h"
#import "AFNetworkTool.h"
#import "DTGTRegisteredViewController.h"
#import "DTGTAlertView.h"

@interface UserLoginViewController ()

@end

@implementation UserLoginViewController
@synthesize loginBnt;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden=YES;
    UIImageView *topBackView=[[UIImageView alloc ]initWithFrame:CGRectMake(0, 0, kBoundsSize.width, kTitleBarH)];
//    [topBackView setBackgroundColor:[UIColor colorWithRed:185/255.0f green:14/255.0f  blue:48/255.0f alpha:1.0f]];
//    [topBackView setImage:[UIImage imageNamed:@"navigatebar"]];
    topBackView.userInteractionEnabled=YES;
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 5,kBoundsSize.width, kTitleBarH)];
    titleLab.text=@"登录";
    titleLab.textColor=[UIColor blackColor];
    titleLab.textAlignment=NSTextAlignmentCenter;
    [titleLab setBackgroundColor:[UIColor clearColor]];
    titleLab.font=[UIFont fontWithName:@"Helvetica" size:18.0];
    [topBackView addSubview:titleLab];
    [self.view addSubview:topBackView];
    
    leftBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setFrame:CGRectMake(15, 20, 29, 29)];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon_cancel_pwd"] forState:UIControlStateNormal];
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"icon_cancel_pwd"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(leftButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
    [topBackView addSubview:leftBtn];
    
    UIImageView *bgImageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kBoundsSize.width, kBoundsSize.height)];
    bgImageView.backgroundColor=ZPJColor(245,245,245);
    [self.view addSubview:bgImageView];

    UIImageView *inPutBgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64+44, kBoundsSize.width, 101)];
    inPutBgView.backgroundColor=[UIColor whiteColor];
    inPutBgView.userInteractionEnabled=YES;
    [self.view addSubview:inPutBgView];
    UIImageView *imageLine=[[UIImageView alloc]initWithFrame:CGRectMake(16,64+44+50,kBoundsSize.width-16*2,1)];
    imageLine.backgroundColor=ZPJColor(229,229,229);
    [self.view addSubview:imageLine];
    
    UIImageView* userNameIconView=[[UIImageView alloc] initWithFrame:CGRectMake(16,14,22,22)];
    [userNameIconView setImage:[UIImage imageNamed:@"userName_@2x.png"]];
    [inPutBgView addSubview:userNameIconView];
    
    UIImageView* passWordIconView=[[UIImageView alloc] initWithFrame:CGRectMake(16,14+50,22,22)];
    [passWordIconView setImage:[UIImage imageNamed:@"passWord@2x.png"]];
    [inPutBgView addSubview:passWordIconView];
    
    userNameField=[[TextField alloc]initWithFrame:CGRectMake(49, 0, kBoundsSize.width-100-50, 50) withPlaceholderStr:@"请输入用户名/手机号码" andKeyboardTypeNumberPad:NO withIndex:5];
    userNameField.textField.textColor=ZPJColor(136,136,136);
    [userNameField.textField setBackgroundColor:[UIColor clearColor]];
    userNameField.textFieldDelegate=self;
    [inPutBgView addSubview:userNameField];
    
    passWordField=[[TextField alloc]initWithFrame:CGRectMake(49, 51, kBoundsSize.width-100-50, 50) withPlaceholderStr:@"请输入密码" andKeyboardTypeNumberPad:NO withIndex:6];
    passWordField.textField.textColor=ZPJColor(136,136,136);
    passWordField.textFieldDelegate=self;
    passWordField.textField.secureTextEntry = YES;
    [passWordField.textField setBackgroundColor:[UIColor clearColor]];
    [inPutBgView addSubview:passWordField];
    
    _passSwich=[[UISwitch alloc] initWithFrame:CGRectMake(kBoundsSize.width-75,51+10, 50, 30)];
    _passSwich.onTintColor=ZPJColor(185,18,48);
    [_passSwich addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventValueChanged];
    [inPutBgView addSubview:_passSwich];
    
    loginBnt=[UIButton buttonWithType:UIButtonTypeCustom];
    loginBnt.frame=CGRectMake(20, 64+44+100+35+15, WITCH-20*2, 41);
    [loginBnt setBackgroundColor:[UIColor orangeColor]];
    [loginBnt setTitle:@"登录" forState:UIControlStateNormal];
//    [loginBnt setBackgroundImage:[UIImage imageNamed:@"login_default.png"] forState:UIControlStateNormal];
//    [loginBnt setBackgroundImage:[UIImage imageNamed:@"login_lighted.png"] forState:UIControlStateHighlighted];
    loginBnt.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:16.0];
    [loginBnt addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBnt];
    
    UIButton * forgetBnt=[UIButton buttonWithType:UIButtonTypeSystem];
    [forgetBnt setBackgroundColor:[UIColor clearColor]];
    forgetBnt.frame=CGRectMake(30, 64+44+100+35+41+32, 80, 30);
    forgetBnt.titleLabel.font= [UIFont fontWithName:@"Helvetica" size:14.0];
    [forgetBnt setTitle:@"忘记密码?" forState:UIControlStateNormal];
     forgetBnt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [forgetBnt setTitleColor:ZPJColor(136,136,136) forState:UIControlStateNormal];
    [forgetBnt setTitleColor:ZPJColor(200,200,200) forState:UIControlStateHighlighted];
    [forgetBnt addTarget:self action:@selector(forgetClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBnt];
    
    
    UIButton * registerBnt=[UIButton buttonWithType:UIButtonTypeSystem];
    [registerBnt setBackgroundColor:[UIColor clearColor]];
    registerBnt.frame=CGRectMake(kBoundsSize.width-80-35, 64+44+100+35+41+32, 80, 30);
    registerBnt.titleLabel.font= [UIFont fontWithName:@"Helvetica" size:14.0];
    [registerBnt setTitle:@"新用户注册" forState:UIControlStateNormal];
    forgetBnt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [registerBnt setTitleColor:ZPJColor(136,136,136) forState:UIControlStateNormal];
    [registerBnt setTitleColor:ZPJColor(200,200,200) forState:UIControlStateHighlighted];
    [registerBnt addTarget:self action:@selector(registerClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBnt];
    
    
    
    
    
    
    
    bntImageOff=[UIImage imageNamed:@"checkBox_no.png"];
    bntImageOn=[UIImage imageNamed:@"checkBox_on.png"];
    rememberBnt=[[UIButton alloc] initWithFrame:CGRectMake(20, 223, 20, 20)];
    [rememberBnt addTarget:self action:@selector(rememberClick) forControlEvents:UIControlEventTouchUpInside];
    [rememberBnt setBackgroundImage:bntImageOff forState:UIControlStateNormal];
    [self.view addSubview:rememberBnt];
    
     autoLoginBnt=[[UIButton alloc]initWithFrame:CGRectMake(kBoundsSize.width-35-10, 223, 20, 20)];
    [autoLoginBnt addTarget:self action:@selector(AutomaticLoginClick)forControlEvents:UIControlEventTouchUpInside];
    [autoLoginBnt setBackgroundImage:bntImageOff forState:UIControlStateNormal];
    [self.view addSubview:autoLoginBnt];
    
    UILabel *choiceLal=[[UILabel alloc] initWithFrame:CGRectMake (kBoundsSize.width-80-35, 220, 80, 25)];
    choiceLal.text=@"自动登录";
    choiceLal.font=[UIFont fontWithName:@"Helvetica" size:14.0];
    choiceLal.textColor = ZPJColor(136,136,136);
//    [self.view addSubview:choiceLal];
    
    UILabel *rememberLal=[[UILabel alloc] initWithFrame:CGRectMake(50, 220, 80, 25)];
    rememberLal.text=@"记住密码";
    rememberLal.font=[UIFont fontWithName:@"Helvetica" size:14.0];
    rememberLal.textColor = ZPJColor(136,136,136);
//    [self.view addSubview:rememberLal];
    
    NSUserDefaults *isStorefaults = [NSUserDefaults standardUserDefaults];
    if (![isStorefaults objectForKey:kIsStorePassword]) {
        [isStorefaults setObject:@"0" forKey:kIsStorePassword];
        
    }else if([[isStorefaults  objectForKey:kIsStorePassword] isEqualToString:@"1" ]){
    
       [rememberBnt setBackgroundImage:bntImageOn forState:UIControlStateNormal];
        rememberBnt.selected=YES;
       userNameField.textField.text= [isStorefaults objectForKey:kUsername];
       passWordField.textField.text= [isStorefaults objectForKey:kPassword];
    }
    
    if(![isStorefaults objectForKey:kIsAutomaticLogin])
    {
        [isStorefaults setObject:@"0" forKey:kIsAutomaticLogin];
    }
    else if([[isStorefaults objectForKey:kIsAutomaticLogin] isEqualToString:@"1"])
    {
        [autoLoginBnt setBackgroundImage:bntImageOn forState:UIControlStateNormal];
        autoLoginBnt.selected=YES;
    }
//    if(![userNameField.textField.text isEqualToString:@""]&&![passWordField.textField.text isEqualToString:@""])
//    {
//        loginBnt.enabled=YES;
//    
//    }else
//    {
//        loginBnt.enabled=NO;
//    }
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    self.navigationController.navigationBarHidden=YES;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**点击屏幕空白处取消键盘*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [userNameField.textField resignFirstResponder];
    [passWordField.textField resignFirstResponder];

}

/**是否显示密码方法调用*/
- (void)switchIsChanged:(UISwitch *)paramSender
{
    if ([_passSwich isOn])
    {
        passWordField.textField.secureTextEntry = NO;
    }
    else
    {
        passWordField.textField.secureTextEntry = YES;
    }
}

/**自动登录方法调用*/
-(void)AutomaticLoginClick
{
    NSLog(@"rememberClick");
    if (autoLoginBnt.selected == YES)
    {
        
        [autoLoginBnt setBackgroundImage:bntImageOff forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:kIsAutomaticLogin];
    }
    else{
        [autoLoginBnt setBackgroundImage:bntImageOn forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:kIsAutomaticLogin];
    }
    autoLoginBnt.selected=!autoLoginBnt.selected;
}



/**记住密码方法调用*/
-(void)rememberClick
{
     NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if (rememberBnt.selected == YES)
    {
        
        [rememberBnt setBackgroundImage:bntImageOff forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setObject:@"0" forKey:kIsStorePassword];
        [userDefault setObject:@"" forKey:kUsername];
        [userDefault setObject:@"" forKey:kPassword];
    }
    else{
        [rememberBnt setBackgroundImage:bntImageOn forState:UIControlStateNormal];
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:kIsStorePassword];
        
        if(![userNameField.textField.text isEqualToString:@""]&&![passWordField.textField.text isEqualToString:@""])
        {
        [userDefault setObject:userNameField.textField.text forKey:kUsername];
        [userDefault setObject:passWordField.textField.text forKey:kPassword];
        }
    }
    
    rememberBnt.selected=!rememberBnt.selected;
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)registerClick
{
    DTGTRegisteredViewController *rgVC = [[DTGTRegisteredViewController alloc]init];
   
    [self.navigationController pushViewController:rgVC animated:YES];

}


/**忘记密码方法调用*/
-(void)forgetClick
{
    ForgetPasswordViewController *fpVC = [[ForgetPasswordViewController alloc]initwithTitle:@"找回密码" withType: 1 ];
    [self.navigationController pushViewController:fpVC animated:YES];
//    [self presentViewController:fpVC animated:YES completion:nil];
    
}

/**确定按钮方法调用*/
-(void)loginClick
{
    [userNameField.textField resignFirstResponder];
    [passWordField.textField resignFirstResponder];
   
    if([userNameField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入用户名" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    if([passWordField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入密码" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    
   
    [self httpRequest];
    
   
 
    
    
  
}

-(void)httpRequest{
    
    NSString *url=@"http://192.168.1.132:8084/rest/appUser/login";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:userNameField.textField.text forKey:@"userName"];//123456
    [infoDic setObject:passWordField.textField.text forKey:@"userPwd"];//admin
   
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
    
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];

        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
      
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    
}

- (void)fillWithJsonString:(NSDictionary*)dicData {
    
    NSLog(@"dicData==%@",dicData);
    int  code =[[dicData objectForKey:@"code"] intValue];
    NSString *str=[dicData objectForKey:@"msg"];
   
   
    
    if(code==102||code==103){
    
    [DTGTAlertView showWithTitle:str andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
    
    }

    if(code ==200){
        
         NSDictionary *objDic=[dicData objectForKey:@"obj"];
        NSString *userName=[objDic objectForKey:@"userName"];
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        [userDefault setValue:@"1" forKey:kIsStorePassword];
     
        [userDefault setValue:userName forKey:kUsername];
    
        NSLog(@"登录");
        
     [self performSelector:@selector(getBack) withObject:nil afterDelay:1.0];
    }

}



/**NSData转化成字典方法调用*/

- (id)toArrayOrNSDictionary:(NSData *)jsonData
{
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    
    if (jsonObject != nil && error == nil){
        return jsonObject;
    }else{
        // 解析错误
        return nil;
    }
    
}

/**字典转化成字符串json方法调用*/
-(NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/**进入首页方法调用*/
-(void)getBack
{
     [ self dismissViewControllerAnimated: YES completion: nil ];

//    SYLTabBarController *tabBar = [[SYLTabBarController alloc] init];
//    [UIApplication sharedApplication].keyWindow.rootViewController = tabBar;
    
}

/**输入框代理方法调用*/
-(void)setTextHide:(BOOL)bol
{

}
/**设置登录按钮状态代理方法调用*/
-(void)setDoneBnt{

//    if(![userNameField.textField.text  isEqualToString:@""]&&![passWordField.textField.text  isEqualToString:@""]){
//        loginBnt.enabled=YES;
//    }
//    else
//    {
//
//         loginBnt.enabled=NO;
//    }
    
}
-(void)returnFieldText:(NSString *)str
{
}


-(void)leftButtonOnClick{

[ self dismissViewControllerAnimated: YES completion: nil ];

}
@end

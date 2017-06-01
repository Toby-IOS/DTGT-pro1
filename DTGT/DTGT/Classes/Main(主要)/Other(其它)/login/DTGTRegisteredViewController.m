//
//  DTGTRegisteredViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/6/1.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTRegisteredViewController.h"
#import "macros.pch"
#import "AFNetworkTool.h"
#import "DTGTAlertView.h"
@interface DTGTRegisteredViewController ()

@end

@implementation DTGTRegisteredViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    [self configUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}


/**页面布局*/
- (void)configUI {

    
    //自定义标题
    UIView *itemBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    itemBgView.backgroundColor = [UIColor grayColor];
    // 标题
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = @"注册";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor blackColor];
    title.font = [UIFont fontWithName:@"Helvetica" size:18.0];
    [itemBgView addSubview:title];
    [self.view addSubview:itemBgView];
    
    // 返回按钮
    UIButton *leftBarBnt = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 50, 44)];
    leftBarBnt.backgroundColor=[UIColor clearColor];
    [leftBarBnt setImage:[UIImage imageNamed:@"Industrychoose_return.png"] forState:UIControlStateNormal];
    [leftBarBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBarBnt addTarget:self action:@selector(getBack) forControlEvents:UIControlEventTouchUpInside];
    [itemBgView addSubview:leftBarBnt];
    
    // 手机号输入框背景图
    UIView *phoneBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 113, kBoundsSize.width, 49)];
    phoneBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:phoneBackView];
    // 手机号背景图分割线
    UIImageView *topLineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 1)];
    topLineView.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [phoneBackView addSubview:topLineView];
    UIImageView *bottomLineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 48, kBoundsSize.width, 1)];
    bottomLineView.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [phoneBackView addSubview:bottomLineView];
    
    UILabel *identifyingLab = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, 70, 20)];
    identifyingLab.text = @"用户名:";
    identifyingLab.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    identifyingLab.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [phoneBackView addSubview:identifyingLab];
    
    // 用户名输入框
    _userField = [[TextField alloc] initWithFrame:CGRectMake(75, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"请输入用户名" andKeyboardTypeNumberPad:NO withIndex:5];
    _userField.textFieldDelegate = self;
    _userField.textField.backgroundColor = [UIColor whiteColor];
    _userField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [phoneBackView addSubview:_userField];
    
    
//    输入框背景图
    UIView *identifyingBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 113+49, kBoundsSize.width, 49)];
    identifyingBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:identifyingBackView];
    //背景图分割线
    UIImageView *topLineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 1)];
    topLineView1.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [identifyingBackView addSubview:topLineView1];
    UIImageView *bottomLineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 48, kBoundsSize.width, 1)];
    bottomLineView1.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [identifyingBackView addSubview:bottomLineView1];
    
  
    
    
    UILabel *identifyingLabel = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, 70, 20)];
    identifyingLabel.text = @"密码:";
    identifyingLabel.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    identifyingLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [identifyingBackView addSubview:identifyingLabel];
    
    
    // 密码输入框
    _passwordField=[[TextField alloc]initWithFrame:CGRectMake(75, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"请输入密码" andKeyboardTypeNumberPad:NO withIndex:5];
    _passwordField.textField.backgroundColor = [UIColor whiteColor];
    _passwordField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [identifyingBackView addSubview:_passwordField];
    
   

    
   UIButton * doneBnt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneBnt.frame = CGRectMake(20, HEIGHT/3+60, WITCH-20*2, 40);
    doneBnt.backgroundColor = [UIColor orangeColor];
    doneBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [doneBnt setTitle:@"注册" forState:UIControlStateNormal];
    [doneBnt setTintColor:[UIColor whiteColor]];
    [doneBnt addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:doneBnt];
  
}
/**点击输入框以外的位置，收回键盘*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userField.textField resignFirstResponder];
    [_passwordField.textField resignFirstResponder];
}





-(void)doneClick{
    [_userField.textField resignFirstResponder];
    [_passwordField.textField resignFirstResponder];
    if([_userField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入用户名" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    if([_passwordField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入密码" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    
    [self httpRequest];

}

-(void)httpRequest{
    
    NSString *url=@"http://192.168.1.132:8084/rest/appUser/register";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:_userField.textField.text forKey:@"userName"];//123456
    [infoDic setObject:_passwordField.textField.text forKey:@"userPwd"];//admin
    [infoDic setObject:@"1" forKey:@"userType"];//adminNSLog(@"infoDic==%@",infoDic);
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        [self fillWithJsonString:dic];
        
        
        
    } fail:^{
        
    }];
    

    
    
}




/** 解析数据*/
- (void)fillWithJsonString:(NSDictionary*)dicData {
    
    NSLog(@"dic==%@",dicData);
    int  code =[[dicData objectForKey:@"code"] intValue];
    
    NSString *str=[dicData objectForKey:@"msg"];
    if(code==102){
        
        [DTGTAlertView showWithTitle:str andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        
    }
    
    if(code ==200){
     
    [DTGTAlertView showWithTitle:@"注册成功" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        
    [self performSelector:@selector(getBack) withObject:nil afterDelay:3.0];
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

//代理方法调用*/
-(void)setDoneBnt{
    
  
    
}


/**返回按钮的响应事件*/
- (void)getBack
{
   
    [self.navigationController popViewControllerAnimated:YES];
}
@end

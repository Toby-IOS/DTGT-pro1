//
//  GJLNewPasswordViewController.m
//  Toby
//
//  Created by small T on 17/3/30.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "GJLNewPasswordViewController.h"
#import "macros.pch"
#import "AFNetworkTool.h"
#import "DTGTAlertView.h"
#import "UserLoginViewController.h"
@interface GJLNewPasswordViewController ()<TextFieldDelegate>

@end

@implementation GJLNewPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)configUI {
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
    //自定义标题
    UIView *itemBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    itemBgView.backgroundColor = [UIColor grayColor];
    // 标题
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = @"密码修改";
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
   
    // 手机号文字
    UILabel *identifyingLab = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, 70, 20)];
    identifyingLab.text = @"旧密码:";
    identifyingLab.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    identifyingLab.font = [UIFont fontWithName:@"Helvetica" size:15.0];
        [phoneBackView addSubview:identifyingLab];
    // 手机号输入框
    oldPasswordField = [[TextField alloc] initWithFrame:CGRectMake(75, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"旧密码" andKeyboardTypeNumberPad:NO withIndex:3];
    oldPasswordField.textFieldDelegate = self;
    oldPasswordField.textField.backgroundColor = [UIColor whiteColor];
    oldPasswordField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [phoneBackView addSubview:oldPasswordField];
    
    
    // 验证码输入框背景图
    UIView *identifyingBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 113+49+2, kBoundsSize.width, 49)];
    identifyingBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:identifyingBackView];

    UILabel *identifyingLabel = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, 70, 20)];
    identifyingLabel.text = @"新密码:";
    identifyingLabel.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    identifyingLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
        [identifyingBackView addSubview:identifyingLabel];
    // 手机短信证码输入框
   newPasswordField=[[TextField alloc]initWithFrame:CGRectMake(75, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"新密码" andKeyboardTypeNumberPad:NO withIndex:4];
    newPasswordField.textField.backgroundColor = [UIColor whiteColor];
    newPasswordField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [identifyingBackView addSubview:newPasswordField];
    
   
    
    // 验证码输入框背景图
    UIView *confirmPasswordView = [[UIView alloc] initWithFrame:CGRectMake(0, 113+49+4+49, kBoundsSize.width, 49)];
    confirmPasswordView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:confirmPasswordView];
   
    // 手机号提示信息
    UILabel *mobileLab = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, kBoundsSize.width-38, 20)];
    mobileLab.text = @"确认密码:";
    mobileLab.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    mobileLab.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [confirmPasswordView addSubview:mobileLab];
    
    confirmPasswordField=[[TextField alloc]initWithFrame:CGRectMake(90, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"确认密码" andKeyboardTypeNumberPad:NO withIndex:4];
    confirmPasswordField.textField.backgroundColor = [UIColor whiteColor];
    confirmPasswordField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [confirmPasswordView addSubview:confirmPasswordField];
    
    
    

    // 确定按钮
   UIButton *doneBnt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    doneBnt.frame = CGRectMake(20, HEIGHT/3+100, WITCH-40, 50);
    doneBnt.backgroundColor = [UIColor orangeColor];
    doneBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [doneBnt setTitle:@"确认" forState:UIControlStateNormal];
    [doneBnt setTintColor:[UIColor whiteColor]];
    [doneBnt addTarget:self action:@selector(doneBntClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:doneBnt];
  
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}
- (void)getBack
{
 
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)doneBntClick
{
    [oldPasswordField.textField resignFirstResponder];
    [newPasswordField.textField resignFirstResponder];
    [confirmPasswordField.textField resignFirstResponder];
    
    if([oldPasswordField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入密码" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    if([newPasswordField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入新密码" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    if([confirmPasswordField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入确认密码" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    
    
    [self httpRequest];
}


-(void)httpRequest{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    
    NSString *url=@"http://192.168.1.132:8084/rest/appUser/updatePwd";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:userNameStr forKey:@"userName"];//123456
    [infoDic setObject:oldPasswordField.textField.text forKey:@"oldPwd"];//admin
    [infoDic setObject:newPasswordField.textField.text  forKey:@"newPwd"];//admin

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

    
    if(code==101||code==102){
        
        [DTGTAlertView showWithTitle:str andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        
    }
    
    
    
    
    if(code ==200){
        
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
            [userDefault setObject:@"0" forKey:kIsStorePassword];
        }
        
       
          [DTGTAlertView showWithTitle:@"密码修改成功" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        
        

         [self performSelector:@selector(goBack) withObject:nil afterDelay:2.0];

    }
    
    
}
-(void)goBack
{
    
           [self.navigationController popViewControllerAnimated:YES];

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
/**点击屏幕空白处取消键盘*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [oldPasswordField.textField resignFirstResponder];
    [newPasswordField.textField resignFirstResponder];
    [confirmPasswordField.textField resignFirstResponder];
    
}

/**设置登录按钮状态代理方法调用*/
-(void)setDoneBnt{
    
   
    
}
/**字典转化成字符串json方法调用*/
-(NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

@end

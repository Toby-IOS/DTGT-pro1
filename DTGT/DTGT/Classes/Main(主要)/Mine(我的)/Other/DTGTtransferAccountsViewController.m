//
//  DTGTtransferAccountsViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/31.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTtransferAccountsViewController.h"
#import "macros.pch"
#import "AFNetworkTool.h"
#import "DTGTAlertView.h"
@interface DTGTtransferAccountsViewController ()

@end

@implementation DTGTtransferAccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    self.navigationItem.title=@"转账";
    [self.navigationController setNavigationBarHidden:NO];
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    
    myAccount=[userDefault objectForKey:kUsername];
    
    [self initView];
    
    
    
}
-(void)initView{

    UIView *headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 64, WITCH, 145)];
    headerView.backgroundColor=[UIColor whiteColor];
    _headImgView=[[UIImageView alloc]initWithFrame:CGRectMake((WITCH-80)/2, 20, 80, 80)];
//    _headImgView.backgroundColor=[UIColor yellowColor];
    _headImgView.image=[UIImage imageNamed:@"head.jpeg"];
    [headerView addSubview:_headImgView];
    
    _myAccountlab=[[UILabel alloc]initWithFrame:CGRectMake((WITCH-100)/2, 100, 100, 30)];
//    _myAccountlab.backgroundColor=[UIColor redColor];
    _myAccountlab.textAlignment=NSTextAlignmentCenter;
    _myAccountlab.text=myAccount;
    [headerView addSubview:_myAccountlab];
    
  
    _moneyLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 145+64+1, WITCH, 50)];
    _moneyLab.textAlignment=NSTextAlignmentCenter;
    _moneyLab.text=@"0.00  ";
    _moneyLab.textColor=[UIColor orangeColor];
    [_moneyLab setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:_moneyLab];
    
    UILabel *promptMoneyLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 145+64+1, 100, 50)];
    promptMoneyLab.text=@" 钱包余额";
//    promptMoneyLab.backgroundColor=[UIColor redColor];
    [self.view addSubview:promptMoneyLab];
  
    [self.view addSubview:headerView];
    
    UIView *middleView=[[UIView alloc]initWithFrame:CGRectMake(0, 270, WITCH, 152)];
    middleView.backgroundColor=ZPJColor(225, 225, 225);
    
    _otherAccountField=[[TextField alloc]initWithFrame:CGRectMake(0, 0, WITCH, 50) withPlaceholderStr:@"请输入账户名称" andKeyboardTypeNumberPad:NO withIndex:5];
    _otherAccountField.textFieldDelegate=self;
    _otherAccountField.textField.backgroundColor=[UIColor whiteColor];
    _otherAccountField.textField.textAlignment=NSTextAlignmentCenter;
    [middleView addSubview: _otherAccountField];
    
    UILabel *promptOtherAccountLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    promptOtherAccountLab.text=@" 对方账户";
//    promptOtherAccountLab.backgroundColor=[UIColor redColor];
    [middleView addSubview:promptOtherAccountLab];
    
    
    _transferMoneyField=[[TextField alloc]initWithFrame:CGRectMake(0, 51, WITCH, 50) withPlaceholderStr:@"请输入金额" andKeyboardTypeNumberPad:NO withIndex:5];
    _transferMoneyField.textFieldDelegate=self;
    _transferMoneyField.textField.backgroundColor=[UIColor whiteColor];
    _transferMoneyField.textField.textAlignment=NSTextAlignmentCenter;
    [middleView addSubview: _transferMoneyField];
    
    UILabel *promptTransferMoneyLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 51, 100, 50)];
    promptTransferMoneyLab.text=@" 转账金额";
//    promptTransferMoneyLab.backgroundColor=[UIColor redColor];
    [middleView addSubview:promptTransferMoneyLab];
    
    
    _noteField=[[TextField alloc]initWithFrame:CGRectMake(0, 102, WITCH, 50) withPlaceholderStr:@"20个字以内" andKeyboardTypeNumberPad:NO withIndex:5];
    _noteField.textFieldDelegate=self;
    _noteField.textField.backgroundColor=[UIColor whiteColor];
    _noteField.textField.textAlignment=NSTextAlignmentCenter;
    [middleView addSubview: _noteField];
    
    UILabel *promptNoteLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 102, 100, 50)];
    promptNoteLab.text=@" 备注";
//    promptNoteLab.backgroundColor=[UIColor redColor];
    [middleView addSubview:promptNoteLab];
    
    [self.view addSubview:middleView];
    
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 430, WITCH, HEIGHT-430)];
    footerView.backgroundColor=[UIColor whiteColor];
 
    
    _doneBnt=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-44, WITCH, 44)];
    _doneBnt.backgroundColor=[UIColor orangeColor];
    [_doneBnt setTitle:@"确认转账" forState:UIControlStateNormal];
    [_doneBnt addTarget:self action:@selector(doneClick) forControlEvents:UIControlEventTouchDown];
    _doneBnt.titleLabel.font=[UIFont systemFontOfSize:16];
    [_doneBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    

   
    [self.view addSubview:footerView];
    [self.view addSubview: _doneBnt];
    

}

-(void)doneClick{

    if([_otherAccountField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入用户名" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    if([_transferMoneyField.textField.text isEqualToString:@""]){
        
        [DTGTAlertView showWithTitle:@"请输入密码" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
        return;
    }
    
    
    
    [self httpRequest];

}


-(void)httpRequest{
  

    
    NSString *url=@"http://192.168.1.132:8084/rest/appNodejs/invoke";

    NSString *getUrl=[NSString stringWithFormat:@"%@/%@/%@/%@",url,myAccount,_otherAccountField.textField.text,_transferMoneyField.textField.text];
    
//    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
//    [infoDic setObject:_otherAccountField.textField.text forKey:@"otherAccount"];//123456
//    [infoDic setObject:_transferMoneyField.textField.text forKey:@"transferMoney"];//admin
//    [infoDic setObject:myAccount forKey:@"myAccount"];//admin
    
    
    [AFNetworkTool JSONDataWithUrl:getUrl success:^(id json) {
        
        NSDictionary *result = json;

      
        [self fillWithJsonString:result];
        
        
    } fail:^{
        
        NSLog(@"请求失败");
    }];
    
    
  
        
    
        
  
    
    
}

- (void)fillWithJsonString:(NSDictionary*)dicData {
    
    NSLog(@"dicData==%@",dicData);
    int  code =[[dicData objectForKey:@"code"] intValue];
 
   
    NSString *resultStr=[dicData objectForKey:@"msg"];
    NSLog(@"resultStr==%@",resultStr);
 
    
//    if(code==102||code==103){
    
//        [DTGTAlertView showWithTitle:str andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
    
//    }
    
    if(code ==200){
        _noteField.textField.text=[dicData objectForKey:@"code"];
        [DTGTAlertView showWithTitle:@"转账成功" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
    }else {
    
        _noteField.textField.text=[dicData objectForKey:@"code"];
        [DTGTAlertView showWithTitle:resultStr andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
    }
    
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    [_otherAccountField.textField resignFirstResponder];
    [_transferMoneyField.textField resignFirstResponder];
    [_noteField.textField resignFirstResponder];
    
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

//
//  DTGTAddAddressViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTAddAddressViewController.h"
#import "macros.pch"
#import "AdressModel.h"
#import "TobyCityPicker.h"
@interface DTGTAddAddressViewController ()

@end

@implementation DTGTAddAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title=@"添加新地址";
    [self.view setBackgroundColor:ZPJColor(245, 245, 245)];
//    [self.navigationController setNavigationBarHidden:NO];
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(rightSaveClick)];
    self.navigationItem.rightBarButtonItem=rightButton;
    
    
    UIFont *font=[UIFont fontWithName:@"Helvetica" size:14.0];
    UILabel *collectionLab=[[UILabel alloc]initWithFrame:CGRectMake(19, 64, 80, 44)];
    collectionLab.text=@"收货人:";
    collectionLab.textColor=ZPJColor(136, 136, 136);
    collectionLab.backgroundColor=[UIColor clearColor];
    collectionLab.font=font;
    [self.view addSubview:collectionLab];
    
    collectionField=[[TextField alloc]initWithFrame:CGRectMake(90, 64, kBoundsSize.width-100, 44) withPlaceholderStr:@"请输入收货人信息" andKeyboardTypeNumberPad:NO withIndex:9];
    collectionField.textField.text = _model.personName;
    collectionField.textField.backgroundColor=[UIColor clearColor];
    collectionField.textField.textColor=ZPJColor(51, 51, 51);
    [self.view addSubview:collectionField];
    
    UILabel *phoneNumberLab=[[UILabel alloc]initWithFrame:CGRectMake(19, 64+44, 80, 44)];
    phoneNumberLab.textColor=ZPJColor(136, 136, 136);
    phoneNumberLab.backgroundColor=[UIColor clearColor];
    phoneNumberLab.font=font;
    phoneNumberLab.text=@"手机号码:";
    [self.view addSubview:phoneNumberLab];
    
    phoneNumberField=[[TextField alloc]initWithFrame:CGRectMake(90, 64+44, kBoundsSize.width-100, 44) withPlaceholderStr:@"请输入收货人手机号码" andKeyboardTypeNumberPad:YES withIndex:10];
    phoneNumberField.textField.text = _model.phoneNum;
    phoneNumberField.textField.backgroundColor=[UIColor clearColor];
    phoneNumberField.textField.textColor=ZPJColor(51, 51, 51);
    [self.view addSubview:phoneNumberField];
    
    UILabel *areaLab=[[UILabel alloc]initWithFrame:CGRectMake(19, 64+88, 80, 44)];
    areaLab.textColor=ZPJColor(136, 136, 136);
    areaLab.backgroundColor=[UIColor clearColor];
    areaLab.font=font;
    areaLab.text=@"所在地区:";
    [self.view addSubview:areaLab];
    
    areBnt=[[UIButton alloc]initWithFrame:CGRectMake(80, 64+88, kBoundsSize.width-100, 44)];
    [areBnt setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [areBnt setBackgroundColor:[UIColor clearColor]];
    [areBnt setTitle:@"请选择所在地区" forState:UIControlStateNormal];
    [areBnt setTitleColor:ZPJColor(51, 51, 51) forState:UIControlStateNormal];
    areBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
    [areBnt addTarget:self action:@selector(areClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:areBnt];
    //图标
    UIImageView *arrowImg = [[UIImageView alloc] initWithFrame:CGRectMake(kBoundsSize.width-120, 12, 20, 20)];
    arrowImg.image=[UIImage imageNamed:@"The_background_frameEnter_the.png"];
    [areBnt addSubview:arrowImg];
    
    detailedAddressLab=[[UILabel alloc]initWithFrame:CGRectMake(19, 64+132, 80, 44)];
    detailedAddressLab.textColor=ZPJColor(136, 136, 136);
    detailedAddressLab.backgroundColor=[UIColor clearColor];
    detailedAddressLab.font=font;
    detailedAddressLab.text=@"详细地址:";
    [self.view addSubview:detailedAddressLab];
    
    detailedAddressView=[[UITextView alloc] initWithFrame:CGRectMake(90, 64+132, kBoundsSize.width-100, 44)];
    detailedAddressView.backgroundColor=[UIColor clearColor];
    detailedAddressView.textColor=ZPJColor(51, 51, 51);
    detailedAddressView.font = [UIFont fontWithName:@"Helvetica" size:14.0];
    detailedAddressView.delegate=self;
    detailedAddressView.returnKeyType=UIReturnKeyDone;
    detailedAddressView.text = _model.detailAdress;
    [self.view addSubview:detailedAddressView];
    
    zipCode=[[UILabel alloc]initWithFrame:CGRectMake(19, 64+176, 80, 44)];
    zipCode.textColor=ZPJColor(136, 136, 136);
    zipCode.backgroundColor=[UIColor clearColor];
    zipCode.font=font;
    zipCode.text=@"邮政编码:";
    [self.view addSubview:zipCode];
    
    zipCodeField=[[TextField alloc]initWithFrame:CGRectMake(90, 64+176, kBoundsSize.width-100, 44) withPlaceholderStr:@"请输入邮政编码" andKeyboardTypeNumberPad:YES withIndex:11];
    zipCodeField.textField.text = _model.postCode;
    zipCodeField.textField.textColor=ZPJColor(51, 51, 51);
    zipCodeField.textField.backgroundColor=[UIColor clearColor];
    [self.view addSubview:zipCodeField];
    //画分隔线
    for(int i=0;i<6;i++){
        
        UIImageView *lineView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 64+i*43+i, kBoundsSize.width, 1)];
        lineView.backgroundColor=ZPJColor(229,229,229);
        [self.view addSubview:lineView];
        
    }
    //阴影背景
//    greyImgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kBoundsSize.width, kBoundsSize.height)];
//    greyImgView.image=[UIImage imageNamed:@"grey.png"];
//    greyImgView.hidden=YES;
//    greyImgView.userInteractionEnabled=YES;
//    [self.view addSubview:greyImgView];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)rightSaveClick{

    NSLog(@"collectionField==%@",collectionField.textField.text);
    NSLog(@"zipCodeField==%@",zipCodeField.textField.text);
    NSLog(@"detailedAddressView==%@",detailedAddressView.text);
    NSLog(@"phoneNumberField==%@",phoneNumberField.textField.text);
    [collectionField.textField resignFirstResponder];
    [phoneNumberField.textField resignFirstResponder];
    [zipCodeField.textField resignFirstResponder];
    [detailedAddressView resignFirstResponder];
    
    if (![collectionField.textField.text isEqualToString:@""] && ![phoneNumberField.textField.text isEqualToString:@""] && ![detailedAddressView.text isEqualToString:@""]) {
        AdressModel *addressModel = [[AdressModel alloc] init];
        addressModel.personName = collectionField.textField.text;
        addressModel.phoneNum = phoneNumberField.textField.text;
        addressModel.cityName = areBnt.currentTitle;
        addressModel.detailAdress = detailedAddressView.text;
        addressModel.postCode = zipCodeField.textField.text;
        
        [self.navigationController popViewControllerAnimated:YES];
        
    }else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"收货人、联系电话、详细地址不能为空!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }

}


//点击屏幕空白处去掉键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [collectionField.textField resignFirstResponder];
    [phoneNumberField.textField resignFirstResponder];
    [zipCodeField.textField resignFirstResponder];
    [detailedAddressView resignFirstResponder];
   
}
-(void)areClick
{

   
    [collectionField.textField resignFirstResponder];
    [phoneNumberField.textField resignFirstResponder];
    [zipCodeField.textField resignFirstResponder];
    [detailedAddressView resignFirstResponder];
    
    
    TobyCityPicker *cityPicker=[[TobyCityPicker alloc]init];
    [cityPicker cityPikerGetSelectCity:^(NSMutableDictionary *dicSelectCity) {
        
        NSString *provinceStr = [dicSelectCity objectForKey:@"Province"];
        NSString *cityStr = [dicSelectCity objectForKey:@"City"];
        NSString *areaString=[NSString stringWithFormat:@"%@ %@",provinceStr,cityStr];
        NSLog(@"areaString==%@",areaString);
        [areBnt setTitle:areaString forState:UIControlStateNormal];
      
    }];
 
}




/**点击键盘按钮执行方法 */
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        //        [self moveDownView];
        return NO;
    }
    return YES;
}
@end

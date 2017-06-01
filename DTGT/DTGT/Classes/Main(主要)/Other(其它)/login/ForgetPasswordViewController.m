//
//  ForgetPasswordViewController.m
//  MallProject
//
//  Created by app on 15/7/7.
//  Copyright (c) 2015年 jianlong. All rights reserved.
//

#import "ForgetPasswordViewController.h"
#import "TextField.h"
#import "macros.pch"
#import "AFNetworkTool.h"
@interface ForgetPasswordViewController () <TextFieldDelegate>

@end

@implementation ForgetPasswordViewController

- (instancetype)initwithTitle:(NSString *)titleString withType:(int)type{
    if (self == [super init]) {
        titleStr=titleString;
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //添加控件
    [self configUI];
}

-(void)loadData{
    
      
}

/** 解析数据*/
- (void)fillWithJsonString:(NSDictionary*)dicData {
//    _dataSource = [[NSMutableArray alloc] init];
//    NSDictionary *resultDict = [dicData objectForKey:@"data"];
//    NSArray *array = [resultDict objectForKey:@"items"];
//    for (NSDictionary *dict in array) {
//        Product *product = [[Product alloc]init];
//        product.productId = [dict objectForKey:@"id"];
//        product.productTitle = [dict objectForKey:@"description"];
//        product.productPrice = [dict objectForKey:@"price"];
//        
//        product.productImgUrl = [[dict objectForKey:@"image_urls"] firstObject];
//        
//        product.productImgUrls = [dict objectForKey:@"image_urls"];
//        [_dataSource addObject:product];
//    }
//    [_collectionView reloadData];
    //    [_collectionView.header endRefreshing];
    
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




/**返回按钮的响应事件*/
- (void)getBack
{
    [_timer invalidate];
    [self.navigationController popViewControllerAnimated:YES];
}
/**页面布局*/
- (void)configUI {
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1.0f];
    //自定义标题
    UIView *itemBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    itemBgView.backgroundColor = [UIColor grayColor];
    // 标题
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = titleStr;
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
    
    // 手机号提示信息
    UILabel *mobileLab = [[UILabel alloc]initWithFrame:CGRectMake(19, 78, kBoundsSize.width-38, 20)];
    mobileLab.text = @"请输入您的手机号码，获取验证码";
    mobileLab.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    mobileLab.font = [UIFont fontWithName:@"Helvetica" size:15.0];
//    [self.view addSubview:mobileLab];
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
    // 手机号文字
    UILabel *identifyingLab = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, 70, 20)];
    identifyingLab.text = @"手机号:";
    identifyingLab.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    identifyingLab.font = [UIFont fontWithName:@"Helvetica" size:15.0];
//    [phoneBackView addSubview:identifyingLab];
    // 手机号输入框
    _phoneNumberField = [[TextField alloc] initWithFrame:CGRectMake(75, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"请输入手机号" andKeyboardTypeNumberPad:YES withIndex:3];
    _phoneNumberField.textFieldDelegate = self;
    _phoneNumberField.textField.backgroundColor = [UIColor whiteColor];
    _phoneNumberField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [phoneBackView addSubview:_phoneNumberField];
 
    
    // 验证码输入框背景图
    UIView *identifyingBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 113+49, kBoundsSize.width, 49)];
    identifyingBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:identifyingBackView];
    // 验证码背景图分割线
    UIImageView *topLineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 1)];
    topLineView1.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [identifyingBackView addSubview:topLineView1];
    UIImageView *bottomLineView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 48, kBoundsSize.width, 1)];
    bottomLineView1.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [identifyingBackView addSubview:bottomLineView1];
    // 验证码
    UILabel *identifyingLabel = [[UILabel alloc]initWithFrame:CGRectMake(19, 14, 70, 20)];
    identifyingLabel.text = @"验证码:";
    identifyingLabel.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1.0f];
    identifyingLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
//    [identifyingBackView addSubview:identifyingLabel];
    // 手机短信证码输入框
    _identifyingField=[[TextField alloc]initWithFrame:CGRectMake(75, 4, kBoundsSize.width-75-19-50, 40) withPlaceholderStr:@"请输入验证码" andKeyboardTypeNumberPad:YES withIndex:4];
    _identifyingField.textField.backgroundColor = [UIColor whiteColor];
    _identifyingField.textField.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [identifyingBackView addSubview:_identifyingField];
    
    // 获取验证码按钮
    getIdentifyingBnt = [UIButton buttonWithType:UIButtonTypeCustom];
    getIdentifyingBnt.frame = CGRectMake(75+50+50+50+20+20, 4, kBoundsSize.width-75-19-100-50-50+20, 40);
    getIdentifyingBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];
//    [getIdentifyingBnt setBackgroundImage:[UIImage imageNamed:@"login_default.png"] forState:UIControlStateNormal];
//    [getIdentifyingBnt setBackgroundImage:[UIImage imageNamed:@"login_lighted.png"] forState:UIControlStateHighlighted];
//    [getIdentifyingBnt setBackgroundImage:[UIImage imageNamed:@"login_lighted.png"] forState:UIControlStateSelected];
    [getIdentifyingBnt setBackgroundColor:[UIColor whiteColor]];
    getIdentifyingBnt.enabled=NO;
    [getIdentifyingBnt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [getIdentifyingBnt setTitle:@"获取验证码" forState:UIControlStateNormal];
    [getIdentifyingBnt setTitle:@"" forState:UIControlStateSelected];
    [getIdentifyingBnt addTarget:self action:@selector(getIdentifyingCodeClick) forControlEvents:UIControlEventTouchUpInside];
    [identifyingBackView addSubview:getIdentifyingBnt];
    
    
    
    
    // 下一步输入框背景图
    UIView *nextBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 300, kBoundsSize.width, 44)];
    nextBackView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:nextBackView];
    // 下一步背景图分割线
    UIImageView *topLineView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 1)];
    topLineView2.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [nextBackView addSubview:topLineView2];
    UIImageView *bottomLineView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 43, kBoundsSize.width, 1)];
    bottomLineView2.backgroundColor = [UIColor colorWithRed:229/255.0f green:229/255.0f blue:229/255.0f alpha:1.0f];
    [nextBackView addSubview:bottomLineView2];
    // 下一步按钮
    nextBnt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextBnt.frame = CGRectMake(0, 1, kBoundsSize.width, 42);
    nextBnt.backgroundColor = [UIColor orangeColor];
    nextBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [nextBnt setTitle:@"下一步" forState:UIControlStateNormal];
    [nextBnt setTintColor:[UIColor whiteColor]];
    [nextBnt addTarget:self action:@selector(nextBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [nextBackView addSubview:nextBnt];
    // 倒计时标签
    _timeLabel = [[UILabel alloc] initWithFrame: CGRectMake(75+50+50+50+20+20, 4, kBoundsSize.width-75-19-100-50-50, 40)];
    _timeLabel.backgroundColor = [UIColor clearColor];
    _timeLabel.textColor = [UIColor orangeColor];
    _timeLabel.font = [UIFont fontWithName:@"Helvetica" size:13.0];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.hidden = YES;
    [identifyingBackView addSubview:_timeLabel];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}
/**计时器的响应方法*/
- (void)changeTimeLabel {
    _time--;
    _timeLabel.text = [NSString stringWithFormat:@"(%ld秒)重新获取",_time];
    getIdentifyingBnt.enabled=NO;
    if (_time == 0) {
        [_timer invalidate];
        [getIdentifyingBnt setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        _timeLabel.hidden = YES;
        getIdentifyingBnt.enabled=YES;
    }
}
/**确定进行验证并执行页面跳转*/
-(void)nextBtnClick
{
//    [_timer invalidate];
//    _timeLabel.hidden = YES;
//    getIdentifyingBnt.enabled = YES;
//    [getIdentifyingBnt setTitle:@"重新获取验证码" forState:UIControlStateNormal];
//    if([_identifyingField.textField.text isEqualToString:@"1234"]) {
//         GJLNewPasswordViewController*npVC = [[GJLNewPasswordViewController alloc]init];
//        [self.navigationController pushViewController:npVC animated:YES];
//    }else {
//        // 验证码提示框
//        _alertLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 250, kBoundsSize.width, 44)];
//        _alertLabel.textColor = [UIColor redColor];
//        _alertLabel.text = @"验证码不正确";
//        _alertLabel.textAlignment = NSTextAlignmentCenter;
//        _alertLabel.textColor = [UIColor blackColor];
//        _alertLabel.font = [UIFont fontWithName:@"Helvetica" size:14.0];
//        [self.view addSubview:_alertLabel];
//    }
    [self loadData];
}
/**获取手机号验证码的响应事件*/
- (void)getIdentifyingCodeClick
{
    if ([_phoneNumberField validateUserPhone:_phoneNumberField.textField.text] == YES) {
        _phoneError.hidden = YES;
        _time = 60;
        [getIdentifyingBnt setTitle:@"" forState:UIControlStateNormal];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(changeTimeLabel) userInfo:nil repeats:YES];
        [_timer fire];
        _timeLabel.hidden = NO;
    }else {
        _phoneError = [[UILabel alloc] initWithFrame:CGRectMake(0, 250, kBoundsSize.width, 44)];
        _phoneError.text = @"手机号码不正确";
        _phoneError.textAlignment = NSTextAlignmentCenter;
        _phoneError.textColor = [UIColor blackColor];
        _phoneError.font = [UIFont fontWithName:@"Helvetica" size:14.0];
        [self.view addSubview:_phoneError];
    }
}

-(void)setTextHide:(BOOL)bol
{
    if(bol)
    {
        _alertLabel.hidden = YES;
        _alertLabel.text = nil;
        _phoneError.hidden = YES;
        _phoneError.text = nil;
    }
    else
    {
        
    }
}
/**点击输入框以外的位置，收回键盘*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phoneNumberField.textField resignFirstResponder];
    [_identifyingField.textField resignFirstResponder];
}


/**点击验证码按钮状态代理方法调用*/
-(void)setDoneBnt{
    
    if(![_phoneNumberField.textField.text  isEqualToString:@""]){
        getIdentifyingBnt.enabled=YES;
    }
    else
    {
        
        getIdentifyingBnt.enabled=NO;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

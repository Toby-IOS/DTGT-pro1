//
//  DTGTIdentityViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/15.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTIdentityViewController.h"
#import "macros.pch"
@interface DTGTIdentityViewController ()

@end

@implementation DTGTIdentityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title=@"身份认证";
    self.view.backgroundColor=ZPJColor(245, 245, 245);
    // Do any additional setup after loading the view from its nib.
    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
    itemBgView.userInteractionEnabled=YES;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = @"实名认证";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor =[UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Helvetica" size:18.0];
    [itemBgView addSubview:title];
    [self.view addSubview:itemBgView];
    
//    UIButton *leftBarBnt = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 50, 44)];
//    leftBarBnt.backgroundColor=[UIColor clearColor];
//    [leftBarBnt setImage:[UIImage imageNamed:@"Industrychoose_return.png"] forState:UIControlStateNormal];
//    [leftBarBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [leftBarBnt addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [itemBgView addSubview:leftBarBnt];

    [self.view addSubview:self.tableView];
    
    
    UIView *footerView=[[UIView alloc]initWithFrame:CGRectMake(0, 445, WITCH, 200)];
    
    UIFont *promptFont=[UIFont systemFontOfSize:13.0f];
    UIFont *contentFont=[UIFont systemFontOfSize:12.0f];
    
    UILabel * promptTitleLab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, WITCH-20, 20)];
    promptTitleLab1.text=@"为什么要做实名认证？";
    promptTitleLab1.font=promptFont;
    [footerView addSubview:promptTitleLab1];
    
    UILabel * promptContentLab1=[[UILabel alloc]initWithFrame:CGRectMake(10, 30, WITCH-20, 50)];
    promptContentLab1.text=@"作为一个真实，严肃的收藏品交易平台，我们要求卖方必须完成实名认证";
    promptContentLab1.font=contentFont;
    promptContentLab1.textColor=[UIColor grayColor];
    promptContentLab1.numberOfLines=0;
    [footerView addSubview:promptContentLab1];
    
    
    UILabel * promptTitleLab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 90, WITCH-20, 20)];
    promptTitleLab2.text=@"关于隐私安全？";
    promptTitleLab2.font=promptFont;
    [footerView addSubview:promptTitleLab2];
    
    
    UILabel * promptContentLab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 110, WITCH-20, 50)];
    promptContentLab2.text=@"您上传的任何身份照片等资料，仅供审核使用，他人无法看到，此外，我们会对照片进行安全处理，请放心。";
    promptContentLab2.font=contentFont;
    promptContentLab2.numberOfLines=0;
    promptContentLab2.textColor=[UIColor grayColor];
    [footerView addSubview:promptContentLab2];

    _mainView.tableFooterView = footerView;
    
    UIButton *submitBnt=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WITCH, 49)];
    [submitBnt setTitle:@"提交" forState:UIControlStateNormal];
    submitBnt.backgroundColor=[UIColor orangeColor];
    [submitBnt addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:submitBnt];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**点击左键返回执行的方法*/
-(void)leftBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(UITableView*)tableView{

    if(!_mainView){
    
        
        _mainView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, WITCH, HEIGHT-64-49)];
        _mainView.backgroundColor=[UIColor clearColor];
        _mainView.delegate=self;
        _mainView.dataSource=self;
        
        
        
    }

    return _mainView;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return 3;


}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.row==0||indexPath.row==1){
        
        return 50;
    
    }else{
        return 350;
    
    }


}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{



    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];


    cell.selectionStyle=UITableViewCellAccessoryNone;
    if(indexPath.row==0){
  
     UILabel* nameLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 50)];
        nameLab.text=@"姓名";
        nameLab.textAlignment=NSTextAlignmentLeft;
        nameLab.font=[UIFont fontWithName:@"Helvetica" size:14.0];
        nameLab.backgroundColor=[UIColor clearColor];
        [cell addSubview:nameLab];
        
        
   
        nameField=[[TextField alloc]initWithFrame:CGRectMake(100, 0, WITCH-100, 50) withPlaceholderStr:@"请输入真实姓名" andKeyboardTypeNumberPad:NO withIndex:6];
        nameField.textField.textColor=ZPJColor(136,136,136);
        nameField.textFieldDelegate=self;
        nameField.textField.secureTextEntry = YES;
        [nameField.textField setBackgroundColor:[UIColor clearColor]];
        [cell addSubview:nameField];
    }else  if(indexPath.row==1){
    
        UILabel* cardNumberLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 100, 50)];
        cardNumberLab.text=@"身份证号";
        cardNumberLab.textAlignment=NSTextAlignmentLeft;
        cardNumberLab.font=[UIFont fontWithName:@"Helvetica" size:14.0];
        cardNumberLab.backgroundColor=[UIColor clearColor];
        [cell addSubview:cardNumberLab];
        
        cardNumberField=[[TextField alloc]initWithFrame:CGRectMake(100, 0, WITCH-100, 50) withPlaceholderStr:@"请输入身份证号" andKeyboardTypeNumberPad:NO withIndex:6];
        cardNumberField.textField.textColor=ZPJColor(136,136,136);
        cardNumberField.textFieldDelegate=self;
        cardNumberField.textField.secureTextEntry = YES;
        [cardNumberField.textField setBackgroundColor:[UIColor clearColor]];
        [cell addSubview:cardNumberField];
    
    }
    else if(indexPath.row==2){
    
    
        UILabel* cardNumberLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 0,WITCH-20, 50)];
        cardNumberLab.text=@"身份证照片(正面，背面，手持)";
        cardNumberLab.textAlignment=NSTextAlignmentLeft;
        cardNumberLab.font=[UIFont fontWithName:@"Helvetica" size:14.0];
        cardNumberLab.backgroundColor=[UIColor clearColor];
        [cell addSubview:cardNumberLab];
    
    
        
        for(int i=0;i<3;i++){
        
            UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30,80*i+20*(i+1)+30 , 140, 80)];
            imageView.image=[UIImage imageNamed:[NSString stringWithFormat:@"realname_face_150x95_%i",i+1]];
            [cell addSubview:imageView];
        
        }
        
        for(int i=0;i<3;i++){
            
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(200,80*i+20*(i+1)+30 , 140, 80)];
            button.tag=i;
            [button setImage:[UIImage imageNamed:@"realname_upload_150x95"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            [cell addSubview:button];
            
        }
        
    
    }
    
    return cell;


}
-(void)buttonClick:(UIButton*)button{

    NSLog(@"button==%ld",button.tag);

}
-(void)submitClick{

    NSLog(@"submitClick");

}
/**点击屏幕空白处取消键盘*/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nameField.textField resignFirstResponder];
    [cardNumberField.textField resignFirstResponder];
    
}
@end

//
//  DTGTMineViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTMineViewController.h"
#import "macros.pch"
#import "GJLSeetingViewController.h"
#import "UserLoginViewController.h"

@interface DTGTMineViewController ()

@end

@implementation DTGTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    //    self.navigationItem.title=@"我的";
    self.navigationController.navigationBarHidden=YES;

    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width,200)];
    [bgView setImage:[UIImage imageNamed:@"person_bgImage"]];
    bgView.userInteractionEnabled=YES;
    [self.view addSubview:bgView];

    //自定义导航栏背景图片
    topBackView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kBoundsSize.width, kTitleBarH)];
    topBackView.userInteractionEnabled = YES;
    [topBackView setBackgroundColor:[UIColor clearColor]];
    
    UILabel *mainlab=[[UILabel alloc]initWithFrame:CGRectMake((WITCH-150)/2, 20, 150, 50)];
    mainlab.textAlignment=NSTextAlignmentCenter;
    mainlab.text=@"我的";
    mainlab.textColor=[UIColor whiteColor];
    [topBackView addSubview:mainlab];
    
    // 右边分类按钮
    rightBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setFrame:CGRectMake(WITCH-2*19-10, 29,50, 30)];
    
    [rightBtn setTitle:@"设置" forState:UIControlStateNormal];
    rightBtn.titleLabel.font=[UIFont fontWithName:@"Helvetica" size:14.0];
    rightBtn.backgroundColor=[UIColor clearColor];
    
    [rightBtn addTarget:self action:@selector(rightButtonOnClick) forControlEvents:UIControlEventTouchUpInside];
    [topBackView addSubview:rightBtn];
    [self.view addSubview:topBackView];
  
    UILabel *loginlab=[[UILabel alloc]initWithFrame:CGRectMake(40, 0, 50, 30)];
    loginlab.font=[UIFont fontWithName:@"Helvetica" size:13.0];
    loginlab.textAlignment=NSTextAlignmentCenter;
    loginlab.text=@"Toby";
    loginlab.textColor=[UIColor orangeColor];
//    [bgView addSubview:loginlab];
    
    loginStateLab=[[UILabel alloc]initWithFrame:CGRectMake((kBoundsSize.width-150)/2, 130, 150, 40)];
    loginStateLab.font=[UIFont fontWithName:@"Helvetica" size:15.0];
    loginStateLab.textAlignment=NSTextAlignmentCenter;
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        loginStateLab.text=@"已登录";
    }else{
//        loginStateLab.text=@"未登录";
    }

    loginStateLab.textColor=[UIColor orangeColor];
    
    UIImage*img=[UIImage imageNamed:@"chatui_head_bg"];
    UIImageView *peopleView = [[UIImageView alloc] initWithFrame:CGRectMake((WITCH-60)/2, 70, 60,60)];
    [peopleView setImage:img];
    [bgView addSubview:loginStateLab];
    [bgView addSubview:peopleView];
    
    loginBnt=[[UIButton alloc]initWithFrame:CGRectMake((WITCH-60)/2, 70+60, 60, 60)];
    [loginBnt setTitle:@"登录" forState:UIControlStateNormal];
    [loginBnt addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchDown];
    [bgView addSubview:loginBnt];
    
    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(0,bgView.frame.size.height , WITCH, HEIGHT-bgView.frame.size.height)];
    textView.text=@"公司介绍：大唐宝通有限公司成立于二零一七年四月。是经北京工商行政管理局核准注册的综合性艺术品交易平台，公司注册资金1亿人民币。北京作为首都，又是中国政治经济文化中心，文化古城，最早开放的商业城市，艺术品收藏与交易非常活跃，吸引着全球收藏者的目光。大唐宝通有限公司汇聚多年在艺术品收藏市场运作的艺术品经纪人，在这片投资热土上因市而兴、因势而变，可谓天时地利人和，以大量资金人才投入强势打造中国艺术收藏品企业，为收藏爱好者提供一个集鉴定、展览、评估与销售的顶级艺术品交易平台。";
    textView.font=[UIFont systemFontOfSize:16.0];
    textView.textColor=[UIColor orangeColor];
    [self.view addSubview:textView];
    
}
-(void)loginAction{
    UserLoginViewController* login=[[UserLoginViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:nil];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        loginStateLab.text=@"已登录";
        loginBnt.hidden=YES;
    }else{
        loginStateLab.text=@" ";
        loginBnt.hidden=NO;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rightButtonOnClick{
    
    NSLog(@"rightButtonOnClick");
    GJLSeetingViewController *stVC=[[GJLSeetingViewController alloc]init];
    stVC.hidesBottomBarWhenPushed=YES;
    [ self.navigationController pushViewController:stVC animated:YES];
    
}


@end

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
    // Do any additional setup after loading the view from its nib.
    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
    itemBgView.userInteractionEnabled=YES;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = @"身份认证";
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor =[UIColor whiteColor];
    title.font = [UIFont fontWithName:@"Helvetica" size:18.0];
    [itemBgView addSubview:title];
    [self.view addSubview:itemBgView];
    
    UIButton *leftBarBnt = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 50, 44)];
    leftBarBnt.backgroundColor=[UIColor clearColor];
    [leftBarBnt setImage:[UIImage imageNamed:@"Industrychoose_return.png"] forState:UIControlStateNormal];
    [leftBarBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftBarBnt addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [itemBgView addSubview:leftBarBnt];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**点击左键返回执行的方法*/
-(void)leftBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

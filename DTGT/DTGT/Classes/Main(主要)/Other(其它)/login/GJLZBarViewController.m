//
//  GJLZBarViewController.m
//  Toby
//
//  Created by small T on 17/3/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "GJLZBarViewController.h"
#import "macros.pch"
@interface GJLZBarViewController ()

@end

@implementation GJLZBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
    itemBgView.userInteractionEnabled=YES;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = @"二维码扫描";
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
    
    UILabel *mainlab=[[UILabel alloc]initWithFrame:CGRectMake((WITCH-300)/2, 300, 300, 50)];
    mainlab.textAlignment=NSTextAlignmentCenter;
    mainlab.text=@"二维码扫描页面";
    [self.view addSubview:mainlab];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)leftBtnClick{

    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end

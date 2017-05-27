//
//  DTGTQRcodeViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTQRcodeViewController.h"
#import "macros.pch"
@interface DTGTQRcodeViewController ()

@end

@implementation DTGTQRcodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title=@"我的二维码";
    UIImageView *qrImgeView=[[UIImageView  alloc]initWithFrame:CGRectMake(0, 64, WITCH, HEIGHT-64) ];
    qrImgeView.image=[UIImage imageNamed:@"qr_big"];
    [self.view addSubview:qrImgeView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

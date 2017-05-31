//
//  DTGTtransferAccountsViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/31.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTtransferAccountsViewController.h"
#import "macros.pch"
@interface DTGTtransferAccountsViewController ()

@end

@implementation DTGTtransferAccountsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    self.navigationItem.title=@"转账";
    [self.navigationController setNavigationBarHidden:NO];
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

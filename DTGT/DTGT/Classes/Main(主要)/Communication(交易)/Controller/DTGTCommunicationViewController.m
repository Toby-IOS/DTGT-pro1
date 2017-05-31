//
//  DTGTCommunicationViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTCommunicationViewController.h"
#import "DTGTSubmitViewController.h"
#import "macros.pch"
#import "UserLoginViewController.h"
@interface DTGTCommunicationViewController ()
@property(nonatomic,strong)IBOutlet UIButton *telephoneBnt;
@property(nonatomic,strong)IBOutlet UIButton *submitBnt;


@end

@implementation DTGTCommunicationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    
    
}
- (IBAction)telephoneClick:(id)sender {

    NSLog(@"telephoneClick");
    
    NSMutableString *str=[[NSMutableString alloc] initWithFormat:@"tel:%@",@"010-57965654"];
//    UIWebView *callWebView=[[UIWebView alloc]init];
//    [callWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
//    [self.view addSubview:callWebView];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
}

- (IBAction)submitClick:(id)sender {
     NSLog(@"submitClick");
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        
    DTGTSubmitViewController *submitVC=[[DTGTSubmitViewController alloc]init];
    [self presentViewController:submitVC animated:YES completion:nil];
        
    }else{
        
        UserLoginViewController* login=[[UserLoginViewController alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
        [self presentViewController:nav animated:YES completion:nil];
        
    }
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

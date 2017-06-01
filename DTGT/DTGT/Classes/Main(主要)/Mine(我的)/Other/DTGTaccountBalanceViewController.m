//
//  DTGTaccountBalanceViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/31.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTaccountBalanceViewController.h"
#import "macros.pch"
#import "DTGTAlertView.h"
#import "AFNetworkTool.h"
@interface DTGTaccountBalanceViewController ()

@end

@implementation DTGTaccountBalanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    self.navigationItem.title=@"账户余额";
    [self.navigationController setNavigationBarHidden:NO];
    [self httpRequest];

    mainTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WITCH, HEIGHT)];
    mainTableView.delegate=self;
    mainTableView.dataSource=self;
    mainTableView.backgroundColor=[UIColor clearColor];
    [self setExtraCellLineHidden:mainTableView];
    [self.view addSubview:mainTableView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 150;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];

    cell.selectionStyle=UITableViewCellAccessoryNone;

    promptLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 20, 150, 20)];
    
    promptLab.text=@"可用余额(元)";
    promptLab.font=[UIFont systemFontOfSize:14];
    [cell addSubview:promptLab];
    
    balanceLab=[[UILabel alloc]initWithFrame:CGRectMake(10, 40, 150, 60)];
    balanceLab.text=@"0.00";
    balanceLab.textColor=[UIColor orangeColor];
    balanceLab.font=[UIFont systemFontOfSize:23];
    [cell addSubview:balanceLab];
    
    queryDetailsBnt=[[UIButton alloc]initWithFrame:CGRectMake(WITCH-120, 30, 100, 40)];
    [queryDetailsBnt setTitle:@"查看明细 >" forState:UIControlStateNormal];
    queryDetailsBnt.titleLabel.font=[UIFont systemFontOfSize:14];
    [queryDetailsBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [queryDetailsBnt addTarget:self action:@selector(queryDetailsClick) forControlEvents:UIControlEventTouchDown];
    [cell addSubview:queryDetailsBnt];
    
    lineLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, WITCH, 1)];
    [lineLab setBackgroundColor:[UIColor lightGrayColor]];
    [cell addSubview:lineLab];
    
    vLine=[[UILabel alloc] initWithFrame:CGRectMake(WITCH/2, 110, 1, 30)];
    [vLine setBackgroundColor:[UIColor lightGrayColor]];
    [cell addSubview:vLine];
    
    rechargeBnt=[[UIButton alloc]initWithFrame:CGRectMake(0, 100, WITCH/2, 50)];
    [rechargeBnt setTitle:@"充值" forState:UIControlStateNormal];
    rechargeBnt.titleLabel.font=[UIFont systemFontOfSize:18];
    [rechargeBnt addTarget:self action:@selector(rechargeClick) forControlEvents:UIControlEventTouchDown];
    [rechargeBnt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [cell addSubview:rechargeBnt];
    
    extractBnt=[[UIButton alloc]initWithFrame:CGRectMake(WITCH/2, 100, WITCH/2, 50)];
    
    [extractBnt setTitle:@"提现" forState:UIControlStateNormal];
    [extractBnt addTarget:self action:@selector(extractClick) forControlEvents:UIControlEventTouchDown];
    extractBnt.titleLabel.font=[UIFont systemFontOfSize:18];
    [extractBnt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [cell addSubview:extractBnt];

    
    
    
    
    return  cell;
}

-(void)queryDetailsClick{

}

-(void)rechargeClick{
    
}

-(void)extractClick{
    
}




-(void)httpRequest{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    
    NSString *myAccount=[userDefault objectForKey:kUsername];
    
    
    NSString *url=@"http://192.168.1.132:8090/query/a";
    
//    balanceLab.text=;
    //    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    //    [infoDic setObject:_otherAccountField.textField.text forKey:@"otherAccount"];//123456
    //    [infoDic setObject:_transferMoneyField.textField.text forKey:@"transferMoney"];//admin
    //    [infoDic setObject:myAccount forKey:@"myAccount"];//admin
    
    
    [AFNetworkTool JSONDataWithUrl:url success:^(id json) {
        
        NSDictionary *result = json;
        NSLog(@"result==%@",result);
        
        [self fillWithJsonString:result];
        
        
    } fail:^{
        
        NSLog(@"请求失败");
    }];
    
    
    
    
    
    
    
    
    
}

- (void)fillWithJsonString:(NSDictionary*)dicData {
    
    NSLog(@"dicData==%@",dicData);
    int  code =[[dicData objectForKey:@"status"] intValue];
    
    NSDictionary *dic= [dicData objectForKey:@"contents"];
    NSDictionary *resultStr=[dic objectForKey:@"result"];
    NSLog(@"resultStr==%@",resultStr);
    NSString *string = [NSString stringWithFormat:@"%@", [resultStr objectForKey:@"data"]];
    
    
    NSLog(@"string==%@",string);
    
    balanceLab.text=@"查询成功";
    
    //    if(code==102||code==103){
    
    //        [DTGTAlertView showWithTitle:str andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
    
    //    }
    
    if(code ==200){
        
        [DTGTAlertView showWithTitle:@"查询成功" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];
    }
    
}





-(void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
}

@end

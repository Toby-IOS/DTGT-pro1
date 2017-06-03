//
//  DTGTInterfaceViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/6/3.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTInterfaceViewController.h"
#import "AFNetworkTool.h"
#import "macros.pch"


@interface DTGTInterfaceViewController ()

@end

@implementation DTGTInterfaceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title=@"接口调试";
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
//    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
//    itemBgView.userInteractionEnabled=YES;
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
//    title.text = @"设置";
//    title.textAlignment = NSTextAlignmentCenter;
//    title.textColor =[UIColor whiteColor];
//    title.font = [UIFont fontWithName:@"Helvetica" size:18.0];
//    [itemBgView addSubview:title];
//    [self.view addSubview:itemBgView];
//    
//    UIButton *leftBarBnt = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 50, 44)];
//    leftBarBnt.backgroundColor=[UIColor clearColor];
//    [leftBarBnt setImage:[UIImage imageNamed:@"Industrychoose_return.png"] forState:UIControlStateNormal];
//    [leftBarBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [leftBarBnt addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [itemBgView addSubview:leftBarBnt];
    
    
    array=[NSArray arrayWithObjects:@"12报价接口",@"13核对该项目是否报过价",@"14根据地址查出项目列表",@"15根据项目id查出报价人列表",@"16投票接口",@"17核对是否对该项目的报价人投过票", nil];
    
    mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kBoundsSize.width, kBoundsSize.height)];
    mainTableView.dataSource=self;
    mainTableView.delegate=self;
    [mainTableView setBackgroundColor:[UIColor clearColor]];
    [self setExtraCellLineHidden:mainTableView];
    
    [self.view addSubview:mainTableView];
    
    resultLab=[[UILabel alloc]initWithFrame:CGRectMake(0, HEIGHT-300, WITCH, 300)];
    resultLab.numberOfLines=0;
    resultLab.backgroundColor=[UIColor clearColor];
    resultLab.textAlignment=NSTextAlignmentCenter;
    resultLab.textColor=[UIColor redColor];
    [self.view addSubview:resultLab];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:15.0];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellAccessoryNone;
 
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0){
        [self httpRequest12];
    }else if (indexPath.row==1){
    
     [self httpRequest13];
    }else if (indexPath.row==2){
         [self httpRequest14];
        
    }else if (indexPath.row==3){
         [self httpRequest15];
        
    }else if (indexPath.row==4){
            [self httpRequest16];
        
    }else if (indexPath.row==5){
        
          [self httpRequest17];
    }


    
}

-(void)httpRequest12{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    //
    NSString *url=@"http://192.168.1.132:8084/rest/appProjectAndOffer/saveOffer";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    
     [infoDic setObject:@(2) forKey:@"projId"];//123456
     [infoDic setObject:@(78)  forKey:@"userId"];//123456
     [infoDic setObject:@"项目描述eada" forKey:@"offerDesc"];//123456
     [infoDic setObject:@(5500) forKey:@"offerPrice"];//123456
   
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    
}
-(void)httpRequest13{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    //
    NSString *url=@"http://192.168.1.132:8084/rest/appProjectAndOffer/checkUserOffer";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    
    [infoDic setObject:@"10" forKey:@"projectId"];//123456
    [infoDic setObject:@"78"  forKey:@"userId"];//123456
//    [infoDic setObject:@"项目描述eada" forKey:@"offerDesc"];//123456
    [infoDic setObject:userNameStr forKey:@"userName"];//123456
    
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    
    
}
-(void)httpRequest14{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    //
    NSString *url=@"http://192.168.1.132:8084/rest/appProjectAndOffer/getProjectList";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:@"河北省" forKey:@"province"];//123456
    [infoDic setObject:@"石家庄市" forKey:@"city"];//123456
//    [infoDic setObject:@"项目描述" forKey:@"offerDesc"];//123456
    [infoDic setObject:userNameStr forKey:@"userName"];//123456
    
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    
}
-(void)httpRequest15{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    //
    NSString *url=@"http://192.168.1.132:8084/rest/appProjectAndOffer/getOfferByProjectId";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:@"2" forKey:@"projectId"];//123456
//    [infoDic setObject:@"78" forKey:@"userId"];//123456
//    [infoDic setObject:@"项目描述" forKey:@"offerDesc"];//123456
//    [infoDic setObject:userNameStr forKey:@"userName"];//123456
    
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    
}
-(void)httpRequest16{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    //
    NSString *url=@"http://192.168.1.132:8084/rest/appVoke/saveVoke";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:@(2) forKey:@"projId"];//123456
    [infoDic setObject:@(31) forKey:@"userId"];//123456
    [infoDic setObject:@(78) forKey:@"vokeUserId"];//123456
//    [infoDic setObject:@"5500" forKey:@"offer_price"];//123456
    
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    

}
-(void)httpRequest17{
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *userNameStr= [userDefault objectForKey:kUsername];
    //
    NSString *url=@"http://192.168.1.132:8084/rest/appVoke/checkUserVoke";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:@"12" forKey:@"projectId"];//123456
    [infoDic setObject:@"78" forKey:@"UserId"];//123456
    [infoDic setObject:userNameStr forKey:@"UserName"];//123456
    //    [infoDic setObject:@"5500" forKey:@"offer_price"];//123456
    
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        [self fillWithJsonString:dic];
        
        
    } fail:^{
        
    }];
    
    
}
- (void)fillWithJsonString:(NSDictionary*)dicData {
  
    NSLog(@"dicData==%@",dicData);
    int  code =[[dicData objectForKey:@"code"] intValue];
    
    NSString *msg=[dicData objectForKey:@"msg"];
   
    resultLab.text=msg;
   NSLog(@"msg==%@",msg);
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








@end

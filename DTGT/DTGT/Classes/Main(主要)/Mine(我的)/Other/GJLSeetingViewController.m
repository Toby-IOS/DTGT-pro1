//
//  GJLSeetingViewController.m
//  Toby
//
//  Created by small T on 17/3/28.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "GJLSeetingViewController.h"
#import "macros.pch"
#import "DTGTTabBar.h"
#import "GJLNewPasswordViewController.h"
#import "AFNetworkTool.h"
@interface GJLSeetingViewController ()

@end

@implementation GJLSeetingViewController

- (void)viewDidLoad {
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    [self.navigationController setNavigationBarHidden:NO];
    self.navigationItem.title=@"设置";
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
    itemBgView.userInteractionEnabled=YES;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
    title.text = @"设置";
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
    

    array=[NSArray arrayWithObjects:@"密码修改",@"清除缓存",@"分享",@"关于我们", nil];
    
    mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64, kBoundsSize.width, kBoundsSize.height-64)];
    mainTableView.dataSource=self;
    mainTableView.delegate=self;
    [mainTableView setBackgroundColor:[UIColor clearColor]];
    [self setExtraCellLineHidden:mainTableView];
    
    [self.view addSubview:mainTableView];

    
    logOutBnt = [[UIButton alloc] initWithFrame: CGRectMake((WITCH-300)/2, 400, 300, 40)];
    logOutBnt.backgroundColor = [UIColor grayColor];
    logOutBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [logOutBnt setTitle:@"退出登录" forState:UIControlStateNormal];
    logOutBnt.titleLabel.textColor=[UIColor whiteColor];
    [logOutBnt addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:logOutBnt];
}
-(void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        logOutBnt.hidden=NO;
    }else{
        logOutBnt.hidden=YES;
    
    }

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
    if(indexPath.row==1){
     if(!cacheLab)
        cacheLab=[[UILabel alloc]initWithFrame:CGRectMake(WITCH-150, 10, 120, 30)];
        cacheLab.text=[NSString stringWithFormat:@"%.2fKB", [self readCacheSize] *1024];;
        cacheLab.textAlignment=NSTextAlignmentRight;
        cacheLab.font=[UIFont fontWithName:@"Helvetica" size:13.0];
        cacheLab.textColor=[UIColor grayColor];
        [cell addSubview:cacheLab];
    }
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==1){
        [self clearFile];
    }
    
    if(indexPath.row==0){
            GJLNewPasswordViewController *nsVC=[[GJLNewPasswordViewController alloc]init];
            [self.navigationController pushViewController:nsVC animated:YES];
    
    }

    
}











-(void)logOut{
    
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
     NSLog(@"333===%@",[userDefault objectForKey:kIsStorePassword]);
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        [userDefault setObject:@"0" forKey:kIsStorePassword];
    NSLog(@"444===%@",[userDefault objectForKey:kIsStorePassword]);
    }
//    UIViewController *groupBuyInfoVC = [self.navigationController.viewControllers objectAtIndex:2];
//  [self.navigationController popToViewController: groupBuyInfoVC animated:YES];

//    NSLog(@"self.navigationController.viewControllers==%@",self.tabBarController.tabBar.subviews);
//    self.navigationController.tabBarController.selectedIndex = 0;
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
//    for(UIView *view in self.tabBarController.tabBar.subviews){
//        if([view isKindOfClass:[GJLTabBar class]]){
//            NSLog(@"[GJLTabBar class]==%@",[GJLTabBar class] );
//        }
//    }
//     self.navigationController.tabBarController.selectedIndex = 0;
    [self loadData];
    [self.navigationController popViewControllerAnimated:NO];
}



-(void)loadData{
    
    NSString *url=@"http://192.168.1.132:8084/rest/appUser/loginOut";
    NSMutableDictionary *infoDic=[NSMutableDictionary dictionary];
    [infoDic setObject:@"8989" forKey:@"userName"];//123456
  
    
    [AFNetworkTool postJSONWithUrl:url parameters:infoDic success:^(id responseObject) {
        
        // 解析数据
        //        [self fillWithJsonString:result];
        
        
        NSString *outputString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"OK---返回数据：%@",outputString);
        
        NSData* jsonData = [outputString dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary* dic = [self toArrayOrNSDictionary:jsonData];
        
        NSLog(@"dic==%@",dic);
        
        
        
    } fail:^{
        
    }];
    
    
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












- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**点击左键返回执行的方法*/
-(void)leftBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
// 获取缓存文件的大小
-( float )readCacheSize
{
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory , NSUserDomainMask , YES) firstObject];
    return [ self folderSizeAtPath :cachePath];
}

//由于缓存文件存在沙箱中，我们可以通过NSFileManager API来实现对缓存文件大小的计算。
// 遍历文件夹获得文件夹大小，返回多少 M
- ( float ) folderSizeAtPath:( NSString *) folderPath{
    
    NSFileManager * manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath :folderPath]) return 0 ;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath :folderPath] objectEnumerator];
    NSString * fileName;
    long long folderSize = 0 ;
    while ((fileName = [childFilesEnumerator nextObject]) != nil ){
        //获取文件全路径
        NSString * fileAbsolutePath = [folderPath stringByAppendingPathComponent :fileName];
        folderSize += [ self fileSizeAtPath :fileAbsolutePath];
    }
    
    return folderSize/( 1024.0 * 1024.0);
    
}
// 计算 单个文件的大小
- ( long long ) fileSizeAtPath:( NSString *) filePath{
    NSFileManager * manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath :filePath]){
        return [[manager attributesOfItemAtPath :filePath error : nil] fileSize];
    }
    return 0;
}

// 清除缓存
- (void)clearFile
{
    NSString * cachePath = [NSSearchPathForDirectoriesInDomains (NSCachesDirectory , NSUserDomainMask , YES ) firstObject];
    NSArray * files = [[NSFileManager defaultManager ] subpathsAtPath :cachePath];
    //NSLog ( @"cachpath = %@" , cachePath);
    for ( NSString * p in files) {
        
        NSError * error = nil ;
        //获取文件全路径
        NSString * fileAbsolutePath = [cachePath stringByAppendingPathComponent :p];
        
        if ([[NSFileManager defaultManager ] fileExistsAtPath :fileAbsolutePath]) {
            [[NSFileManager defaultManager ] removeItemAtPath :fileAbsolutePath error :&error];
        }
    }
    
    [ self performSelectorOnMainThread : @selector (clearCacheSuccess) withObject : nil waitUntilDone : YES ];
    
}

-(void)clearCacheSuccess{

    NSLog(@"清理成功");
    NSIndexPath *index=[NSIndexPath indexPathForRow:1 inSection:0];//刷新
    [mainTableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:index,nil] withRowAnimation:UITableViewRowAnimationNone];
    
    
}


@end

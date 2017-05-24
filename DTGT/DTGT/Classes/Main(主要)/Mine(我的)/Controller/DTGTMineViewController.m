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
#import "DTGTPersonalViewController.h"
#import "DTGTIdentityViewController.h"
@interface DTGTMineViewController ()

@end

@implementation DTGTMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.navigationItem.title=@"我的";
    self.navigationController.navigationBarHidden=YES;
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width,200)];
    [bgView setImage:[UIImage imageNamed:@"person_bgImage"]];
    bgView.userInteractionEnabled=YES;
    [self.view addSubview:bgView];
    
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 170, WITCH, 30)];
    titleLab.textColor=[UIColor whiteColor];
    titleLab.text=@"           收藏                         分享                          积分 ";
    titleLab.font=[UIFont systemFontOfSize:15.0f];
    [bgView addSubview:titleLab ];
    
    
    UIImageView* line1=[[UIImageView alloc]initWithFrame:CGRectMake(120, 175, 1, 20)];
    line1.backgroundColor= kBackgroundColor;
    
    [bgView addSubview:line1];
    UIImageView* line2=[[UIImageView alloc]initWithFrame:CGRectMake(240, 175, 1, 20)];
    line2.backgroundColor= kBackgroundColor;
    
    [bgView addSubview:line2];
    

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
//    [topBackView addSubview:rightBtn];
    [self.view addSubview:topBackView];
  
    UILabel *loginlab=[[UILabel alloc]initWithFrame:CGRectMake(40, 0, 50, 30)];
    loginlab.font=[UIFont fontWithName:@"Helvetica" size:13.0];
    loginlab.textAlignment=NSTextAlignmentCenter;
    loginlab.text=@"Toby";
    loginlab.textColor=[UIColor orangeColor];
//    [bgView addSubview:loginlab];
    
    loginStateLab=[[UILabel alloc]initWithFrame:CGRectMake(80, 100-40, 150, 40)];
    loginStateLab.font=[UIFont fontWithName:@"Helvetica" size:15.0];
    loginStateLab.textAlignment=NSTextAlignmentLeft;
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        loginStateLab.text=@"昵称：Toby";
    }else{
//        loginStateLab.text=@"未登录";
    }

    loginStateLab.textColor=[UIColor orangeColor];
    
    UIImage*img=[UIImage imageNamed:@"chatui_head_bg"];
    UIImageView *peopleView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 70, 60,60)];
    [peopleView setImage:img];
    [bgView addSubview:loginStateLab];
    [bgView addSubview:peopleView];
    
    loginBnt=[[UIButton alloc]initWithFrame:CGRectMake(80, 70+15, 60, 60)];
    [loginBnt setTitle:@"登录" forState:UIControlStateNormal];
    [loginBnt setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [loginBnt addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchDown];
    [bgView addSubview:loginBnt];
    
    UITextView *textView=[[UITextView alloc]initWithFrame:CGRectMake(0,bgView.frame.size.height , WITCH, HEIGHT-bgView.frame.size.height)];
    textView.text=@"公司介绍：大唐宝通有限公司成立于二零一七年四月。是经北京工商行政管理局核准注册的综合性艺术品交易平台，公司注册资金1亿人民币。北京作为首都，又是中国政治经济文化中心，文化古城，最早开放的商业城市，艺术品收藏与交易非常活跃，吸引着全球收藏者的目光。大唐宝通有限公司汇聚多年在艺术品收藏市场运作的艺术品经纪人，在这片投资热土上因市而兴、因势而变，可谓天时地利人和，以大量资金人才投入强势打造中国艺术收藏品企业，为收藏爱好者提供一个集鉴定、展览、评估与销售的顶级艺术品交易平台。";
    textView.font=[UIFont systemFontOfSize:16.0];
    textView.textColor=[UIColor orangeColor];
//    [self.view addSubview:textView];
    
    
    logOutBnt = [[UIButton alloc] initWithFrame: CGRectMake((WITCH-300)/2, 400+150, 300, 40)];
    logOutBnt.backgroundColor = [UIColor grayColor];
    logOutBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [logOutBnt setTitle:@"退出登录" forState:UIControlStateNormal];
    logOutBnt.titleLabel.textColor=[UIColor whiteColor];
    [logOutBnt addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchDown];
//    [self.view addSubview:logOutBnt];
    
    
    array=[NSArray arrayWithObjects:@"个人资料",@" 实名认证",@"客服与帮助",@"设置",nil];
    
    mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 200, kBoundsSize.width, kBoundsSize.height-49)];
    mainTableView.backgroundColor=[UIColor clearColor];
    mainTableView.dataSource=self;
    mainTableView.delegate=self;
    [self setExtraCellLineHidden:mainTableView];
    [self.view addSubview:mainTableView];
}

-(void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
}
-(void)loginAction{
    UserLoginViewController* login=[[UserLoginViewController alloc]init];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
    [self presentViewController:nav animated:YES completion:nil];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        loginStateLab.text=@"昵称：Toby";
        loginBnt.hidden=YES;
//        logOutBnt.hidden=NO;
    }else{
        loginStateLab.text=@" ";
        loginBnt.hidden=NO;
//        logOutBnt.hidden=YES;
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
//    if(indexPath.row==3){
//        if(!cacheLab)
//            cacheLab=[[UILabel alloc]initWithFrame:CGRectMake(WITCH-150, 5, 120, 30)];
//        cacheLab.text=[NSString stringWithFormat:@"%.2fKB", [self readCacheSize] *1024];;
//        cacheLab.textAlignment=NSTextAlignmentRight;
//        cacheLab.font=[UIFont fontWithName:@"Helvetica" size:12.0];
//        cacheLab.textColor=[UIColor grayColor];
//        [cell addSubview:cacheLab];
//    }
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        
        DTGTPersonalViewController *psVC=[[DTGTPersonalViewController alloc]init];
        psVC.hidesBottomBarWhenPushed=YES;
        [ self.navigationController pushViewController:psVC animated:YES];
        
     
        
    }else  if(indexPath.row==1){
        
        DTGTIdentityViewController *idVC=[[DTGTIdentityViewController alloc]init];
        idVC.hidesBottomBarWhenPushed=YES;
        [ self.navigationController pushViewController:idVC animated:YES];
      
    }else  if(indexPath.row==2){
     
          NSLog(@"客服咨询");
    }else  if(indexPath.row==3){
        
//        [self clearFile];
        GJLSeetingViewController *stVC=[[GJLSeetingViewController alloc]init];
        stVC.hidesBottomBarWhenPushed=YES;
        [ self.navigationController pushViewController:stVC animated:YES];
        
    }else  if(indexPath.row==4){
        NSLog(@"rightButtonOnClick");
     
        
    }
    
    //    GJLChatViewController *ctVC=[[GJLChatViewController alloc]init];
    //    [self.navigationController pushViewController:ctVC animated:YES];
    
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
    [self.navigationController popViewControllerAnimated:NO];
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

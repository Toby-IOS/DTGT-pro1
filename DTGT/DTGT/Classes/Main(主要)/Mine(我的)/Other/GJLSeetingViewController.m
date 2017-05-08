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
//#import "<#header#>"

@interface GJLSeetingViewController ()

@end

@implementation GJLSeetingViewController

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
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
    
    
    logOutBnt = [[UIButton alloc] initWithFrame: CGRectMake((WITCH-300)/2, 400, 300, 40)];
    logOutBnt.backgroundColor = [UIColor grayColor];
    logOutBnt.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:15.0];
    [logOutBnt setTitle:@"退出登录" forState:UIControlStateNormal];
    logOutBnt.titleLabel.textColor=[UIColor whiteColor];
    [logOutBnt addTarget:self action:@selector(logOut) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:logOutBnt];

    
    array=[NSArray arrayWithObjects:@"客服咨询",@"清空缓存",@"关于我们", nil];
    
    mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 64+50, kBoundsSize.width, kBoundsSize.height-64-49-400)];
    mainTableView.dataSource=self;
    mainTableView.delegate=self;

    
    [self.view addSubview:mainTableView];

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
    
    return 40;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:14.0];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellAccessoryNone;
    if(indexPath.row==1){
     if(!cacheLab)
        cacheLab=[[UILabel alloc]initWithFrame:CGRectMake(WITCH-150, 5, 120, 30)];
        cacheLab.text=[NSString stringWithFormat:@"%.2fKB", [self readCacheSize] *1024];;
        cacheLab.textAlignment=NSTextAlignmentRight;
        cacheLab.font=[UIFont fontWithName:@"Helvetica" size:12.0];
        cacheLab.textColor=[UIColor grayColor];
        [cell addSubview:cacheLab];
    }
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==1){
        [self clearFile];
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

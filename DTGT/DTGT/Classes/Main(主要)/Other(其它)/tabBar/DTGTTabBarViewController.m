//
//  DTGTTabBarViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTTabBarViewController.h"
#import "DTGTTabBar.h"
#import "macros.pch"
#import "DTGTHomePageViewController.h"
#import "DTGTInformationViewController.h"
#import "DTGTCommunicationViewController.h"
#import "DTGTCompanyViewController.h"
#import "DTGTMineViewController.h"
#import "UserLoginViewController.h"
#import "MaskView.h"

@interface DTGTTabBarViewController ()<TabBarDelegate>
{
    
    UIButton *btn;
    NSTimer *mayTimer;
    NSArray *imgArray;
    
}
@property (nonatomic ,strong)MaskView *maskView;
//tabBar items 数组模型
@property(nonatomic,strong)NSMutableArray *items;
@end

@implementation DTGTTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    imgArray=[NSArray arrayWithObjects:@"fabu1.png",@"fabu2.png",@"fabu3.png",@"fabu4.png", nil];
    //添加子控制器
    [self setupAllChildViewController];
    
    //添加TabBar
    [self setupTabBar];
    
}

//懒加载
-(NSMutableArray*)items{
    
    if(!_items){
        _items=[NSMutableArray array];
        
    }
    return _items;
}
-(void)setupTabBar{
    
    //    [self.tabBar removeFromSuperview];
    
    DTGTTabBar *tabBar=[[DTGTTabBar alloc ]init];
    
    tabBar.items=self.items;
    
    [self.tabBar addSubview:tabBar];
    tabBar.delegate=self;
    tabBar.frame=self.tabBar.bounds;
}
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
    
    for(UIView *view in self.tabBar.subviews){
        
        NSLog(@"self.tabBar.subviews==%@",self.tabBar.subviews);
        if(![view isKindOfClass:[DTGTTabBar class]]){
            [view removeFromSuperview];
        }
    }
}


#pragma UITabBarDelegate

-(void)tabBar:(DTGTTabBar*) tabBar index:(NSUInteger)index{
 
         self.selectedIndex=index;
        
 


    
    if(index==4){
        NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
        
        if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"0"]){
            UserLoginViewController *lognVC=[[UserLoginViewController alloc]init];
            UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:lognVC];
            [ self presentViewController:nav animated: YES completion:nil];
            
        }else{
            //设置控制器调转页面
            return;
            
        }
    }
}
-(void)btnClick:(id)sender{
    int i=[sender tag];
    NSLog(@"ta======%i",i);
    if(i!=2){
//        GJLfabuViewController*fabuVC=[[GJLfabuViewController alloc]init];
//        [self presentViewController:fabuVC animated:YES completion:nil
//         ];
    }
    //取消蒙层
    [_maskView block:^{
        NSLog(@"取消之后");
    }];
}

//添加所有子控制器
-(void)setupAllChildViewController{
    
    DTGTHomePageViewController *homePageVC=[[DTGTHomePageViewController alloc]init];
    //    homePageVC.view.backgroundColor=[UIColor redColor];
        homePageVC.navigationItem.title=@"首页";
    
    [self addOneChildViewController:homePageVC image:[UIImage imageNamed:@"tab_home_select_nor"] selImage:[UIImage imageNamed:@"tab_home_selected_nor"]  selTitle:@"首页"];
    
    DTGTInformationViewController *ifVC=[[DTGTInformationViewController alloc]init];
        ifVC.navigationItem.title=@"资讯";
    
    [self addOneChildViewController:ifVC image:[UIImage imageNamed:@"tab_discovery_select_nor"] selImage:[UIImage imageNamed:@"tab_discovery_selected_nor"] selTitle:@"资讯"];
    
    DTGTCommunicationViewController *cuVC=[[DTGTCommunicationViewController alloc]init];
        cuVC.navigationItem.title=@"交易互动";
    [self addOneChildViewController:cuVC image:[UIImage imageNamed:@"tab_community_select_nor"] selImage:[UIImage imageNamed:@"tab_community_selected_nor"]  selTitle:@"交易"];
    
    DTGTCompanyViewController  *cyVC=[[DTGTCompanyViewController alloc]init];
        cyVC.navigationItem.title=@"公司介绍";
//    [self addOneChildViewController:cyVC image:[UIImage imageNamed:@"tab_status_select_nor"] selImage:[UIImage imageNamed:@"tab_status_selected_nor"] selTitle:@"公司"];
    
    
    DTGTMineViewController  *mineVC=[[DTGTMineViewController alloc]init];
        mineVC.navigationItem.title=@"我的";
    [self addOneChildViewController:mineVC image:[UIImage imageNamed:@"tab_user_select_nor"] selImage:[UIImage imageNamed:@"tab_user_selected_nor"] selTitle:@"我的"];
    
}


//添加子控制器
-(void)addOneChildViewController:(UIViewController *)vc image:(UIImage*)img selImage:(UIImage*)selImage selTitle:(NSString *) title{
    
    //创建导航控制器
    UINavigationController *naVC=[[UINavigationController alloc]initWithRootViewController:vc];
    
    [self addChildViewController:naVC];
    
    vc.tabBarItem.image=img;
    vc.tabBarItem.title=title;
    vc.tabBarItem.selectedImage=selImage;
    [self.items addObject:vc.tabBarItem];
    NSLog(@"%@",_items);
    
    
}


@end

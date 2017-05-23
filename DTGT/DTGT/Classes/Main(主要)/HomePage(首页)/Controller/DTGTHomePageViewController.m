//
//  DTGTHomePageViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTHomePageViewController.h"
#import "macros.pch"
#import "DTGTHomeTableViewCell.h"
#import "MJRefresh.h"
#import "DTGTDetailsViewController.h"
#import "DTGTlistViewController.h"
@interface DTGTHomePageViewController ()

@end

@implementation DTGTHomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    [self initVIew];
    [self createRsFresh];
}

-(void)loadData{
 bannerImgArray = [[NSArray alloc]initWithObjects:@"bannertest1.png",@"bannertest2.jpg",@"bannertest3.jpg",@"bannertest4.jpg", nil];
    
  categoryImgArray=[[NSArray alloc] initWithObjects:@"icon_01.png",@"icon_02.png",@"icon_03.png",@"icon_04.png",@"icon_05.png",@"icon_06.png",@"icon_07.png",@"icon_08.png",@"icon_09.png",@"icon_10.png", nil];
  categoryTitleArray=[[NSArray alloc] initWithObjects:@"古玩",@"玉翠",@"字画书法",@"珠宝",@"石头",@"珠宝",@"茶器",@"文玩",@"首饰",@"更多", nil];
    
    productTitleArray=[[NSArray alloc] initWithObjects:@"古玩收藏",@"玉翠珠宝",@"字画篆刻",@"文玩杂货",@"古玩收藏",@"玉翠珠宝",@"字画篆刻",@"文玩杂货",@"字画篆刻",@"文玩杂货", nil];
    productImgArray=[[NSArray alloc]initWithObjects:@"mainimg7.png",@"mainimg2.png",@"mainimg3.png",@"mainimg4.png",@"mainimg5.png",@"mainimg6.png",@"mainimg7.png",@"mainimg8.png",@"mainimg9.png",@"mainimg10.png",nil];
    
    productPriceArray=[[NSArray alloc]initWithObjects:@"2930元",@"900元",@"2900元",@"80元",@"2911元",@"240元",@"200元",@"200元",@"2910元",@"3400元",nil];

}
-(void)initVIew{

    //headerView
    UIView * headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WITCH, 150+160)];
    headerView.backgroundColor=ZPJColor(245,245,245);
    
    //轮播图
    FFScrollView *scroll = [[FFScrollView alloc]initPageViewWithFrame:CGRectMake(0, 0, kBoundsSize.width, 150) views:bannerImgArray];
    scroll.pageViewDelegate=self;
    [headerView addSubview:scroll];
    
    
    //横排f分类按钮
    UIView *categoryView=[[UIView alloc]initWithFrame:CGRectMake(0, 150, kBoundsSize.width, 150+10)];
//    categoryView.backgroundColor=[UIColor grayColor];
    [headerView addSubview:categoryView];
    
    UILabel *flLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, WITCH, 30)];
    flLab.textAlignment=NSTextAlignmentCenter;
    flLab.font=[UIFont fontWithName:@"Helvetica" size:15.0];
    flLab.text=@"------藏品分类-------";
    flLab.backgroundColor=[UIColor whiteColor];

    [categoryView addSubview:flLab];
    
    for(int i=0;i<5;i++){
        
        UIButton *bnt=[[UIButton alloc]initWithFrame:CGRectMake(i*(kBoundsSize.width/5), 0+31, kBoundsSize.width/5, 60)];
        [bnt setImage:[UIImage imageNamed:[categoryImgArray objectAtIndex:i]] forState:UIControlStateNormal];
        [bnt setBackgroundColor:[UIColor whiteColor]];
        bnt.adjustsImageWhenHighlighted=YES;
        bnt.imageEdgeInsets = UIEdgeInsetsMake(5,20,20,20);
        
        UILabel *lab=[[UILabel alloc]initWithFrame:CGRectMake(i*(WITCH/5), 40+31, WITCH/5, 20) ];
        lab.text=[categoryTitleArray objectAtIndex:i];
        lab.textAlignment=NSTextAlignmentCenter;
        lab.font=[UIFont fontWithName:@"Helvetica" size:11.0];
        lab.textColor=[UIColor grayColor];
        [lab setBackgroundColor:[UIColor whiteColor]];
        [bnt addTarget:self action:@selector(buttonOnClick) forControlEvents:UIControlEventTouchDown];
        UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(i*(WITCH/5)-1, 0+31+2+2, 0.5, 50) ];
        line.backgroundColor=kBackgroundColor;
        [categoryView addSubview:line];
        [categoryView addSubview:bnt];
        [categoryView addSubview:lab];
    }
    
   
    
    
    UIButton *headlineBnt=[[UIButton alloc]initWithFrame:CGRectMake(0, 40+31+20+1, WITCH, 36)];
    headlineBnt.backgroundColor=[UIColor whiteColor];
    [headlineBnt addTarget:self action:@selector(headLineClick) forControlEvents:UIControlEventTouchDown];
    [categoryView addSubview:headlineBnt];
    
    hedlineLab=[[UILabel alloc]initWithFrame:CGRectMake(WITCH/5,  40+31+20+1,WITCH-WITCH/5+200 , 36)];
    hedlineLab.text=@"山西寺观壁画资料捐赠暨展览开幕式在国家图书馆举行";
    hedlineLab.backgroundColor=[UIColor clearColor];
    hedlineLab.font=[UIFont fontWithName:@"Helvetica" size:13.0];
    hedlineLab.textColor=[UIColor orangeColor];
    [categoryView addSubview:hedlineLab];
   
  
    
    
    
    
    UILabel *jylab=[[UILabel alloc]initWithFrame:CGRectMake(0, 40+31+20+1, WITCH/5, 36)];
    jylab.text=@"交易头条";
    jylab.textAlignment=NSTextAlignmentCenter;
    jylab.font=[UIFont fontWithName:@"Helvetica" size:15.0];
    jylab.backgroundColor=[UIColor whiteColor];
    [categoryView addSubview:jylab];
    
    UIImageView *imgView=[[UIImageView alloc ]initWithFrame:CGRectMake( WITCH/5, 40+31+20+1+8, 15, 20)];
    imgView.image=[UIImage imageNamed:@"ico_yingliang"];
    imgView.backgroundColor=[UIColor whiteColor];
    [categoryView addSubview:imgView];

//
  
    
    
    
    UILabel *jpLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 120+1+8, WITCH, 30) ];
    jpLab.textAlignment=NSTextAlignmentCenter;
    jpLab.font=[UIFont fontWithName:@"Helvetica" size:15.0];
    jpLab.text=@"-------艺术精品-------";
    [jpLab setBackgroundColor:[UIColor whiteColor]];
    [categoryView addSubview:jpLab];
    

 
    homeTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WITCH,HEIGHT-64-49+70) style:UITableViewStylePlain];
    homeTableView.delegate=self;
    homeTableView.dataSource=self;
    homeTableView.tableHeaderView=headerView;
  
    
    [self.view addSubview:homeTableView];
    
    
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    CGRect frame=hedlineLab.frame;
    frame.origin.x=350;
    hedlineLab.frame=frame;
    [UIView beginAnimations:@"testAnimation" context:NULL];
    [UIView setAnimationDuration:20.0f];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationRepeatAutoreverses:NO];
    [UIView setAnimationRepeatCount:999999];
    frame = hedlineLab.frame;
    frame.origin.x =-(350-WITCH/5);
    hedlineLab.frame = frame;
    [UIView commitAnimations];
    

}
-(void)headLineClick{

    NSLog(@"headLineClick");

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *myCell=@"cell_identifier";
    DTGTHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCell];
    
//    if(cell==nil){
    
        cell=[[DTGTHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell ];
        
        cell.backgroundColor = [UIColor colorWithRed:245.0/255.0f green:245.0/255.0f blue:245.0/255.0f alpha:1.00f];
        cell.backgroundColor=[UIColor whiteColor];
        //        cell.textLabel.font = [UIFont systemFontOfSize:13];
        //        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.titleLabel.text = productTitleArray[indexPath.row];
        cell.priceLabel.text = productPriceArray[indexPath.row];
        cell.imgView.image=[UIImage imageNamed:[productImgArray objectAtIndex:indexPath.row]];
        
//    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DTGTDetailsViewController *dtVC=[[DTGTDetailsViewController alloc]init];
    dtVC.hidesBottomBarWhenPushed=YES;
    [ self.navigationController pushViewController:dtVC animated:YES];
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 200;
}
-(void)buttonOnClick{
    
    NSLog(@"buttonOnClick");
    
     DTGTlistViewController*listVC=[[DTGTlistViewController alloc]init];
    listVC.hidesBottomBarWhenPushed=YES;
    [ self.navigationController pushViewController:listVC animated:YES];
    
}


-(void)createRsFresh{

    homeTableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //        [_tableview reloadData];
        [homeTableView.mj_header endRefreshing];
        
    }];
    [homeTableView.mj_header beginRefreshing];
    homeTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //        [_tableview reloadData];
        [homeTableView.mj_footer endRefreshing];
    }];

}
@end

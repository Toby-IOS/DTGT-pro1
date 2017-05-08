//
//  DTGTInformationViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTInformationViewController.h"
#import "DTGTInformationTableViewCell.h"
#import "macros.pch"
#import "DTGContentViewController.h"
#import "MJRefresh.h"
#import "LXSegmentScrollView.h"
#import "LiuXSegmentView.h"

@interface DTGTInformationViewController ()<UITableViewDelegate,UITableViewDataSource,LXSegmentScrollViewDelegate>
{
 
    NSArray *titleArray;
    NSArray *contentArray;
    NSArray *imgArray;

}
@property(nonatomic,strong)UITableView *tableView1;
@property(nonatomic,strong)UITableView *tableView2;
@property(nonatomic,strong)UITableView *tableView3;
@end

@implementation DTGTInformationViewController

- (void)viewDidLoad {
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [super viewDidLoad];
    [self loadData];
    [self initVIew];
  
}
-(void)loadData{
    imgArray=[[NSArray alloc]initWithObjects:@"mainimg1.png",@"mainimg2.png",@"mainimg3.png",@"mainimg4.png",@"mainimg5.png",@"mainimg6.png",@"mainimg7.png",@"mainimg8.png",@"mainimg9.png",@"mainimg10.png",nil];
    contentArray=[[NSArray alloc] initWithObjects:@"1元起拍 219次围观1元起拍 219次围观 1元起拍 219次围观 1元起拍 219次围观 1元起拍 219次围观1元起拍 219次围观1元起拍 219次围观1元起拍 219次围观",@"2元起拍 2139次围观",@"3元起拍 219次围观",@"4元起拍 2139次围观",@"11元起拍 2139次围观",@"2元起拍 21239次围观",@"23元起拍 2193次围观",@"4元起拍 21359次围观",@"121元起拍 3次围观",@"4元起拍 359次围观", nil];
    titleArray=[[NSArray alloc] initWithObjects:@"古玩收藏",@"玉翠珠宝",@"字画篆刻",@"文玩杂货",@"古玩收藏",@"玉翠珠宝",@"字画篆刻",@"文玩杂货",@"字画篆刻",@"文玩杂货", nil];
}
-(void)initVIew{

    
    //iOS7新增属性
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    NSMutableArray *array=[NSMutableArray array];
    
      _tableView1=[[UITableView alloc] init];
       _tableView1.mj_header   = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                            [_tableView1 reloadData];
                    [_tableView1.mj_header endRefreshing];
        //
                }];
    
    [_tableView1.mj_header beginRefreshing];
    
                                      
    _tableView1.delegate=self;
    _tableView1.dataSource=self;
    _tableView1.rowHeight= 90;
    [array addObject:_tableView1];
    
    _tableView2=[[UITableView alloc] init];
    
    _tableView2.delegate=self;
    _tableView2.dataSource=self;
    _tableView2.rowHeight=90;
    [array addObject:_tableView2];
    
    _tableView3=[[UITableView alloc] init];
    
    _tableView3.delegate=self;
    _tableView3.dataSource=self;
    _tableView3.rowHeight=90;
    [array addObject:_tableView3];
    
    LXSegmentScrollView *scView=[[LXSegmentScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-49) titleArray:@[@"行业资讯",@"公司动态",@"交易信息"] contentViewArray:array];
    
    scView.dagelate=self;
    [self.view addSubview:scView];
    
}
- (void)viewWillAppear:(BOOL)animated{
 [super viewWillAppear: animated];


}

-(void)createRsFreshIndex:(NSInteger) index{

        NSLog(@"index===%i",(int)index);
    
    if(index==1){
        [_tableView1 reloadData];
//
//        
             _tableView1.mj_header   = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_tableView1 reloadData];
        [_tableView1.mj_header endRefreshing];
        //
    }];
    
    [_tableView1.mj_header beginRefreshing];
//
//
    }else if(index==2){
          [_tableView2 reloadData];

        _tableView2.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
           
            [_tableView2.mj_header endRefreshing];
            
        }];
        [_tableView2.mj_header beginRefreshing];
//        _tableView1.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//                    [_tableView2 reloadData];
//            [_tableView1.mj_footer endRefreshing];
     
//
    }else if(index==3){
//
 [_tableView3 reloadData];
        
        _tableView3.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            
            [_tableView3.mj_header endRefreshing];
            
        }];
        [_tableView3.mj_header beginRefreshing];
        //        _tableView1.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        //                    [_tableView2 reloadData];
        //            [_tableView1.mj_footer endRefreshing];
//    
    }


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [titleArray count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *myCell=@"cell_identifier";
    DTGTInformationTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:myCell];
    if(cell==nil){
    cell=[[DTGTInformationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell ];
//    cell.backgroundColor = [UIColor colorWithRed:245.0/255.0f green:245.0/255.0f blue:245.0/255.0f alpha:1.00f];
//        cell.backgroundColor=[UIColor greenColor];
    cell.textLabel.textColor = [UIColor colorWithRed:136.0/255.0f green:136.0/255.0f blue:136.0/255.0f alpha:1.00f];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.titleLab.text = titleArray[indexPath.row];
        NSLog(@"titleArray[indexPath.row]==%@",titleArray[indexPath.row]);
    cell.contentLab.text = contentArray[indexPath.row];
    cell.imgView.image=[UIImage imageNamed:[imgArray objectAtIndex:indexPath.row]];

    
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DTGContentViewController *dtVC=[[DTGContentViewController alloc]initWithTitle:[titleArray objectAtIndex:indexPath.row] withImgName:[imgArray objectAtIndex:indexPath.row]];
    dtVC.hidesBottomBarWhenPushed=YES;
    [ self.navigationController pushViewController:dtVC animated:YES];
    
}


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 90;
//}


@end

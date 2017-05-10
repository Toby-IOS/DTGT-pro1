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
#import "AFNetworkTool.h"
#import "Product.h"
#import "UIImageView+WebCache.h"

@interface DTGTInformationViewController ()<UITableViewDelegate,UITableViewDataSource,LXSegmentScrollViewDelegate>
{
 
    NSArray *titleArray;
    NSArray *contentArray;
    NSArray *imgArray;
    NSMutableArray *dataSource;

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
    
    NSString *url=@"https://api.kanke365.com/api/gw----ds/get_recent_posts/?page=1&dev=1";
    [AFNetworkTool JSONDataWithUrl:url success:^(id json) {
        NSDictionary *result=json;
//        NSLog(@"result===%@",result);
        [self fillWithJsonString:result];
    } fail:^{
        NSLog(@"请求失败");
    }];
    
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

-(void)fillWithJsonString:(NSDictionary *)dicData{
    dataSource=[NSMutableArray array];
    NSArray *array=[dicData objectForKey:@"posts"];
    NSLog(@"array==%@",array);
    for(NSDictionary *dict in  array){
      Product *product = [[Product alloc]init];
        product.productTitle=[dict objectForKey:@"title"];
        product.productImgUrl=[dict objectForKey:@"thumbnail"];
        product.productCreateTime=[dict objectForKey:@"date"];
        product.productContent=[dict objectForKey:@"excerpt"];
        [dataSource addObject:product];
    }
    [ _tableView1 reloadData];
   
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
    
    return [dataSource count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *myCell=@"cell_identifier";
    DTGTInformationTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:myCell];
    cell.selectionStyle=UITableViewCellAccessoryNone;
    if(cell==nil){
    cell=[[DTGTInformationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell ];
    
        Product *product=[dataSource objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleDefault;
    cell.titleLab.text = product.productTitle;
    cell.contentLab.text = product.productContent;
    NSURL *imgUrl=[NSURL URLWithString:product.productImgUrl];
    [cell.imgView sd_setImageWithURL:imgUrl];
    cell.timeLab.text=product.productCreateTime;
    
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DTGContentViewController *dtVC=[[DTGContentViewController alloc]initWithTitle:[dataSource objectAtIndex:indexPath.row]];
    dtVC.hidesBottomBarWhenPushed=YES;
    [ self.navigationController pushViewController:dtVC animated:YES];
    
}


//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    return 90;
//}


@end

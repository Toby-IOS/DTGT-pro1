//
//  DTGTlistViewController.m
//  DTGT
//
//  Created by small T on 17/4/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTlistViewController.h"
#import "macros.pch"
#import "DTGTlistCollectionViewCell.h"
#import "AFNetworkTool.h"
#import "Product.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "DTGTDetailsViewController.h"

@interface DTGTlistViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
NSMutableArray *_dataSource;

}
@property(nonatomic,strong)UICollectionView *collectionView;
@end

@implementation DTGTlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title=@"藏品列表";
    [self.view setBackgroundColor:kBackgroundColor];
    
  
    [self loadData];
    [self.view addSubview:self.collectionView];
    
    [self createReFresh];
    
    
}


-(void)loadData{

NSString *url=@"http://api.liwushuo.com/v2/item_subcategories/7/items?limit=40&offset=0";

    [AFNetworkTool JSONDataWithUrl:url success:^(id json) {
        NSDictionary *result = json;
        // 解析数据
       [self fillWithJsonString:result];
      
       
    } fail:^{
     
        NSLog(@"请求失败");
    }];



}

/** 解析数据*/
- (void)fillWithJsonString:(NSDictionary*)dicData {
    _dataSource = [[NSMutableArray alloc] init];
    NSDictionary *resultDict = [dicData objectForKey:@"data"];
    NSArray *array = [resultDict objectForKey:@"items"];
    for (NSDictionary *dict in array) {
        Product *product = [[Product alloc]init];
        product.productId = [dict objectForKey:@"id"];
        product.productTitle = [dict objectForKey:@"description"];
        product.productPrice = [dict objectForKey:@"price"];
      
            product.productImgUrl = [[dict objectForKey:@"image_urls"] firstObject];
      
        product.productImgUrls = [dict objectForKey:@"image_urls"];
        [_dataSource addObject:product];
    }
    [_collectionView reloadData];
//    [_collectionView.header endRefreshing];

}

- (void)createReFresh {
    
    
     _collectionView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [ _collectionView reloadData];
        [ _collectionView.mj_header endRefreshing];
        
    }];
    [ _collectionView.mj_header beginRefreshing];
     _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                [ _collectionView reloadData];
        [ _collectionView.mj_footer endRefreshing];
    }];
     [ _collectionView.mj_header beginRefreshing];
    
    
    // 下拉刷新
   // MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 请求网络数据
//        [self loadData];
//    }];
//    // 设置文字
//    [header setTitle:@"松开立即刷新" forState:MJRefreshStatePulling];
//    [header setTitle:@"正在刷新" forState:MJRefreshStateRefreshing];
//    // 设置字体
//    header.stateLabel.font = [UIFont systemFontOfSize:14];
//    // 设置颜色
//    header.stateLabel.textColor = [UIColor grayColor];
//    // 隐藏时间
//    header.lastUpdatedTimeLabel.hidden = YES;
//    _collectionView.mj_header = header;
    
    
//    //        // 上拉加载
//            MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
//            _collectionView.mj_footer = footer;
//            // 设置文字
//            [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
//            [footer setTitle:@"正在加载..." forState:MJRefreshStateRefreshing];
//            [footer setTitle:@"没有更多" forState:MJRefreshStateNoMoreData];
//            // 设置字体
//            footer.stateLabel.font = [UIFont systemFontOfSize:14];
//            // 设置颜色
//            footer.stateLabel.textColor = [UIColor grayColor];
    
}

-(UICollectionView*)collectionView{
    if(!_collectionView){
        UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc] init];
        [flowlayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        flowlayout.minimumLineSpacing=10;
        flowlayout.minimumInteritemSpacing=10;
        flowlayout.itemSize=CGSizeMake((WITCH-30)/2, (WITCH-30)/2+70);
        flowlayout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0,WITCH , HEIGHT) collectionViewLayout:flowlayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        [_collectionView setBackgroundColor:kBackgroundColor];
        
        _collectionView.showsVerticalScrollIndicator=NO;
        [_collectionView registerClass:[DTGTlistCollectionViewCell class] forCellWithReuseIdentifier:kCellIdentifier_CollectionViewCell];
        
        
        
    }
    return _collectionView;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    DTGTlistCollectionViewCell *customCell = (DTGTlistCollectionViewCell *)cell;
    [UIView animateWithDuration:1.0f animations:^{
        customCell.imageView.alpha = 1.0f;
    }];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return [_dataSource count];

}
-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    DTGTlistCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier_CollectionViewCell forIndexPath:indexPath];
    Product *product=[_dataSource objectAtIndex:indexPath.item];
    cell.titleLabel.text=product.productTitle;
    NSURL *imgUrl=[NSURL URLWithString:product.productImgUrl];
    [cell.imageView sd_setImageWithURL:imgUrl];
    cell.priceLabel.text=product.productPrice;
    return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"%ld个item",indexPath.item);
    
    DTGTDetailsViewController *dtVC=[[DTGTDetailsViewController alloc]init];
    [self.navigationController pushViewController:dtVC animated:YES];

}



@end

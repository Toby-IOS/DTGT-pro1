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
    array = @[
              @"http://file6.gucn.com/file2/GetMyImageFiles/15/15489a51be2519888312cbc014078d13GucnP_U271880T049943361494847503632.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/1d/1d2e669344c9993218ed7126e48a59ddGucnP_U271880T669150581494846170832.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/9b/9bab3b38ae9b13d8cf275e074afc4ec7GucnP_U271880T047251871494845813048.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/ca/ca21cfef4e15a3f2da44a8a7de49c08eGucnP_U271880T127460991493800395516.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/c8/c8834ce19bd30626f66fb091ff45c8a0GucnP_U315672T242027781493046192912.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/82/8296f84c6fdb9cd91c2f4224b0bb4214GucnP_U315672T318227131493028977608.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/0f/0faab572db61c070515663c7e5824aa7GucnP_U315672T372345281493029528132.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/12/1218583a998af9617b4660cc5a20eb78GucnP_U315672T190120501493030403456.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/d5/d5f07ca679360465467a129c51ecb64cGucn_20170515715041230932Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/c9/c95936cb2b2f64a0700d17debe6b8dfbGucn_20170515731331221240Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/05/05603f035073d92b15613d95a725af83GucnP_U756451T588145011494856181760.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/66/6637d3f2b10300a887b3310b126fd9ceGucnP_U748127T236589871494856001112.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/46/464632482ff0467704eb85c418cccdaaGucnP_U756023T602014421494852414904.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/8f/8f0bfb371395f618ec94218f58e4ea89GucnP_U756023T723447251494851692752.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/88/88c7afe6f9b96d276014a222f34bf853Gucn_20170515458501181911Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/3e/3eb6ed16b9a9e1e12f83a6487f79195aGucn_20170515638860175908Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/8d/8d33a57f4bf008a374b053fbea5f22e2GucnP_U756T669480151493890910356.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/84/840e3db3386b4c263f97dcf55fce94a9GucnP_U756T035497211493891027100.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/5a/5a34000155561f4b0d4a01e11191b31fGucnP_U756T105366061493891216508.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/f1/f1a9d9463a8dc773bebf22c86f6c13fbGucnP_U756T866466931493891701180.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/76/76d656499a770d8266068ccf99bc791bGucnP_U756T232415321493897694520.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/2d/2d9bda76dd2f59bb1294e04e3b748a75GucnP_U756T717309011493897968600.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/d0/d0a5604763d19d132db564ba92e7058cGucnP_U756T896073311493897769208.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/15/15489a51be2519888312cbc014078d13GucnP_U271880T049943361494847503632.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/1d/1d2e669344c9993218ed7126e48a59ddGucnP_U271880T669150581494846170832.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/9b/9bab3b38ae9b13d8cf275e074afc4ec7GucnP_U271880T047251871494845813048.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/ca/ca21cfef4e15a3f2da44a8a7de49c08eGucnP_U271880T127460991493800395516.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/c8/c8834ce19bd30626f66fb091ff45c8a0GucnP_U315672T242027781493046192912.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/82/8296f84c6fdb9cd91c2f4224b0bb4214GucnP_U315672T318227131493028977608.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/0f/0faab572db61c070515663c7e5824aa7GucnP_U315672T372345281493029528132.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/12/1218583a998af9617b4660cc5a20eb78GucnP_U315672T190120501493030403456.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/d5/d5f07ca679360465467a129c51ecb64cGucn_20170515715041230932Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/c9/c95936cb2b2f64a0700d17debe6b8dfbGucn_20170515731331221240Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/05/05603f035073d92b15613d95a725af83GucnP_U756451T588145011494856181760.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/66/6637d3f2b10300a887b3310b126fd9ceGucnP_U748127T236589871494856001112.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/46/464632482ff0467704eb85c418cccdaaGucnP_U756023T602014421494852414904.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/8f/8f0bfb371395f618ec94218f58e4ea89GucnP_U756023T723447251494851692752.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/88/88c7afe6f9b96d276014a222f34bf853Gucn_20170515458501181911Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/3e/3eb6ed16b9a9e1e12f83a6487f79195aGucn_20170515638860175908Pic1.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/8d/8d33a57f4bf008a374b053fbea5f22e2GucnP_U756T669480151493890910356.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/84/840e3db3386b4c263f97dcf55fce94a9GucnP_U756T035497211493891027100.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/5a/5a34000155561f4b0d4a01e11191b31fGucnP_U756T105366061493891216508.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/f1/f1a9d9463a8dc773bebf22c86f6c13fbGucnP_U756T866466931493891701180.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/76/76d656499a770d8266068ccf99bc791bGucnP_U756T232415321493897694520.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/2d/2d9bda76dd2f59bb1294e04e3b748a75GucnP_U756T717309011493897968600.jpg_300x300.jpg",
              @"http://file6.gucn.com/file2/GetMyImageFiles/d0/d0a5604763d19d132db564ba92e7058cGucnP_U756T896073311493897769208.jpg_300x300.jpg"];
    
  
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
//    NSURL *imgUrl=[NSURL URLWithString:product.productImgUrl];
       NSURL *imgUrl=[NSURL URLWithString:[array objectAtIndex:indexPath.row]];
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

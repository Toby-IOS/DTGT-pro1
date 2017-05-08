//
//  DTGTDetailsViewController.m
//  DTGT
//
//  Created by small T on 17/4/6.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTDetailsViewController.h"
#import "macros.pch"
#import "UIImageView+WebCache.h"
#import "UIView+Extension.h"
#import "DTGTSubmitViewController.h"
#import "UserLoginViewController.h"
#import "UILabel+ContentSize.h"
@interface DTGTDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    NSArray *imageArray;
//    NSMutableArray*imgageVIewsMArray;
    NSArray * propertyArray;
    

}
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIScrollView *scrollow;//图片轮播图
@property(nonatomic,assign)NSInteger index;
@property(nonatomic,strong)NSMutableArray *imgageViewsMArray;
@property(nonatomic,strong)UILabel *labelPageIndex;
@property(nonatomic,strong)UILabel *labelPageNumber;
@end

@implementation DTGTDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"商品详情";
    
    imageArray = @[@"http://www.mamashai.com/upload/calendaradv/409/logo/hd.jpg", @"http://www.mamashai.com/upload/calendaradv/413/logo/bp_dda2.jpg", @"http://www.mamashai.com/upload/calendaradv/411/logo/bp_dda.jpg"];
    propertyArray=@[@"三彩瓷枕",@"藏品序号：LSGZ15032704",@"藏品规格：口径8.4cm 高24.5cm",@"藏品价格：100万元",@"收录时间：2015.08.24", @"藏品介绍：此块田黄荔枝冻石，具备田黄和荔枝冻石的特征，整体通透，自然光下呈现荔枝冻特点，在手电及灯光照射下呈现出透明的黄色，上手后油度高而润，感觉油珠爱滴,据备六德。据了解，这类存世量不足1.5吨，自古以来都是文人墨客所追捧的对象，是较为难得的收藏珍品，有较高的收藏价值,自古以来都是文人墨客所追捧的对象，是较为难得的收藏珍品，有较高的收藏价自古以来都是文人墨客所追捧的对象，是较为难得的收藏珍品，有较高的收藏价自古以来都是文人墨客所追捧的对象，是较为难得的收藏珍品，有较高的收藏价自古以来都是文人墨客所追捧的对象，是较为难得的收藏珍品，有较高的收藏价自古以来都是文人墨客所追捧的对象，是较为难得的收藏珍品，有较高的收藏价,这类存世量不足1.5吨"];
  ;
    [self setupTableView];
    [self setuptabBarMenu];
}

-(NSMutableArray*)imgageViewsMArray{

    if(_imgageViewsMArray==nil){
    
        _imgageViewsMArray=[[NSMutableArray alloc]init];
    
    }
    return _imgageViewsMArray;

}

-(void)setupTableView{

    
    [self.view addSubview:self.tableView];
    [self headerView];
    

}
-(UIView*)headerView{

    UIView*headerView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WITCH, 200)];
    UIScrollView *scrollView=[self PictureScrollView];
    [headerView addSubview:scrollView];
    UIImageView *bgimgView=[[UIImageView alloc] initWithFrame:CGRectMake(WITCH-60, 200-60, 60, 60)];
    bgimgView.image=[UIImage imageNamed:@"Goods_Shuffling_button"];
    
    UILabel *labelPageIndex=[[UILabel alloc] initWithFrame:CGRectMake(0, bgimgView.frame.size.height/2-15, 30, 30)];
//    labelPageIndex.backgroundColor=[UIColor yellowColor];
    labelPageIndex.text=[NSString stringWithFormat:@"1"];
    labelPageIndex.textAlignment=NSTextAlignmentRight;
    labelPageIndex.font=[UIFont systemFontOfSize:14];
    _labelPageIndex=labelPageIndex;
    [bgimgView addSubview:labelPageIndex];
    
    
    UILabel *labelPageNumber=[[UILabel alloc] initWithFrame:CGRectMake(bgimgView.frame.size.width-30, bgimgView.frame.size.height/2-15, 20, 30)];
//    labelPageNumber.backgroundColor=[UIColor redColor];
    labelPageNumber.font=[UIFont systemFontOfSize:14];
    labelPageNumber.text=[NSString stringWithFormat:@"/%ld",[imageArray count]];
    labelPageNumber.textAlignment=NSTextAlignmentLeft;
    _labelPageNumber=labelPageNumber;
    [bgimgView addSubview:labelPageNumber];
    
    
    
    [headerView addSubview:bgimgView];
    _tableView.tableHeaderView=headerView;
    return headerView;
}
-(UITableView*)tableView{
    if(!_tableView){
    
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, WITCH, HEIGHT-49) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

//        _tableView.backgroundColor=[UIColor yellowColor];
    
    }
    
    return _tableView;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==5){
        
        
       return [self labelHeight]+16.702f;
    }else {
    return 40;
    }
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [propertyArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPathP{

     NSString *identifier=@"productInfoCell";
    
    
    
    UITableViewCell * cell=[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    if(indexPathP.row==0){
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        cell.textLabel.font=[UIFont systemFontOfSize:15];
    }else {
       cell.textLabel.textAlignment=NSTextAlignmentLeft;
       cell.textLabel.textColor=[UIColor grayColor];
       cell.textLabel.font=[UIFont systemFontOfSize:14];
      
    }
    cell.textLabel.numberOfLines=0;
    cell.textLabel.text=[propertyArray objectAtIndex:indexPathP.row];
    
   
    return cell;
}



-(UIScrollView*)PictureScrollView{

    UIScrollView *scrollow=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WITCH, 200)];
    _scrollow=scrollow;
    scrollow.backgroundColor=[UIColor orangeColor];
    scrollow.delegate=self;
    scrollow.bounces=NO;
    scrollow.showsVerticalScrollIndicator=NO;
    scrollow.showsHorizontalScrollIndicator=NO;
    scrollow.pagingEnabled=YES;
    
    scrollow.contentSize=CGSizeMake((imageArray.count)*WITCH, 0);
    scrollow.contentOffset=CGPointMake(WITCH*_index, 0);
    
    UIImage *placeholder = [UIImage imageNamed:@"small_placeholder"];
    for(int i=0;i<[imageArray count];i++){
    
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.scrollow.frame.size.width, self.scrollow.frame.size.height)];
        imageView.x=WITCH*i;
        NSURL *imageUrl=[imageArray objectAtIndex:i];
        [imageView sd_setImageWithURL:imageUrl placeholderImage:placeholder];
        imageView.userInteractionEnabled=YES;
        [_scrollow addSubview:imageView];
        
        UITapGestureRecognizer *tapImage=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImage:)];
        tapImage.numberOfTapsRequired=1;
        tapImage.numberOfTouchesRequired=1;
      
        [self.imgageViewsMArray addObject:imageView];
          [imageView addGestureRecognizer:tapImage];
    }
  
      [self scrollViewDidScroll:scrollow];
    
    return _scrollow;
}
-(void)tapImage:(UITapGestureRecognizer*)tap{

    NSLog(@"点我了");

}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _index=(NSInteger)(self.scrollow.contentOffset.x/scrollView.frame.size.width);
//    CGFloat y = scrollView.contentOffset.y;
    _labelPageIndex.text=[NSString stringWithFormat:@"%ld",_index+1];
    
    UIImage *placeholder = [UIImage imageNamed:@"small_placeholder"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:placeholder];
    
    if (self.imgageViewsMArray.count != 0)
    {
        imageView = self.imgageViewsMArray[_index];
    }
}
-(void)setuptabBarMenu{
    
    UIButton *leftBnt=[[UIButton alloc]initWithFrame:CGRectMake(0, HEIGHT-49, WITCH/2, 49)];
    leftBnt.backgroundColor=[UIColor orangeColor];
    [leftBnt setTitle:@"帮助反馈" forState:UIControlStateNormal];
    leftBnt.titleLabel.font=[UIFont systemFontOfSize:14];
    [leftBnt addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftBnt];
    
    UIButton *right=[[UIButton alloc]initWithFrame:CGRectMake(WITCH/2+1, HEIGHT-49, WITCH/2-1, 49)];
    right.backgroundColor=[UIColor orangeColor];
    [right setTitle:@"联系客服" forState:UIControlStateNormal];
    right.titleLabel.font=[UIFont systemFontOfSize:14];
    [right addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:right];
}

-(void)leftClick{


    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if([[userDefault objectForKey:kIsStorePassword] isEqualToString:@"1"]){
        
        DTGTSubmitViewController *submitVC=[[DTGTSubmitViewController alloc]init];
        [self presentViewController:submitVC animated:YES completion:nil];
        
    }else{
        
        UserLoginViewController* login=[[UserLoginViewController alloc]init];
        UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:login];
        [self presentViewController:nav animated:YES completion:nil];
        
    }
}

-(void)rightClick{


}
-(float)labelHeight{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(200, 20, WITCH, 40)];
    label.font=[UIFont boldSystemFontOfSize:14.0f];
    label.numberOfLines=0;
    label.backgroundColor=[UIColor yellowColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.lineBreakMode=NSLineBreakByWordWrapping;
    NSString *str=[propertyArray objectAtIndex:5];
    label.text=str;
    [self.view addSubview:label];
    NSLog(@"dadaddd===%@",label.text);
    NSLog(@"[label contentSize].height==%f",[label contentSize].height);
    return [label contentSize].height;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

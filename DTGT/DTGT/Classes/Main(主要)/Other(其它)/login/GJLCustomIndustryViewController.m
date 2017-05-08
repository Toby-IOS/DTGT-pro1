//
//  GJLCustomIndustryViewController.m
//  Toby
//
//  Created by small T on 17/3/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "GJLCustomIndustryViewController.h"
#import "macros.pch"
#import "DTGTDetailsViewController.h"
@interface GJLCustomIndustryViewController ()

@end

@implementation GJLCustomIndustryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//  self.navigationController.navigationBarHidden=YES;
    self.navigationItem.title=@"分类";
    array=[NSMutableArray  arrayWithObjects:@" 陶瓷",@"古代钱币",@"老玉古珠",@"古代书画古籍",@"杂项",@"珠宝首饰",@"现代文玩",@"茶具香具",@"茶叶/酒",@"现代书画",@"邮币纸品",@"家具陈设",@"藏传",nil];
    tableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 44, WITCH, HEIGHT)];
    [tableView setBackgroundColor:[UIColor whiteColor]];
    tableView.dataSource=self;
    tableView.delegate=self;
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    
    
//    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
//    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
//    itemBgView.userInteractionEnabled=YES;
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
//    title.text = @"分类";
//    title.textAlignment = NSTextAlignmentCenter;
//    title.textColor =[UIColor whiteColor];
//    title.font = [UIFont fontWithName:@"Helvetica" size:18.0];
//    [itemBgView addSubview:title];
//    [self.view addSubview:itemBgView];
//    
//    UIButton *leftBarBnt = [[UIButton alloc] initWithFrame:CGRectMake(5, 20, 50, 44)];
//    leftBarBnt.backgroundColor=[UIColor clearColor];
//    [leftBarBnt setImage:[UIImage imageNamed:@"Industrychoose_return.png"] forState:UIControlStateNormal];
//    [leftBarBnt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [leftBarBnt addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [itemBgView addSubview:leftBarBnt];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [array count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    DTGTDetailsViewController *dtVC=[[DTGTDetailsViewController alloc]init];
    [self.navigationController pushViewController:dtVC animated:YES];

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 40;

};
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:14.0];
    return cell;
};

/**点击左键返回执行的方法*/
-(void)leftBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
@end

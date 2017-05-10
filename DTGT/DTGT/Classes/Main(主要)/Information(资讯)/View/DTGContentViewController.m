//
//  DTGContentTViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGContentViewController.h"
#import "macros.pch"
#import "UIImageView+WebCache.h"
@interface DTGContentViewController ()

@end

@implementation DTGContentViewController
-(instancetype)initWithTitle:(Product*)product{
    if(self==[super init]){
        titleStr=product.productTitle;
        contentStr=product.productContent;
        imgUrl=[NSURL URLWithString:product.productImgUrl];
        timeStr=product.productCreateTime;
    }
    return self;
};

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, WITCH, 40)];
    titleLab.text=titleStr;
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.font=[UIFont boldSystemFontOfSize:16];
    titleLab.textColor=[UIColor blackColor];
    [self.view addSubview:titleLab];
    
    UILabel *line=[[UILabel alloc]initWithFrame:CGRectMake(0, 70+40+1+10, WITCH, 1)];
    line.backgroundColor=ZPJColor(235,235,235);
    [self.view addSubview:line];
    
    UILabel *timeLab=[[UILabel alloc]initWithFrame:CGRectMake(WITCH-210, 70+30, 200, 20)];
    timeLab.textColor=[UIColor grayColor];
    timeLab.textAlignment=NSTextAlignmentRight;
    timeLab.text=timeStr;
    timeLab.font=[UIFont systemFontOfSize:12];
    [self.view addSubview:timeLab];
    
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 70+40+20, WITCH-20, 300)];
    [imgView sd_setImageWithURL:imgUrl];
    [self.view addSubview:imgView];
    
    textView=[[UITextView alloc]initWithFrame:CGRectMake(10, 300+40+20, WITCH-20, HEIGHT-340)];
    textView.text=contentStr;
    textView.font=[UIFont systemFontOfSize:14];
    textView.textColor=[UIColor grayColor];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

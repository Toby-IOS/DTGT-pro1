//
//  DTGContentTViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGContentViewController.h"
#import "macros.pch"
@interface DTGContentViewController ()

@end

@implementation DTGContentViewController
-(instancetype)initWithTitle:(NSString*)titleString withImgName:(NSString*)imgStr{
    if(self==[super init]){
        titleStr=titleString;
        imgName=imgStr;
    }
    return self;
};

- (void)viewDidLoad {
    [super viewDidLoad];
    contentStr=@"最后，特别感谢卖家大叔古庸汉水的赞助。大叔是一位特别有人情味的藏友，活动准备阶段反复和小青沟通，小青真切地感受到大叔对自己藏品那份心头宝的热爱和不舍。大叔说家里藏品实在太多了，奈何心中的热爱如那涛涛江水奔腾不息，还一直在收进各种宝贝。所以，他想借着本次鬼市活动将自己的藏品分享给同样的惜宝人、有缘人。";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, WITCH, 40)];
    titleLab.text=titleStr;
    titleLab.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:titleLab];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(40, 80+40, WITCH-80, 160)];
    imgView.image=[UIImage imageNamed:imgName];
    [self.view addSubview:imgView];
    
    textView=[[UITextView alloc]initWithFrame:CGRectMake(0, 300-30, WITCH, 200+100)];
//    textView.backgroundColor=[UIColor yellowColor];
    textView.text=contentStr;
    textView.font=[UIFont systemFontOfSize:16];
    [self.view addSubview:textView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  DTGTCompanyViewController.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTCompanyViewController.h"
#import "macros.pch"
@interface DTGTCompanyViewController ()

@end

@implementation DTGTCompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   self.tabBarItem.title=@"公司动态";
    
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 70, WITCH, 40)];
    titleLab.text=@"公司动态";
    titleLab.textAlignment=NSTextAlignmentCenter;
//    [self.view addSubview:titleLab];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(40, 80+20, WITCH-80, 160)];
    imgView.image=[UIImage imageNamed:@"company.png"];
    [self.view addSubview:imgView];
    
    textView=[[UITextView alloc]initWithFrame:CGRectMake(0, 300-30, WITCH, 200+140)];
    //    textView.backgroundColor=[UIColor yellowColor];
    textView.text=@"亚洲财经网(以下称亚财网)是我国第一家立足国内、辐射亚洲，致力于打造亚洲地区最具影响力的全金融门户网站;是一个集合金融征信、大数据应用的金融网络服务平台;是我国唯一一家以互联网金融情报为中心的新金融垂直门户网站;也是我国第一家专注于互联网金融产品口碑为主题的UGC聚合互动平台。2010年，亚财网网站正式上线，布局全金融领域，实现全局化共同发展。多年来，亚洲财经联同新华社、上海金融报、上海证券报等多家金融信息数据机构合作，通过领先的互联网技术，在金融信息服务领域，已建成国内较完整的金融数据库。进入互联网+时代，亚财网升级战略布局，以稳定金融秩序为己任，拓展业务服务领域，提供有价值的互联网金融情报，构建安全普惠金融生态圈。产品方面，亚财网始终立足于去中心化、数据为王互联网思维下的新金融业态，解决用户在金融市场遭遇的信息不对称风险和困局，开发了金融情报、金融点评、金融评级、金融舆情、金融征信、金融市场、资产管理等产品服务体系，实现互联网金融全产业链运作。未来，亚财网将要打造成为一个立足亚洲视角，展望全球经济，建成中国的彭博社。";
    textView.backgroundColor=[UIColor clearColor];
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

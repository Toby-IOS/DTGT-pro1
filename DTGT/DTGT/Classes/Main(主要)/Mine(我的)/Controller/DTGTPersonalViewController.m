//
//  DTGTPersonalViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/15.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTPersonalViewController.h"
#import "macros.pch"
#import "TobyCityPicker.h"
#import "DTGTChangePersonalInfoViewController.h"
#import "DTGTAddressViewController.h"
@interface DTGTPersonalViewController ()

@end

@implementation DTGTPersonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:ZPJColor(225, 225, 225)];
     self.navigationItem.title=@"个人资料";
    [self.navigationController setNavigationBarHidden:NO];
    
    myAvataView=[[UIImageView alloc]initWithFrame:CGRectMake(WITCH-75, 5, 50, 50)];
    myAvataView.image=[UIImage imageNamed:@"people1.png"];
    myAvataView.layer.cornerRadius=myAvataView.frame.size.width/2;
    myAvataView.layer.masksToBounds=YES;
    myAvataView.layer.borderWidth=1.5f;
    myAvataView.layer.borderColor=[UIColor whiteColor].CGColor;
    
//    UIImageView *itemBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kBoundsSize.width, 64)];
//    [itemBgView setImage:[UIImage imageNamed:@"navigatebar"]];
//    itemBgView.userInteractionEnabled=YES;
//    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake((kBoundsSize.width-100)/2,20, 100, 44)];
//    title.text = @"个人资料";
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
    array=[NSArray arrayWithObjects:@"头像",@"昵称                                                                   Toby",@"我的二维码",
           @"性别                                                                   未知",
           @"所在地                                                  北京市 海淀区",@"收货地址",@"收藏爱好                                        石头，文玩，雕刻 ",nil];
    
    mainTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kBoundsSize.width, kBoundsSize.height-49)];
    mainTableView.dataSource=self;
    mainTableView.delegate=self;
    mainTableView.backgroundColor=[UIColor clearColor];
    mainTableView.showsVerticalScrollIndicator = NO;
    [self setExtraCellLineHidden:mainTableView];
    [self.view addSubview:mainTableView];
}
-(void)setExtraCellLineHidden: (UITableView *)tableView

{
    
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [array count];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if(indexPath.row==0||indexPath.row==2){
    
        return 60;
    }else {
    return 40;
    }
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text=[array objectAtIndex:indexPath.row];
    cell.textLabel.font=[UIFont fontWithName:@"Helvetica" size:14.0];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle=UITableViewCellAccessoryNone;
    if(indexPath.row==0)
    {
        [cell addSubview:myAvataView];
    }else if(indexPath.row==2){
    
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(WITCH-75, 5, 50, 50)];
        imgView.image=[UIImage imageNamed:@"qr.png"];
        [cell addSubview:imgView];
    
    }

    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0){
        
        [self changeAvata];
        
    }else  if(indexPath.row==1){
        
        [self changePersonInfo:@"昵称" withContent:@"Toby"];
        
    }else  if(indexPath.row==2){

     
    }else  if(indexPath.row==3){
        
      [self changeSex];
        
    }else  if(indexPath.row==4){
      
        [self changeArea];
    }else if(indexPath.row==5){
    
        [self changeAddress];
    }else if(indexPath.row==6){
        
        [self  changePersonInfo:@"收藏爱好" withContent:@"石头，文玩，雕刻"];
    }

    
}
-(void)changeAddress{
    DTGTAddressViewController *addAdressVC=[[DTGTAddressViewController alloc]init];
    [self.navigationController pushViewController:addAdressVC animated:YES];


}
-(void)changeArea{

  
    TobyCityPicker *cityPicker=[[TobyCityPicker alloc]init];
    [cityPicker cityPikerGetSelectCity:^(NSMutableDictionary *dicSelectCity) {
    
         NSString *provinceStr = [dicSelectCity objectForKey:@"Province"];
         NSString *cityStr = [dicSelectCity objectForKey:@"City"];
         NSString *areaString=[NSString stringWithFormat:@"%@ %@",provinceStr,cityStr];
         NSLog(@"areaString==%@",areaString);
        
    }];
    
}


-(void)changeSex{

     sexSheet=[[UIActionSheet alloc]initWithTitle: nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"男", @"女",nil];
    sexSheet.actionSheetStyle=UIActionSheetStyleDefault;
    
    [sexSheet showInView:self.view];

}



-(void)changeAvata{
    
     avataSeet=[[UIActionSheet alloc]initWithTitle:  @"更新头像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择",nil];
    avataSeet.actionSheetStyle=UIActionSheetStyleDefault;
    [avataSeet showInView:self.view];
}

-(void)changePersonInfo:(NSString*)title withContent:(NSString*)string{

    DTGTChangePersonalInfoViewController *pIVC=[[DTGTChangePersonalInfoViewController alloc]initWithString:title withContent:string];
    
    [self.navigationController pushViewController:pIVC animated:YES];


}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(actionSheet==avataSeet){
    if(buttonIndex==0){
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式:通过相机
        PickerImage.sourceType = UIImagePickerControllerSourceTypeCamera;
        PickerImage.allowsEditing = YES;
        PickerImage.delegate = self;
        [self presentViewController:PickerImage animated:YES completion:nil];
        NSLog(@"拍照");
    }
    if(buttonIndex==1){
        NSLog(@"相册");
        //初始化UIImagePickerController
        UIImagePickerController *PickerImage = [[UIImagePickerController alloc]init];
        //获取方式1：通过相册（呈现全部相册），UIImagePickerControllerSourceTypePhotoLibrary
        //获取方式2，通过相机，UIImagePickerControllerSourceTypeCamera
        //获取方法3，通过相册（呈现全部图片），UIImagePickerControllerSourceTypeSavedPhotosAlbum
        PickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        //允许编辑，即放大裁剪
        PickerImage.allowsEditing = YES;
        //自代理
        PickerImage.delegate = self;
        //页面跳转
        [self presentViewController:PickerImage animated:YES completion:nil];
    }
    }else {
    
        if(buttonIndex==0){
            NSLog(@"男");
        }
        if(buttonIndex==1){
            NSLog(@"女");
        }
    
    }
}

//PickerImage完成后的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    //定义一个newPhoto，用来存放我们选择的图片。
    UIImage *newPhoto = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    myAvataView.image = newPhoto;
    [self dismissViewControllerAnimated:YES completion:nil];
}



/**点击左键返回执行的方法*/
-(void)leftBtnClick{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

@end

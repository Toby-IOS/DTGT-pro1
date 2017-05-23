//
//  DTGTAddressViewController.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTAddressViewController.h"
#import "macros.pch"
#import "AdressModel.h"
#import "DTGTAddAddressViewController.h"
#import "AddressCell.h"
#import "DTGTAlertView.h"
@interface DTGTAddressViewController ()

@end

@implementation DTGTAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self.navigationController setNavigationBarHidden:NO ];
    self.navigationItem.title=@"收货地址";
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAddresClick)];
    self.navigationItem.rightBarButtonItem=rightButton;
    
     dataArray=[[NSMutableArray alloc]init];
     stateArray=[[NSMutableArray alloc]init];
    
    for(int i=0;i<3;i++){
        AdressModel *addressModel=[[AdressModel alloc]init];
        addressModel.personName=[NSString stringWithFormat:@"王磊-%i",i];
        addressModel.phoneNum=@"18678902316";
        addressModel.cityName=@"北京";
        addressModel.detailAdress=@"北京市 海淀区 西二旗 西北旺东路10号领创空间";
        addressModel.postCode=[NSString stringWithFormat:@"10010-%i",i];
        [dataArray addObject:addressModel];
        NSMutableDictionary *dic=[NSMutableDictionary dictionary];
        [dic setValue:@"NO" forKey:@"checked"];
        [stateArray addObject:dic];
    
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void )addAddresClick{

    DTGTAddAddressViewController *addVC=[[DTGTAddAddressViewController alloc]init];
    [self.navigationController pushViewController:addVC animated:YES];

    NSLog(@"addAddresClick");

}
-(UITableView*)tableView{
    if(!_maintTbale)
    {
        
    UITableView* tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, WITCH, HEIGHT) style:UITableViewStylePlain];
    tableView.backgroundColor=ZPJColor(245, 245, 245);
    tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView.delegate=self;
        tableView.dataSource=self;
    _maintTbale=tableView;
    }
    return _maintTbale;


}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{



   return  [dataArray count];
};
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

 
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 120.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    AddressCell  *addressCell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (addressCell == nil) {
        addressCell = [[AddressCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
        //addressCell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    AdressModel*model = dataArray[indexPath.row];
    if(indexPath.row==0){
        addressCell.addressShowLabel.text=@"默认地址";
    }else{
        addressCell.addressShowLabel.text=@"设为默认";
    }
    
    addressCell.nameLabel.text = model.personName;
    addressCell.phoneLabel.text = model.phoneNum;
    addressCell.addressLabel.text = model.detailAdress;
    addressCell.editBtn.tag = indexPath.row;
    [addressCell.editBtn addTarget:self action:@selector(editBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    addressCell.deleteBtn.tag = indexPath.row;
    [addressCell.deleteBtn addTarget:self action:@selector(deleteBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    addressCell.defaultAddressBtn.tag = indexPath.row;
    [addressCell.defaultAddressBtn addTarget:self action:@selector(defaultAddressClick:) forControlEvents:UIControlEventTouchUpInside];
    [addressCell.defaultAddressBtn setBackgroundImage:[UIImage imageNamed:@"The_shopping_cart_select"] forState:UIControlStateHighlighted];
    
    NSMutableDictionary *dict = stateArray[indexPath.row];
    if ([[dict objectForKey:@"checked"] isEqualToString:@"NO"]) {
        [dict setObject:@"NO" forKey:@"checked"];
        [addressCell setChecked:NO];
        if (indexPath.row == 0) {
            [addressCell setChecked:YES];
        }
    }else {
        [dict setObject:@"YES" forKey:@"checked"];
        [addressCell setChecked:YES];
    }
    return addressCell;

}
/**编辑按钮 */
- (void)editBtnClick:(UIButton *)button {
    DTGTAddAddressViewController *addAddressVC = [[DTGTAddAddressViewController alloc] init];
//    addAddressVC.model = _dataArray[button.tag];
//    newAddressVC.titleString = @"修改地址";
//    
//    newAddressVC.addressBlock = ^(ReceiptAddressModel *model) {
//        [_dataArray replaceObjectAtIndex:button.tag withObject:model];
//        [_tableView reloadData];
//    };
    [self.navigationController pushViewController:addAddressVC animated:YES];
}

-(void)defaultAddressClick:(UIButton *)button{

    AdressModel *model = dataArray[button.tag];
    [dataArray removeObjectAtIndex:button.tag];
    NSIndexPath *indexPath1 = [NSIndexPath indexPathForRow:button.tag inSection:0];
    [_maintTbale deleteRowsAtIndexPaths:@[indexPath1] withRowAnimation:UITableViewRowAnimationNone];
    [_maintTbale reloadData];
    [dataArray insertObject:model atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_maintTbale insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];

    [DTGTAlertView showWithTitle:@"设置默认地址成功" andFont:14.0 andTime:2.0 andFrame:CGRectMake((kBoundsSize.width-200)/2, kBoundsSize.height-200, 200, 40) addTarget:self.view];

}



/**删除按钮 */
- (void)deleteBtnClick:(UIButton *)button
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"是否确认删除该地址?" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
    actionSheet.actionSheetStyle = UIBarStyleDefault;
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [dataArray removeObjectAtIndex:buttonIndex];
        [_maintTbale reloadData];
    }
}
@end

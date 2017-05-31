//
//  DTGTTabBar.m
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTTabBar.h"
#import "DTGTTabBarButton.h"
#import "macros.pch"

@interface DTGTTabBar()

@property (nonatomic,weak)UIButton *button;

@end



@implementation DTGTTabBar

//-(instancetype)initWithFrame:(CGRect)frame{
//
//    if(self=[super initWithFrame: frame]){
//
//
//    }
//    return self;
//}


//
//-(void)setCount:(NSInteger)count{
//
//    _count=count;
//    for(int i=0;i<self.count;i++){
//
//
//    }
//}

-(void)setItems:(NSMutableArray *)items{
    [self setBackgroundColor:[UIColor whiteColor]];
    _items=items;
    
    for(int i=0;i<[items count];i++){
        
        
        
        UIButton *bnt=[[DTGTTabBarButton alloc]init];
        UITabBarItem *tabBarItem=items[i];
        
        //设置tabBar标题
        NSLog(@"tabBarItem==%@",tabBarItem.title);
        [bnt setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [bnt setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
        [bnt setTitle:tabBarItem.title forState:UIControlStateNormal];
        [bnt setImage:tabBarItem.image forState:UIControlStateNormal];
        [bnt setImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        bnt.titleLabel.font = [UIFont systemFontOfSize:11];
        bnt.tag=i;
        [bnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        CGFloat totalHeight = (bnt.imageView.frame.size.height + bnt.titleLabel.frame.size.height);
        // 设置按钮图片偏移
        [bnt setImageEdgeInsets:UIEdgeInsetsMake(-(totalHeight - bnt.imageView.frame.size.height), 0.0, 0.0, -bnt.titleLabel.frame.size.width+20)];
        // 设置按钮标题偏移
        [bnt setTitleEdgeInsets:UIEdgeInsetsMake(0.0, -bnt.imageView.frame.size.width, -(totalHeight - bnt.titleLabel.frame.size.height)-28,0.0+15)];
        [self addSubview:bnt];
        [bnt addTarget:self action:@selector(buttonOnClick:) forControlEvents:UIControlEventTouchDown];
    }
}
-(void)buttonOnClick:(UIButton *)button{
    
//    if([button tag]!=2){
        if(button.selected)
            return;
        self.button.selected=NO;
        button.selected=YES;
        self.button=button;
//    }
    

    //用来判断是否有以某个名字命名的方法
    if([self.delegate respondsToSelector:@selector(tabBar:index:)]){
        [self.delegate tabBar:self index:button.tag];
    }
    
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat  buttonX=0;
    CGFloat  buttonY=0;
    CGFloat  buttonW=self.frame.size.width/self.subviews.count;
    CGFloat  buttonH=self.frame.size.height;
    int i=0;
    for (UIButton *button in   self.subviews) {
        buttonX=buttonW*i;
        button.tag=i;
        if(i==0){
            [self buttonOnClick:button];
        }
        [button setFrame:CGRectMake(buttonX, buttonY, buttonW, buttonH)];
        i++;
    }
    
}


@end

//
//  DTGTChoiceView.m
//  DTGT
//
//  Created by small T on 17/4/24.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTChoiceView.h"

@implementation DTGTChoiceView

-(instancetype)initWithFrame:(CGRect)frame {

    if(self=[super initWithFrame:frame]){
        self.frame=frame;
//        self.backgroundColor=[UIColor yellowColor];
        self.userInteractionEnabled=YES;
        
    }
    return self;
}

+(instancetype)selectViewFrame:(CGRect)frame withArray:(NSArray*)arry{
    
    DTGTChoiceView* choiceView=[[self alloc]initWithFrame:frame];
    [choiceView selectViewFrame:frame withArray:arry];
    return choiceView;
    
}

-(void)selectViewFrame:(CGRect)frame withArray:(NSArray*)arry{
    for(int i=0;i<[arry count];i++){
        
        UIButton  *button=[[UIButton alloc]initWithFrame:CGRectMake(0+(i%2)*(frame.size.width/2), 5+(i/2)*30, 20, 20)];
        button.tag=i;
        [button setImage:[UIImage imageNamed:@"icon_newimage_picker_default"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"add_pic_icon_pitchon"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [button addTarget:self action:@selector(preventFlicker:) forControlEvents:UIControlEventAllTouchEvents];
        [self addSubview:button];
        
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(button.frame.size.width+(i%2)*(frame.size.width/2), 2+(i/2)*30, (frame.size.width/2-25),25)];
        label.text=[arry objectAtIndex:i];
        label.font=[UIFont systemFontOfSize:14];
        label.textColor=[UIColor grayColor];
        [self addSubview:label];
    }
}

-(void)preventFlicker:(UIButton*)button{
    button.highlighted=NO;
}


-(void)btnAction:(UIButton*)sender{
    NSLog(@"How should i know !");
    sender.selected=!sender.selected;
    NSLog(@"Just test===%ld",sender.tag);

//   if(sender.selected)
    
    self.button.selected=NO;
    sender.selected=YES;
    self.button=sender;
    
}
@end

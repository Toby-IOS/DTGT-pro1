//
//  DTGTAlertView.m
//  DTGT
//
//  Created by 郭建龙 on 2017/5/23.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "DTGTAlertView.h"
#import "DTGTLabel.h"

@interface DTGTAlertView ()

@property(nonatomic, strong)NSString *title;

@property(nonatomic, assign)CGFloat time;

@property(nonatomic, assign)CGFloat fontSize;

@property(nonatomic, strong)UIView *superView;

@property(nonatomic, strong)DTGTLabel *labTitle;

@property(nonatomic, assign)CGRect customFrame;




@end

@implementation DTGTAlertView

+(void)showWithTitle:(NSString *)title andFont:(CGFloat)fontSize andTime:(CGFloat)time  andFrame:(CGRect)customFrame addTarget:(UIView *)superView
{
    /** 给类自身的属性赋值 */
    DTGTAlertView *alerView = [[DTGTAlertView alloc] initWithFrame:superView.bounds];
    alerView.title = title;
    alerView.time = time;
    alerView.fontSize = fontSize;
    alerView.customFrame = customFrame;
    
    [superView addSubview:alerView];
    [alerView setNeedsLayout];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        DTGTLabel *labTitle = [[DTGTLabel alloc] init];
        _labTitle = labTitle;
        
        [self setNeedsLayout];
        
        /** 这里面设置固定的属性 */
        
        //他们设置的是父空间的背景
        /** 设置背景图片 */
        //        UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
        //        UILabel *label = [[UILabel alloc] init];
        //        label.backgroundColor = color;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:labTitle];
        
        /** 设置lab基本属性 */
        _labTitle.backgroundColor = [UIColor colorWithRed:0x00 green:0x00 blue:0x00 alpha:0.5];
        _labTitle.textColor  = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0];
        _labTitle.layer.cornerRadius = 10;
        _labTitle.clipsToBounds = YES;
    }
    return self;
}

-(void)layoutSubviews
{
    CGFloat WY_heigth = [UIScreen mainScreen].bounds.size.height;
    
    /** 设置lab的标题 */
    _labTitle.text = self.title;
    
    /** 设置lab的字体 */
    _labTitle.font = [UIFont systemFontOfSize:self.fontSize];
    //    CGSize size = [self.title sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:self.fontSize]}];
    /** 设置lab的Frame */
    //    CGRect titleRect = self.labTitle.frame;
    //    titleRect.size = CGSizeMake(size.width*1.6, size.height*2.0);//设置lab框的尺寸
    _labTitle.frame = self.customFrame;
    _labTitle.center=CGPointMake(self.center.x, self.center.y+150.0/667*WY_heigth);
}

- (void)didMoveToSuperview
{
    [self performSelector:@selector(removeFromSuperview) withObject:self afterDelay:self.time];
}


@end

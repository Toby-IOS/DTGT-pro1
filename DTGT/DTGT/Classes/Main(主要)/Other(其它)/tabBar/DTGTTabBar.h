//
//  DTGTTabBar.h
//  DTGT
//
//  Created by small T on 17/4/5.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DTGTTabBar;
@protocol TabBarDelegate <NSObject>

-(void)tabBar:(DTGTTabBar*)tabBar index:(NSUInteger)index;

@end


@interface DTGTTabBar : UIView
@property(nonatomic,strong)NSMutableArray *items;
@property(nonatomic,weak)id<TabBarDelegate> delegate;

@end

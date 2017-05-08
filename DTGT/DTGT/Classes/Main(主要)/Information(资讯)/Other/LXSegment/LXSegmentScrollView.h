//
//  LXSegmentScrollView.h
//  LiuXSegment
//
//  Created by liuxin on 16/5/17.
//  Copyright © 2016年 liuxin. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol LXSegmentScrollViewDelegate <NSObject>

-(void)createRsFreshIndex:(NSInteger) index;

@end


@interface LXSegmentScrollView : UIView

@property(nonatomic,assign)id<LXSegmentScrollViewDelegate>dagelate;
-(instancetype)initWithFrame:(CGRect)frame
                  titleArray:(NSArray *)titleArray
            contentViewArray:(NSArray *)contentViewArray;

@end

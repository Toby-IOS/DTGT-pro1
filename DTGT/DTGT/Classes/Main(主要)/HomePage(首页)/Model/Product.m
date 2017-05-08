//
//  Product.m
//  DTGT
//
//  Created by small T on 17/4/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import "Product.h"

@implementation Product
-(id) init
{
    self = [super init];
    
    return self;
}

-(id) initWithDictionary:(NSDictionary*)dic
{
    self = [super init];
    if (self)
    {
        self.productId = [dic objectForKey:@"productId"];
        self.productName = [dic objectForKey:@"productName"];
        self.productTitle = [dic objectForKey:@"productTitle"];
        self.productPrice = [dic objectForKey:@"productPrice"];
        self.productPlace = [dic objectForKey:@"productPlace"];
        self.productImgUrl = [dic objectForKey:@"productImgUrl"];
        self.productCreateTime = [dic objectForKey:@"productCreateTime"];
    }
    
    return self;
}
@end

//
//  Product.h
//  DTGT
//
//  Created by small T on 17/4/27.
//  Copyright © 2017年 guojianlong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{
    
    NSString*productID;
    NSString*productCreateTime;
    NSString*productTitle;
    NSString*productContent;
    NSString*productPrice;
    NSString*productImgUrl;
    
}
@property(nonatomic, copy) NSString *productId;
@property(nonatomic, copy) NSString *productName;
@property(nonatomic, copy) NSString *productTitle;
@property(nonatomic, copy) NSString *productImgUrl;
@property(nonatomic, copy) NSString *productPrice;
@property(nonatomic, copy) NSString *productPlace;
@property(nonatomic, copy) NSString *productCreateTime;
@property(nonatomic, strong) NSArray *productImgUrls;


-(id) initWithDictionary:(NSDictionary*)dic;

@end

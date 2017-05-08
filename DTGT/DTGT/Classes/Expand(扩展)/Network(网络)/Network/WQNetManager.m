//
//  WQNetManager.m
//  AF-block再次封装
//
//  Created by wq on 15-2-14.
//  Copyright (c) 2015年 WQ. All rights reserved.
//

#import "WQNetManager.h"
#import "AFNetworking.h"

@implementation WQNetManager

+ (void)requestDataWithUrlString:(NSString *)urlString contentType:(NSString *)type finished:(DownloadFinishedBlock)finishedBlock failed:(DownloadFailedBlock)failedBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    if (type.length) {
        // json
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:type, nil];
    }
    else
    {
        // xml
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"successed!");
        // 调用传递过来的block
        finishedBlock(responseObject);        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error:%@",error.localizedDescription);
        // 调用传递过来的failedblock
        failedBlock(error.localizedDescription);        
    }];
}

@end

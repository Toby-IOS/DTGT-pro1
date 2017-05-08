//
//  WQNetManager.h
//  AF-block再次封装
//
//  Created by wq on 15-2-14.
//  Copyright (c) 2015年 WQ. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^DownloadFinishedBlock)(id responseObj);
typedef void (^DownloadFailedBlock)(NSString *errorMsg);
// 封装AFNetWorking的网络请求
@interface WQNetManager : NSObject
// 封装AFNetWorking的get请求逻辑
+ (void)requestDataWithUrlString:(NSString *)urlString contentType:(NSString *)type finished:(DownloadFinishedBlock)finishedBlock failed:(DownloadFailedBlock)failedBlock;
@end

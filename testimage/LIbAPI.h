//
//  LIbAPI.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VNDataFetcher.h"
@interface LIbAPI : NSObject

-(void)initWithRequestManager:(id<RequestManaging>)requestMgr;
+ (instancetype)sharedInstance;
-(NSOperation*)GetPictureListOnComplete:(void(^)(NSArray *pictures ,int error))callback;
@end

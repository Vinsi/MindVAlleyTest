//
//  NetworkDataMgr.m
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "NetworkDataMgr.h"
#import "LoaderOperation.h"
#import "LoaderOperationQueueManager.h"
@implementation NetworkDataMgr


-(LoaderOperation*)GetDataFromUrl:(NSURLRequest *)url withData:(id)data andParser:(id<Parsing>)parseObj OnComplete:(void (^)(id, bool))callback{

    LoaderOperation *urlOperation=  [[LoaderOperation alloc] initWithURL:url andParser:parseObj Completion:callback];
  [[LoaderOperationQueueManager sharedInstance] addOperation:urlOperation];
    
    return urlOperation;


}
+ (instancetype)sharedInstance
{
    static NetworkDataMgr *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[NetworkDataMgr alloc] init];
                  });
    
    return sharedInstance;
}
@end

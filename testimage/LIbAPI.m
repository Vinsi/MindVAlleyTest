//
//  LIbAPI.m
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "LIbAPI.h"
#import "VNDataFetcher.h"
#import "PinInterestJsonParser.h"
#import "PictureModal.h"
@interface LIbAPI()

@property(nonatomic,strong) id<RequestManaging> requestManagerObj;

@end

@implementation LIbAPI


+ (instancetype)sharedInstance
{
    static LIbAPI *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[LIbAPI alloc] init];
                  });
    
    return sharedInstance;
}
-(void)initWithRequestManager:(id<RequestManaging>)requestMgr{

    
    self.requestManagerObj = requestMgr;

}

-(NSOperation*)GetPictureListOnComplete:(void(^)(NSArray *pictures ,int error))callback{
    
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://pastebin.com/raw/wgkJgazE"]];
return [self.requestManagerObj getDataForURL:request withOnComplete:^(NSArray* pictures, bool Success, bool Cached) {
    
    if(callback)callback(pictures,Success);
    
}];

}
@end

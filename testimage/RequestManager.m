//
//  RequestManager.m
//  testimage
//
//  Created by vinsi on 6/8/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "RequestManager.h"
#import "Url2KeyMapping.h"
#import "NetworkDataManaging.h"
#import "MemCacheManaging.h"
#import "LoaderOperation.h"
@interface RequestManager()<RequestManaging>
{
}
@property(nonatomic,strong) NSMutableDictionary *map;// key :{url status rqstcount}
@property(nonatomic,strong) id<NetworkDataManaging> nwMgrObj;
@property(nonatomic,strong) id<Url2KeyMapping> Url2KeyObj;
@property(nonatomic,strong) id<MemCacheManaging> memCache;
@property(nonatomic,strong) id<Parsing> parser;
@property(nonatomic,strong) NSMutableArray *callbacksArray;
@end
@implementation RequestManager
+ (instancetype)sharedInstance
{
    static RequestManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[RequestManager alloc] init];
                  });
    
    return sharedInstance;
}
-(NSMutableArray *)callbacksArray{

    if(_callbacksArray)return _callbacksArray;
    return _callbacksArray = [[NSMutableArray alloc]init];

}
-(instancetype)initWithNWMgr:(id<NetworkDataManaging>)nwMgr withCacheMgr:(id<MemCacheManaging>)CacheMgr withParser:(id<Parsing>)parser withKeyMapper:(id<Url2KeyMapping>)mapObj{
    if(self = [super init]){
    
        self.nwMgrObj   = nwMgr   ;
        self.Url2KeyObj = mapObj  ;
        self.parser     = parser  ;
        self.memCache   = CacheMgr;
    }
    return self;
}

-(NSOperation*)getDataForURL:(NSURLRequest *)url withOnComplete:(void (^)(id data, bool success,bool cached))callback{
    
    
    NSString * urlString = [[url URL] absoluteString];
   __block  NSString * key       = [self.Url2KeyObj getKey4Url:urlString];
    
    if(self.memCache){
    NSMutableDictionary *cached =  [self.memCache getDataForKey:key];
    
    bool isCached =NO;
    
    
    
    if(cached!=NULL){
        isCached =YES;
        callback(cached,YES,isCached);
        return NULL;
              // create new one

    }
   }
        
      NSOperation *operation =  [self.nwMgrObj GetDataFromUrl:url withData:nil andParser:self.parser OnComplete:^(id data, bool Success) {
            
            [self.memCache setData:data forKey:key];
            callback(data,Success,NO);
            
        }];
        // existing
        
        return operation ;
    

}

@end

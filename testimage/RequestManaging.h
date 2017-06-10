//
//  RequestManaging.h
//  testimage
//
//  Created by vinsi on 6/7/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkDataManaging.h"
#import "Url2KeyMapping.h"
#import "MemCacheManaging.h"
#import "Parsing.h"
@protocol RequestManaging <NSObject>

-(instancetype)initWithNWMgr:(id<NetworkDataManaging>)nwMgr
withCacheMgr:(id<MemCacheManaging>)CacheMgr
                  withParser:(id<Parsing>) parser
withKeyMapper:(id<Url2KeyMapping>)mapObj;

-(NSOperation*)getDataForURL:(NSURLRequest*)url
withOnComplete:(void(^)(id Data ,bool Success,bool Cached))callback;


@end

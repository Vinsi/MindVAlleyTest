//
//  CacheManager.h
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MemCacheManaging.h"
@interface CacheManager : NSObject <MemCacheManaging>
@property(nonatomic,strong) NSMutableDictionary *data;
+ (instancetype)sharedInstance;
@end

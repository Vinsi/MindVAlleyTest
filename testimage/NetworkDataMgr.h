//
//  NetworkDataMgr.h
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkDataManaging.h"
@interface NetworkDataMgr : NSObject<NetworkDataManaging>
+ (instancetype)sharedInstance;
@end

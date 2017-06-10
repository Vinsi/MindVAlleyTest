//
//  RequestManager.h
//  testimage
//
//  Created by vinsi on 6/8/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RequestManaging.h"
@interface RequestManager : NSObject <RequestManaging>
+ (instancetype)sharedInstance;
@end

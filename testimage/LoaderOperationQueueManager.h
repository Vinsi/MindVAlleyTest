//
//  LoaderOperationQueueManager.h
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoaderOperationQueueManager : NSObject


+ (instancetype)sharedInstance;
- (void)addOperation:(NSOperation *)operation;
@end

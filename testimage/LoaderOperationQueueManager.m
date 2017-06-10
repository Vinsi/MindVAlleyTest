//
//  LoaderOperationQueueManager.m
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "LoaderOperationQueueManager.h"



@interface LoaderOperationQueueManager ()

/**
 NSOperationQueue that operations will be added to.
 */
@property (nonatomic, strong) NSOperationQueue *queue;

@end

@implementation LoaderOperationQueueManager

#pragma mark - SharedInstance

+ (instancetype)sharedInstance
{
    static LoaderOperationQueueManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[LoaderOperationQueueManager alloc] init];
                  });
    
    return sharedInstance;
}

#pragma mark - Init

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.maxConcurrentOperationCount =10;
    }
    
    return self;
}

#pragma mark - AddOperation

- (void)addOperation:(NSOperation *)operation
{
    [self.queue addOperation:operation];
}

@end


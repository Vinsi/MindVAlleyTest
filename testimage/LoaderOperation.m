//
//  Loader.m
//  testimage
//
//  Created by vinsi on 6/8/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "LoaderOperation.h"
#import "Parsing.h"


@interface LoaderOperation ()

/**
 Completion block to be called once the the request and parsing is completed. Will return the parsed answers or nil.
 */
@property (nonatomic, copy) void (^completion)(id data ,bool success);
@property (nonatomic,strong) NSURLRequest *url;
@property (nonatomic,strong) NSURLSessionDataTask *task;
@property(nonatomic,strong)id<Parsing> parseObj;
@end

@implementation LoaderOperation

#pragma mark - Init

- (instancetype)initWithURL:(NSURLRequest*)surl andParser:(id<Parsing>)Parseobj Completion:(void (^)(id data ,bool success))callback
{
    self = [super init];
    
    if (self)
    {
        self.completion = callback;
        self.name = @"Answers-Retrieval";
        self.parseObj = Parseobj;
        self.url = surl;
    }
    
    return self;
}

#pragma mark - Start

- (void)start
{
    [super start];
    
    NSURLSession *session = [NSURLSession sharedSession];
    

    
      self.task = [session dataTaskWithRequest:self.url
                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
                                  {
                                     
                                      if (self.completion)
                                      {
                                          if(self.parseObj){
                                          [self.parseObj parse:data OnComplete:^(id data, bool success) {
                                              
                                              
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  // do work here
                                                  self.completion(data ,YES );
                                                  
                                              });
                                              [self finish];
                                          }];
                                           
                                          }
                                          else {
                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                  // do work here
                                                  self.completion(data ,YES );
                                                  
                                              });
                                       
                                          [self finish];
                                          }
                                        
                                      }
                                      else {
                                      
                                      
                                      [self finish];
                                      }
                                      
                                      
                                  }];
    
    [self.task resume];

}

#pragma mark - Cancel

- (void)cancel
{
     [self.task cancel];
    [super cancel];
   
    [self finish];
}

@end

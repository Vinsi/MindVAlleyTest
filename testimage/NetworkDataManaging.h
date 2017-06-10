//
//  NetworkDataManager.h
//  testimage
//
//  Created by vinsi on 6/7/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkDataManaging.h"
#import "Parsing.h"
@protocol NetworkDataManaging <NSObject>

-(NSOperation*)GetDataFromUrl:(NSURLRequest*)rqst withData:(id)data andParser:(id<Parsing>)parseObj
OnComplete:(void(^)(id data ,bool Success))callback;

@end

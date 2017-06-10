//
//  Loader.h
//  testimage
//
//  Created by vinsi on 6/8/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseOperation.h"
#import "Parsing.h"
@interface LoaderOperation : BaseOperation

- (instancetype)initWithURL:(NSURLRequest*)surl
                  andParser:(id<Parsing>)Parseobj
                 Completion:(void (^)(id data ,bool success))callback;
@end

//
//  Parser.h
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Parsing <NSObject>

-(void)parse:(id)data OnComplete:(void(^)(id data ,bool success))callback;

@end

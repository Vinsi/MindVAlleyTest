//
//  ImageParsing.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parsing.h"
@interface ImageParsing : NSObject <Parsing>
+ (instancetype)sharedInstance;

@end

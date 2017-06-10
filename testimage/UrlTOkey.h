//
//  UrlTOkey.h
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Url2KeyMapping.h"
@interface UrlTOkey : NSObject<Url2KeyMapping>
+ (instancetype)sharedInstance;
@end

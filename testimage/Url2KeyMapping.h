//
//  Url2KeyMapping.h
//  testimage
//
//  Created by vinsi on 6/7/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Url2KeyMapping <NSObject>

-(NSString*)getKey4Url:(NSString *)url;

@end

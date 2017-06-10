//
//  UrlTOkey.m
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "UrlTOkey.h"
#import "NSString+MD5.h"
@implementation UrlTOkey

-(NSString *)getKey4Url:(NSString *)url{


    return [url generateMD5];

}
+ (instancetype)sharedInstance
{
    static UrlTOkey *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[UrlTOkey alloc] init];
                  });
    
    return sharedInstance;
}
@end

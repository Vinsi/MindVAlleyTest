//
//  ImageParsing.m
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "ImageParsing.h"
#import <UIKit/UIKit.h>
@implementation ImageParsing
-(void)parse:(id)data OnComplete:(void (^)(id data, bool success))callback{

    
UIImage *image = [UIImage imageWithData:data];
   callback(image,YES);
    

}
+ (instancetype)sharedInstance
{
    static ImageParsing *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[ImageParsing alloc] init];
                  });
    
    return sharedInstance;
}

@end

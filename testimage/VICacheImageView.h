//
//  UIImageView+ImageLoader.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VNDataFetcher.h"
#import "RequestManager.h"
@interface VICacheImageView :UIImageView

@property(nonatomic,strong) NSOperation *operation;
-(void)CancelImageLoading;

-(void)setURL:(NSString*)url
 onProcessing:(UIImage*)processingImage
       onFail:(UIImage*)failImage
   OnComplete:(void(^)(UIImage *image,bool success))callback;
-(void)setURL:(NSString*)url
 onProcessing:(UIImage*)processingImage
       onFail:(UIImage*)failImage;
@end

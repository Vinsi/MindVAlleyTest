 //
//  UIImageView+ImageLoader.m
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "VICacheImageView.h"
#import "ImageParsing.h"

@implementation VICacheImageView
+ (RequestManager*)sharedRequest
{
    static RequestManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[RequestManager alloc] initWithNWMgr:[NetworkDataMgr sharedInstance]
                                                                withCacheMgr: [CacheManager sharedInstance] withParser:[ImageParsing sharedInstance] withKeyMapper:[UrlTOkey sharedInstance]];
                  });
    
    return sharedInstance;
}

-(void)setURL:(NSString*)url
 onProcessing:(UIImage*)processingImage
       onFail:(UIImage*)failImage
   OnComplete:(void(^)(UIImage *image,bool success))callback{
    

                          
                         
     __weak typeof (self) wkself =self;
    if(processingImage)
      [wkself setImage:processingImage];
    NSURLRequest *urlrq = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
   self.operation = [[VICacheImageView sharedRequest] getDataForURL:urlrq withOnComplete:^(UIImage* image, bool Success ,bool cached ) {
        
        
        NSLog(@"isCached:[ %@]",cached?@"Yes":@"NO");
        if(Success)
        [wkself setImage:image];
        else
            if(failImage)
         [wkself setImage:failImage];
            
    }];
    
    
    
    
    
    
    
    
}


-(void)setURL:(NSString*)url
 onProcessing:(UIImage*)processingImage
       onFail:(UIImage*)failImage{

    [self setURL:url onProcessing:processingImage onFail:failImage OnComplete:nil];


}
-(void)CancelImageLoading{
    [self.operation cancel];


}



@end

//
//  RequestFactory.m
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "RequestFactory.h"
#import "RequestManager.h"
#import "UrlTOkey.h"
#import "CacheManager.h"
#import "ImageParsing.h"
#import "NetworkDataMgr.h"
@implementation RequestFactory


-(RequestManager*)CreateImageRequestMgr{
    

return  [[RequestManager alloc] initWithNWMgr:[NetworkDataMgr sharedInstance]
                                          withCacheMgr: [CacheManager sharedInstance] withParser:[ImageParsing sharedInstance] withKeyMapper:[UrlTOkey sharedInstance]];

}

-(RequestManager*)CreateURLRequestMgr{
    
    
    return  [[RequestManager alloc] initWithNWMgr:[NetworkDataMgr sharedInstance]
                                     withCacheMgr: [CacheManager sharedInstance] withParser:[ImageParsing sharedInstance] withKeyMapper:[UrlTOkey sharedInstance]];
    
}

@end

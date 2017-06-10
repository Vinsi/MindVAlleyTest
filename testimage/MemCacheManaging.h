//
//  MemCacheManaging.h
//  testimage
//
//  Created by vinsi on 6/7/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MemCacheManaging <NSObject>

-(id)getDataForKey:(NSString*)key ;
-(void)setData:(id)data forKey:(NSString*)key;
-(int)getMaxCacheSize;
-(int)getMaxAge;





@end

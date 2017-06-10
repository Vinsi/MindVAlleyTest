//
//  CacheManager.m
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "CacheManager.h"

@interface CacheManager()
@property(nonatomic,strong) NSMutableArray *keys;


@end
@implementation CacheManager

-(NSMutableDictionary *)data{
    if(_data)return _data;
    return  _data = [[NSMutableDictionary alloc]init];
    

}
-(NSMutableArray *)keys{
    if(_keys)return _keys;
    return _keys = [[NSMutableArray alloc]init];

}
+ (instancetype)sharedInstance
{
    static CacheManager *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      sharedInstance = [[CacheManager alloc] init];
                  });
    
    return sharedInstance;
}

-(id)getDataForKey:(NSString*)key {

   return [[CacheManager sharedInstance].data  objectForKey:key];
}
-(void)setData:(id)data forKey:(NSString*)key{
    
    
    if([self  getMySize]>self.getMaxCacheSize){
    
        if(self.keys.count>0){
        [self.data removeObjectForKey:self.keys[0]];
        [self.keys removeObjectAtIndex:0];
        }
    }
    [self.keys addObject:key];
    [[CacheManager sharedInstance].data  setObject:data forKey:key];
}

-(int)getMaxCacheSize{
    
    return 104857600 ;// 100 mb

}

-(NSInteger)getMySize{

    NSData * data = [NSPropertyListSerialization dataFromPropertyList:self.data
                                                               format:NSPropertyListBinaryFormat_v1_0 errorDescription:NULL];
    return data.length;
}


@end

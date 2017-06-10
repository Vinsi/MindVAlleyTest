//
//  UrlModals.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UrlModal : NSObject
@property(nonatomic,strong) NSString *raw  ;
@property(nonatomic,strong) NSString *full ;
@property(nonatomic,strong) NSString *regular;
@property(nonatomic,strong) NSString *small;
@property(nonatomic,strong) NSString *thumb;
@end

//
//  UserModal.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileImageModal.h"
#import "LinksModal.h"
@interface UserModal : NSObject
@property (nonatomic,strong)NSString *userid    ;
@property (nonatomic,strong)NSString *username    ;
@property (nonatomic,strong)NSString *name    ;
@property (nonatomic,strong)ProfileImageModal *profile_image;
@property (nonatomic,strong)LinksModal *links;
@end

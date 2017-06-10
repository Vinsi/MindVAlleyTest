//
//  CategoryModal.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinksModal.h"
@interface CategoryModal : NSObject


@property(nonatomic,strong) NSString *catid;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,assign) NSInteger photocount;
@property(nonatomic,strong) LinksModal *links;
@end

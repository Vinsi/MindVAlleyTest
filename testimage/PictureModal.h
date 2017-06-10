//
//  PictureModals.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//
#import "UserModal.h"
#import "UrlModal.h"
#import "PictureModal.h"
#import "LinksModal.h"
#import <Foundation/Foundation.h>

@interface PictureModal : NSObject
@property (nonatomic,strong ) NSString *pictureid                   ;
@property (nonatomic,strong ) NSString *created_at                    ;
@property (nonatomic,assign ) NSInteger width                       ;
@property (nonatomic,assign ) NSInteger height                     ;
@property (nonatomic,strong ) NSString *color                       ;
@property (nonatomic,assign ) NSInteger likes                       ;
@property (nonatomic,assign ) bool liked_by_user                   ;
@property (nonatomic,strong ) UserModal *user                       ;
@property (nonatomic,strong ) NSArray *current_user_collections     ;
@property (nonatomic,strong ) UrlModal *urls                         ;
@property(nonatomic,strong) NSArray *Categories                     ;
@property(nonatomic,strong) LinksModal *links                         ;
@end

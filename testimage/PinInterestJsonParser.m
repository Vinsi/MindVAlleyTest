//
//  PinInterestJsonParser.m
//  testimage
//
//  Created by vinsi on 6/9/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "PinInterestJsonParser.h"
#import "PictureModal.h"
#import "UserModal.h"
#import "LinksModal.h"
#import "UrlModal.h"
#import "CategoryModal.h"
#import "ProfileImageModal.h"

@implementation PinInterestJsonParser


-(void)parse:(id)data OnComplete:(void (^)(id data , bool success  ))callback{

    NSData *returnedData = data;
    
    // probably check here that returnedData isn't nil; attempting
    // NSJSONSerialization with nil data raises an exception, and who
    // knows how your third-party library intends to react?
    
    if(NSClassFromString(@"NSJSONSerialization"))
    {
        NSError *error = nil;
        id object = [NSJSONSerialization
                     JSONObjectWithData:returnedData
                     options:0
                     error:&error];
        
        if(error) { /* JSON was malformed, act appropriately here */
        
             if(callback)callback(nil,NO);
            return;
        }
        
   
        // the originating poster wants to deal with dictionaries;
        // assuming you do too then something like this is the first
        // validation step:
        NSMutableArray * results = [[NSMutableArray alloc]init];
        if([object isKindOfClass:[NSArray class]])
        {
            NSArray *photos = object;
            for (NSDictionary *photo in photos) {
                
                PictureModal *newPic = [PictureModal new];
                
            newPic.pictureid  =       [photo objectForKey:@"id"];
                NSString *sdate =  [photo objectForKey:@"created_at"];
              //  NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
              //  [dateFormat setDateFormat:@"yyyy-MM-ddTHH:mm:ssZ"];// 2016-05-29T15:42:02-04:00
                //NSDate *date = [dateFormat dateFromString:sdate];
                NSLog(@"%@",sdate);
            newPic.created_at =      sdate;
            newPic.width  =    [[photo objectForKey:@"width"] integerValue];
            newPic.height =    [[photo objectForKey:@"height"] integerValue];
            newPic.color  =    [photo objectForKey:@"color"] ;
            newPic.likes  =    [[photo objectForKey:@"likes"] integerValue];
            newPic.liked_by_user =  [[photo objectForKey:@"liked_by_user"] boolValue];
            newPic.current_user_collections =  [photo objectForKey:@"current_user_collections"];
            NSMutableArray* catarray = [[NSMutableArray alloc]init];
            NSArray *cats =   [photo objectForKey:@"categories"];
                for (NSDictionary *cat in cats) {
                    
                    CategoryModal *catObj = [CategoryModal new];
                    catObj.catid =[cat objectForKey:@"id"];
                    catObj.title= [cat objectForKey:@"title"];
                     catObj.photocount = [[cat objectForKey:@"photo_count"]integerValue];
                    NSDictionary *links = [cat objectForKey:@"links"];
                    LinksModal *linkobj = [LinksModal new];
                    linkobj.selflink = [links objectForKey:@"self"];
                    linkobj.photoslink = [links objectForKey:@"photos"];
                    
                    catObj.links =linkobj;
                    [catarray  addObject:catObj];
                }
                
                newPic.Categories = catarray;
                newPic.links =  [photo objectForKey:@"links"];
                UserModal *user  =  [ UserModal new];
                NSDictionary * usrobj = [photo objectForKey:@"user"];
                user.userid   = [usrobj objectForKey:@"id"];
                user.username = [usrobj objectForKey:@"username"];
                user.name     = [usrobj objectForKey:@"name"];
                
                NSDictionary *proObj = [usrobj valueForKeyPath:@"profile_image"];
                ProfileImageModal * profileModal = [ProfileImageModal new];
                 profileModal.small    = [proObj objectForKey:@"small"];
                 profileModal.medium   =[proObj objectForKey:@"medium"];
                 profileModal.large    =[proObj objectForKey:@"large"];
                user.profile_image     = profileModal;
                
                NSDictionary *usrlnkObj = [usrobj valueForKeyPath:@"links"];
                LinksModal *objLink = [LinksModal new];
                objLink.selflink = [usrlnkObj objectForKey:@"self"];
                objLink.likeslink = [usrlnkObj objectForKey:@"likes"];
                objLink.htmllink = [usrlnkObj objectForKey:@"html"];
                objLink.photoslink = [usrlnkObj objectForKey:@"photos"];
                user.links  = objLink;
                newPic.user = user;
                NSDictionary *picLink = [photo objectForKey:@"links"];
                LinksModal * picLinkModalobj = [LinksModal new];
                picLinkModalobj.selflink = [picLink objectForKey:@"self"];
                picLinkModalobj.htmllink = [picLink objectForKey:@"html"];
                picLinkModalobj.downloadlink = [picLink objectForKey:@"download"];
                newPic.links = picLinkModalobj;
                UrlModal *urlModal = [UrlModal new];
                NSDictionary *dctUrl = [photo objectForKey:@"urls"];
                urlModal.raw  = [dctUrl objectForKey:@"raw"];
                urlModal.full  = [dctUrl objectForKey:@"full"];
                urlModal.regular  = [dctUrl objectForKey:@"regular"];
                urlModal.small  = [dctUrl objectForKey:@"small"];
                urlModal.thumb  = [dctUrl objectForKey:@"thumb"];
                newPic.urls = urlModal;
                [results addObject:newPic];
                
            }
            if(callback)callback(results,YES);
            /* proceed with results as you like; the assignment to
             an explicit NSDictionary * is artificial step to get
             compile-time checking from here on down (and better autocompletion
             when editing). You could have just made object an NSDictionary *
             in the first place but stylistically you might prefer to keep
             the question of type open until it's confirmed */
        }
        else
        {
             if(callback)callback(nil,NO);
            /* there's no guarantee that the outermost object in a JSON
             packet will be a dictionary; if we get here then it wasn't,
             so 'object' shouldn't be treated as an NSDictionary; probably
             you need to report a suitable error condition */
        }
    }
    else
    {
        // the user is using iOS 4; we'll need to use a third-party solution.
        // If you don't intend to support iOS 4 then get rid of this entire
        // conditional and just jump straight to
        // NSError *error = nil;
        // [NSJSONSerialization JSONObjectWithData:...
    }
}
@end

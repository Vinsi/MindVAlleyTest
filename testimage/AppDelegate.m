//
//  AppDelegate.m
//  testimage
//
//  Created by vinsi on 6/6/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import "AppDelegate.h"
#import "LIbAPI.h"
#import "PinInterestJsonParser.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
   
    [[LIbAPI sharedInstance]initWithRequestManager: [[RequestManager alloc] initWithNWMgr:[NetworkDataMgr sharedInstance]
                                                              withCacheMgr: [CacheManager sharedInstance]withParser:[PinInterestJsonParser new]
                                                             withKeyMapper:[UrlTOkey sharedInstance]]];
        
    
//   RequestManager *rq = [[RequestManager alloc]
//     initWithNWMgr: [NetworkDataMgr new]
//                         withCacheMgr:[CacheManager sharedInstance]
//withKeyMapper:[UrlTOkey new]
//     ];
//    
//    NSURLRequest *urlrq = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.planwallpaper.com/static/images/6775415-beautiful-images.jpg"]];
//    [rq getDataForURL:urlrq withOnComplete:^(id Data, bool Success) {
//        
//    }];
    
    return  YES;

}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

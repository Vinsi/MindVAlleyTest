//
//  CategoriesViewController.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface CategoriesViewController :UIViewController
@property(nonatomic,strong) IBOutlet UITableView *tblView;
@property(nonatomic,strong) NSArray *arrCategories;
@end

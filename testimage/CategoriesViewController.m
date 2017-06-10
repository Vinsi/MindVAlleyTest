//
//  CategoriesViewController.m
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//
#import "CategoryModal.h"
#import "CategoriesViewController.h"
@interface CategoriesViewController()

@property(nonatomic,strong) UITableView *tblCategories;


@end
@implementation CategoriesViewController

-(void)viewDidLoad{
    [self.tblView reloadData];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrCategories.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"CellIdentifier";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    CategoryModal *catMOdal = self.arrCategories[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@(%ld)",catMOdal.title,(long)catMOdal.photocount ];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end

//
//  PictureTableViewCell.h
//  testimage
//
//  Created by vinsi on 6/10/17.
//  Copyright © 2017 vinsi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VICacheImageView.h"
@interface PictureTableViewCell : UITableViewCell

@property(nonatomic,strong) IBOutlet VICacheImageView *picture ,*img_user;
@property(nonatomic,strong) IBOutlet UILabel *lblCreatedDate,*lblName,*lblDate;
@property(nonatomic,strong) IBOutlet UIButton *btnCategories;

@end

//
//  ViewController.m
//  testimage
//
//  Created by vinsi on 6/6/17.
//  Copyright © 2017 vinsi. All rights reserved.
//
#import "PictureTableViewCell.h"
#import "PhotoViewController.h"
#import "PictureTableViewCell.h"
#import "VICacheImageView.h"
#import "LIbAPI.h"
#import "PictureModal.h"
#import "CategoriesViewController.h"
static NSString* cellPicIdentifier = @"PictureCell";
@interface PhotoViewController ()<UITableViewDelegate,UITableViewDataSource>


@property(nonatomic,strong) NSArray *pictures;
@property(nonatomic,strong) CategoriesViewController *vwcCategory;
@property(nonatomic,assign) NSInteger selectedIndex;
@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
  
    
     // UINib *PictureCell = [UINib nibWithNibName:@"PictureCell" bundle:nil];
     // [self.tblView registerNib:PictureCell forCellReuseIdentifier:cellPicIdentifier];
   // [self.tblView registerClass:[PictureTableViewCell class] forCellReuseIdentifier: cellPicIdentifier];
    self.selectedIndex =-1;
    [self LoadData];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(void)LoadData{
 __weak typeof (self) wkself =self;
  [[LIbAPI sharedInstance] GetPictureListOnComplete:^(NSArray *pictures, int error) {
      
      wkself.pictures = pictures;
      [wkself.tblView reloadData];
  }];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pictures.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    PictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellPicIdentifier];
  
    if(cell==nil){
        cell = [[NSBundle mainBundle]loadNibNamed:@"PictureTableViewCell" owner:self options:nil][0];
    
    }
    
    cell.textLabel.text = @"";
    PictureModal *picModal = self.pictures[indexPath.row];
    
    [cell.picture setURL:picModal.urls.small onProcessing:[UIImage imageNamed:@"loading.gif"] onFail:nil];
    [cell.img_user setURL:picModal.user.profile_image.small onProcessing:[UIImage imageNamed:@"loading.gif"] onFail:nil];
    [cell.lblName setText:picModal.user.name];
    cell.lblDate.text = [NSString  stringWithFormat: @"%@",picModal.created_at];
  //  cell.lblDate.text = [NSString stringWithFormat:@"%@",picModal.created_at];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
  
    self.selectedIndex = indexPath.row;
    [self performSegueWithIdentifier:@"showcategory" sender:self];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showcategory"])
    {
        // Get reference to the destination view controller
        CategoriesViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        PictureModal *pictObj= self.pictures[self.selectedIndex];
        
        [vc setArrCategories:pictObj.Categories];
        
        
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}


@end

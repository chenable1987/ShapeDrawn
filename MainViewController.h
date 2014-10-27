//
//  MainViewController.h
//  ShapeDrawn
//
//  Created by Jie on 2014-10-27.
//  Copyright (c) 2014 JieChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITabBarDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *canvas;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)clearButtonPressed:(id)sender;
-(IBAction)okButtonPressed:(UIStoryboardSegue*) segue;
-(IBAction)cancelButtonPressed:(UIStoryboardSegue*) segue;

@end

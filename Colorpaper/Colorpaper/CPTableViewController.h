//
//  CPTableViewController.h
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/22/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CPTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak,nonatomic) UITableView *tableView;

@end

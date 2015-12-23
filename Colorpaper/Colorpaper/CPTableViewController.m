//
//  CPTableViewController.m
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/22/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import "CPTableViewController.h"
#import "CPTableViewCell.h"

@interface CPTableViewController ()
@end

@implementation CPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat actualPosition = scrollView.contentOffset.y;
//    // contentSize.height(実際のサイズ)より少し減らしておくことで、そこに到達した時点で（実際のcontentSize.heightに到達する前に）限界を上げてくれる
//    CGFloat contentHeight = scrollView.contentSize.height;
//    if (actualPosition >= contentHeight) {
//        [self.tableView reloadData];
//    }
//}


@end

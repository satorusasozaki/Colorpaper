//
//  CPTableViewController.m
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/22/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import "CPTableViewController.h"
#import "CPTableViewCell.h"
#import "UIColor+Hex.h"
#import "ColorLists.h"

@interface CPTableViewController ()
@property (strong,nonatomic) ColorLists *colorList;

@end

@implementation CPTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:[self.view bounds]];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
//    ColorLists *colorList = [[ColorLists alloc] init];
    self.colorList = [[ColorLists alloc] init];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.colorList.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CELL";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CPTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor colorWithHexString:[self.colorList.list objectAtIndex:indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSArray *test = [NSArray array];
    CGFloat actualPosition = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height - 500;
    if (actualPosition >= contentHeight) {
        [test addObjectsFromArray:self.colorList.list];
        [self.tableView reloadData];
    }
}

@end

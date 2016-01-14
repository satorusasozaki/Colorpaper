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
#import "UIImage+withColor.h"
#import "ColorLists.h"

@interface CPTableViewController ()
@property (strong, nonatomic) ColorLists *colorList;

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
    tableView.allowsSelection = NO;
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
    cell.backgroundColor = [self.colorList.list objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

#pragma mark - Slider

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *save = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
                                                                    title:@" Save "
                                                                    handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
                                                                        UITableViewCell *tappedCell = [tableView cellForRowAtIndexPath:indexPath];
                                                                        
                                                                        SEL selector = @selector(onCompleteCapture:didFinishSavingWithError:contextInfo:);
                                                                        
                                                                        UIImage *solidImage = [UIImage imageWithColor:tappedCell.backgroundColor];
                                                                        UIImageWriteToSavedPhotosAlbum(solidImage, self, selector, nil);
                                                                        
                                                                        [tableView setEditing:NO animated:YES];
                                                                    }];
    save.backgroundColor = [UIColor colorWithHexString:@"007AFF"];
    return @[save];
}

#pragma mark - Infinite Scroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat actualPosition = scrollView.contentOffset.y;
    CGFloat contentHeight = scrollView.contentSize.height - 1000;
    if (actualPosition >= contentHeight) {
        [self.colorList.list addObjectsFromArray:self.colorList.list];
        [self.tableView reloadData];
    }
}

- (void)onCompleteCapture:(UIImage *)screenImage didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *message = @"Saved to camera roll";
    if (error) message = @"Failed to save";

    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@""
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    UIAlertAction *ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction *action) {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    [alert addAction:ok];
    
}




@end

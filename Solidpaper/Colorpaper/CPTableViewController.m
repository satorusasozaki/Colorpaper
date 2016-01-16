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
#import <URBNAlert/URBNAlert.h>
#import "MCSwipeTableViewCell.h"

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
    MCSwipeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MCSwipeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.backgroundColor = [self.colorList.list objectAtIndex:indexPath.row];
    
    
    UIView *checkView = [self viewWithImageName:@"check"];
    UIColor *greenColor = [UIColor colorWithRed:85.0 / 255.0 green:213.0 / 255.0 blue:80.0 / 255.0 alpha:1.0];
    
    
    [cell setDefaultColor:self.tableView.backgroundView.backgroundColor];
    [cell setSwipeGestureWithView:checkView color:greenColor mode:MCSwipeTableViewCellModeExit state:MCSwipeTableViewCellState1 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
        [self deleteCell:cell];
        NSLog(@"Did swipe \"Checkmark\" cell");
    }];

    
//    UIView *crossView = [self viewWithImageName:@"cross"];
//    UIColor *redColor = [UIColor colorWithRed:232.0 / 255.0 green:61.0 / 255.0 blue:14.0 / 255.0 alpha:1.0];
//    [cell setSwipeGestureWithView:crossView color:redColor mode:MCSwipeTableViewCellModeSwitch state:MCSwipeTableViewCellState2 completionBlock:^(MCSwipeTableViewCell *cell, MCSwipeTableViewCellState state, MCSwipeTableViewCellMode mode) {
//        NSLog(@"Did swipe \"Cross\" cell");
//    }];

    
    
    return cell;
}

- (void)deleteCell:(MCSwipeTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (UIView *)viewWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.contentMode = UIViewContentModeCenter;
    return imageView;
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

//- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    UITableViewRowAction *save = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive
//                                                                    title:@" Save "
//                                                                    handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//                                                                        UITableViewCell *tappedCell = [tableView cellForRowAtIndexPath:indexPath];
//                                                                        
//                                                                        SEL selector = @selector(onCompleteCapture:didFinishSavingWithError:contextInfo:);
//                                                                        
//                                                                        UIImage *solidImage = [UIImage imageWithColor:tappedCell.backgroundColor];
//                                                                        UIImageWriteToSavedPhotosAlbum(solidImage, self, selector, nil);
//                                                                        
//                                                                        [tableView setEditing:NO animated:YES];
//                                                                    }];
//    save.backgroundColor = [UIColor colorWithHexString:@"007AFF"];
//    return @[save];
//}

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
    
    URBNAlertViewController *uac = [[URBNAlertViewController alloc] initWithTitle:@"The color is saved to your camera roll" message:@""];
    uac.alertConfig.touchOutsideViewToDismiss = YES; // Touching outside the alert view will dismiss the alert (only for passive alerts)
    uac.alertConfig.duration = 2.0f; // Duration the alert appears (default calculates time based on the amount of text in the title and message. For passive alerts only)
    uac.alertStyler.blurEnabled = @NO;
    uac.alertStyler.buttonBackgroundColor = [UIColor colorWithHexString:@"007AFF"];
    [uac addAction:[URBNAlertAction actionWithTitle:@"OK" actionType:URBNAlertActionTypeNormal actionCompleted:^(URBNAlertAction *action) {
        // URBNAlertActionTypeNormal is triggered when the user touches the button specified by this action
    }]];
    
    [uac show];
}




@end

//
//  ColorLists.m
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/22/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import "ColorLists.h"

@implementation ColorLists

- (id)init{
    self = [super init];
    self.list = [self createArray];
    
    return self;
}

- (NSMutableArray *)createArray{
    NSMutableArray *list = [NSMutableArray arrayWithObjects:@"8FBC8F",
                                              @"C1FFC1",
                                              @"B4EEB4",
                                              @"9BCD9B",
                                              @"698B69",
                     @"98FB98",
                     @"9AFF9A",
                     @"90EE90",
                     @"7CCD7C",
                                                nil];

    return list;
}


@end

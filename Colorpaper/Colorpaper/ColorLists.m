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

- (NSArray *)createArray{
    NSArray *list = [NSArray arrayWithObjects:@"8FBC8F",
                                              @"C1FFC1",
                                              @"B4EEB4",
                                              @"9BCD9B",
                                              @"698B69",
                                                nil];

    return list;
}


@end

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
    NSMutableArray *colors = [NSMutableArray array];

    float hue_increment = 0.01;
    for (float hue = 0.0; hue < 1.0; hue += hue_increment) {
        UIColor *color = [UIColor colorWithHue:hue
                                    saturation:1.0
                                    brightness:1.0
                                         alpha:1.0];
        [colors addObject:color];
    }
    return colors;
}


@end

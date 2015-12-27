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
//    NSMutableArray *list = [NSMutableArray arrayWithObjects:
//                            @"8FBC8F",
//                            @"C1FFC1",
//                            @"B4EEB4",
//                            @"9BCD9B",
//                            @"698B69",
//                            @"98FB98",
//                            @"9AFF9A",
//                            @"90EE90",
//                            @"7CCD7C",
//                                                nil];
    NSMutableArray *colors = [NSMutableArray array];

    float hue_increment = 0.1;
    float saturation_increment = 0.01;
    float brightness_increment = 0.01;
    for (float hue = 0.0; hue < 1.0; hue += hue_increment) {
        for (float saturation = 0.0; saturation < 1.0; saturation += saturation_increment) {
            for (float brightness = 0.0; brightness < 1.0; brightness += brightness_increment) {
                UIColor *color = [UIColor colorWithHue:hue
                                            saturation:saturation
                                            brightness:brightness
                                                 alpha:1.0];
                [colors addObject:color];
            }
        }
    }
    
    
    
    
    

    return colors;
}


@end

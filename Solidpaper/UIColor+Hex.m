//
//  UIColor+Hex.m
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/23/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import "UIColor+Hex.h"

@implementation UIColor (Hex)

+ (UIColor*)colorWithHexString:(NSString *)hex {
    return [self colorWithHexString:hex alpha:1.0];
}

+ (UIColor*)colorWithHexString:(NSString *)hex alpha:(CGFloat)a {
    NSScanner *colorScanner = [NSScanner scannerWithString:hex];
    unsigned int color;
    if (![colorScanner scanHexInt:&color]) return nil;
    CGFloat r = ((color & 0xFF0000) >> 16)/255.0f;
    CGFloat g = ((color & 0x00FF00) >> 8) /255.0f;
    CGFloat b =  (color & 0x0000FF) /255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end

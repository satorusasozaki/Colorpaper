//
//  UIImage+withColor.m
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/26/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import "UIImage+withColor.h"
// http://stackoverflow.com/questions/990976/how-to-create-a-colored-1x1-uiimage-on-the-iphone-dynamically

@implementation UIImage(withColor)
+ (UIImage *)imageWithColor:(UIColor *)color {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // https://gist.github.com/uknowho/5915365
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end

//
//  UIColor+Hex.h
//  Colorpaper
//
//  Created by Satoru Sasozaki on 12/23/15.
//  Copyright © 2015 Satoru Sasozaki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor*)colorWithHexString:(NSString *)hex;
+ (UIColor*)colorWithHexString:(NSString *)hex alpha:(CGFloat)a;
@end

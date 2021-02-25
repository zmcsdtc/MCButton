//
//  UIImage+Corner.m
//  MCCollectionCardView
//
//  Created by ZMC on 2021/1/17.
//

#import "UIImage+Corner.h"

@implementation UIImage (Corner)

-(UIImage*)mc_CutImageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size {
    CGRect rect = (CGRect){0.f,0.f,size};
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)mc_createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize{
    CGRect rect = CGRectMake(0.0f, 0.0f, imageSize.width, imageSize.height);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

@end

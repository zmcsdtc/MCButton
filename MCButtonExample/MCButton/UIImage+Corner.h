//
//  UIImage+Corner.h
//  MCCollectionCardView
//
//  Created by ZMC on 2021/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, GradientType) {
    GradientTypeTopToBottom = 0,//从上到下
    GradientTypeLeftToRight = 1,//从左到右
    GradientTypeUpleftToLowright = 2,//左上到右下
    GradientTypeUprightToLowleft = 3,//右上到左下
};

@interface UIImage (Corner)


-(UIImage*)mc_CutImageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size;

+ (UIImage *)mc_createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize;

+ (UIImage *)mc_gradientColorImageFromColors:(NSArray*)colors gradientType:(GradientType)gradientType imgSize:(CGSize)imgSize;

@end

NS_ASSUME_NONNULL_END

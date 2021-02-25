//
//  UIImage+Corner.h
//  MCCollectionCardView
//
//  Created by ZMC on 2021/1/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Corner)

-(UIImage*)mc_CutImageWithCornerRadius:(CGFloat)radius ofSize:(CGSize)size;
+ (UIImage *)mc_createImageWithColor:(UIColor *)color withSize:(CGSize)imageSize;

@end

NS_ASSUME_NONNULL_END

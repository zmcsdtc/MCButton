//
//  MCButton.h
//  MCButton
//
//  Created by ZMC on 2021/2/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, MCButtonLayoutStyle) {
    MCButtonLayoutNormal,
    MCButtonLayoutImageTop,
    MCButtonLayoutImageBottom,
    MCButtonLayoutImageLeft,
    MCButtonLayoutImageRight,
    MCButtonLayoutImageRightMargin,
    MCButtonLayoutImageLeftMargin,
};

typedef void(^ClickButtonBlock)(void);

@interface MCButton : UIView

@property (copy  ,nonatomic) NSString *title;
//默认15
@property (strong,nonatomic) UIFont*font;
//默认black
@property (strong,nonatomic) UIColor*titleColor;

@property (strong,nonatomic) UIImage*norImage;
@property (strong,nonatomic) UIImage*selImage;


//默认normal
@property (assign,nonatomic) MCButtonLayoutStyle layoutStyle;
@property (assign,nonatomic) CGFloat spacing;



- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title clickButtonBlock:(ClickButtonBlock)block;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image clickButtonBlock:(ClickButtonBlock)block;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title layoutStyle:(MCButtonLayoutStyle)layoutStyle spacing:(CGFloat)spacing clickButtonBlock:(ClickButtonBlock)block;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title layoutStyle:(MCButtonLayoutStyle)layoutStyle marginOffset:(CGFloat)marginOffset clickButtonBlock:(ClickButtonBlock)block;

- (void)addShadowLayerRadius:(CGFloat)radius color:(UIColor*)color corner:(CGFloat)corner;
- (void)addCornerRadius:(CGFloat)radius;
@end

NS_ASSUME_NONNULL_END

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
    MCButtonLayoutImageTopMargin,
    MCButtonLayoutImageBottomMargin,
};

typedef NS_ENUM(NSInteger, MCButtonShadowSide) {
    MCButtonShadowAllSide,
    MCButtonShadowTopSide,
    MCButtonShadowBottomSide,
    MCButtonShadowLeftSide,
    MCButtonShadowRightSide,
};

typedef void(^ClickButtonBlock)(void);

@interface MCButton : UIView

@property (copy  ,nonatomic) NSString *title;
//默认15
@property (strong,nonatomic) UIFont*font;
//默认black
@property (strong,nonatomic) UIColor*titleColor;
//默认白色
@property (strong,nonatomic) UIColor*norBackgroundColor;
@property (strong,nonatomic) UIColor*selectBackGroundColor;
@property (strong,nonatomic) UIImage*selectImage;

@property (assign,nonatomic) BOOL select;


//默认normal
@property (assign,nonatomic) MCButtonLayoutStyle layoutStyle;
//图片文字间距
@property (assign,nonatomic) CGFloat spacing;

- (instancetype)initWithFrame:(CGRect)frame title:(NSString*)title clickButtonBlock:(ClickButtonBlock)block;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image clickButtonBlock:(ClickButtonBlock)block;


/**
 spacing:文字和图片的间距
 */

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title layoutStyle:(MCButtonLayoutStyle)layoutStyle spacing:(CGFloat)spacing clickButtonBlock:(ClickButtonBlock)block;

/**
 marginOffset:内容距离左右两边的距离
 文字图片间距不固定
 */

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage*)image title:(NSString*)title layoutStyle:(MCButtonLayoutStyle)layoutStyle marginOffset:(CGFloat)marginOffset clickButtonBlock:(ClickButtonBlock)block;

/**
 radius:阴影的宽度
 corner:阴影的弧度
 side:阴影的方向
 */

- (void)addShadowLayerRadius:(CGFloat)radius color:(UIColor*)color corner:(CGFloat)corner shadowSide:(MCButtonShadowSide)side;

/**
 radius:弧度
 */
- (void)addCornerRadius:(CGFloat)radius;



/**
 设置渐变色
 startColor 初始色值
 endColor 结束色值
 startPoint,endPoint,当x相等,y不相等,方向是竖的;当y相等,x不相等,方向是横的;当x,y都不相等,则为斜线
 */

- (void)setGradientColors:(NSArray*)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;

@end

NS_ASSUME_NONNULL_END

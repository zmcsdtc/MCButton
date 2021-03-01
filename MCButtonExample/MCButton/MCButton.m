//
//  MCButton.m
//  MCButton
//
//  Created by ZMC on 2021/2/19.
//

#import "MCButton.h"
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"
#import "UIImage+Corner.h"

#import "UIImageView+WebCache.h"
@interface MCButton ()

@property (strong,nonatomic) UIButton*bgButton;
@property (strong,nonatomic) UILabel*titleLabel;
@property (strong,nonatomic) UIImageView*buttonImageView;

@property (copy,  nonatomic) ClickButtonBlock clickButtonBlock;

@property (assign,nonatomic) CGFloat marginOffset;
@property (strong,nonatomic) UIImage*norImage;

@end

@implementation MCButton

- (void)setupDefaultSet {
    self.titleColor = [UIColor blackColor];
    self.font = [UIFont systemFontOfSize:15];
    self.norBackgroundColor = [UIColor whiteColor];
    self.select = NO;
}


- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image clickButtonBlock:(ClickButtonBlock)block {
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultSet];
        self.buttonImageView.image = image;
        self.norImage = image;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title clickButtonBlock:(ClickButtonBlock)block {
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultSet];
        self.title = title;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(nonnull NSString *)title layoutStyle:(MCButtonLayoutStyle)layoutStyle spacing:(CGFloat)spacing clickButtonBlock:(nonnull ClickButtonBlock)block {

    if (self = [super initWithFrame:frame]) {
        [self setupDefaultSet];
        self.title = title;
        self.buttonImageView.image = image;
        self.norImage = image;
        self.layoutStyle = layoutStyle;
        self.spacing = spacing;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(nonnull NSString *)title layoutStyle:(MCButtonLayoutStyle)layoutStyle marginOffset:(CGFloat)marginOffset clickButtonBlock:(nonnull ClickButtonBlock)block {
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultSet];
        self.title = title;
        self.buttonImageView.image = image;
        self.norImage = image;
        self.layoutStyle = layoutStyle;
        self.marginOffset = marginOffset;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    NSDictionary *textfont;
    if (!self.font) {
        textfont = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    }
    else {
        textfont = @{NSFontAttributeName:self.font};
    }
    
    CGSize textSize = [self.titleLabel.text boundingRectWithSize:CGSizeMake( CGFLOAT_MAX,CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:textfont context:nil].size;
    
    
    
    CGFloat ImageTextmarginOffset = (self.frame.size.width - self.buttonImageView.image.size.width - self.spacing - textSize.width)/2.0;
    
    switch (self.layoutStyle) {
        case MCButtonLayoutNormal:
        {
            if ([self isBlankString:self.title]) {
                [self.buttonImageView makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.centerX.offset(0);
                }];
            }
            else {
                [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
                    make.centerY.centerX.offset(0);
                }];
            }
        }
            break;
        case MCButtonLayoutImageTop:
        {
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_centerY).offset(- self.spacing/2.0);
                make.centerX.offset(0);
            }];
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_centerY).offset(self.spacing/2.0);
                make.centerX.offset(0);
            }];
        }
            break;
        case MCButtonLayoutImageBottom:
        {
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.mas_centerY).offset(- self.spacing/2.0);
                make.centerX.offset(0);
            }];
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.mas_centerY).offset(self.spacing/2.0);
                make.centerX.offset(0);
            }];
        }
            break;
        case MCButtonLayoutImageLeft:
        {
            
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.left.offset(ImageTextmarginOffset);
                make.centerY.offset(0);
            }];
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-ImageTextmarginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
        case MCButtonLayoutImageRight:
        {
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.left.offset(ImageTextmarginOffset);
                make.centerY.offset(0);
            }];
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-ImageTextmarginOffset);
                make.centerY.offset(0);
            }];
            
        }
            break;
        case MCButtonLayoutImageRightMargin:
        {
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.left.offset(self.marginOffset);
                make.centerY.offset(0);
            }];
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-self.marginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
        case MCButtonLayoutImageLeftMargin:
        {
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.left.offset(self.marginOffset);
                make.centerY.offset(0);
            }];
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-self.marginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
        default:
            break;
    }
    [self layoutIfNeeded];
    NSLog(@"buttonImageView.frame = %@",NSStringFromCGRect(self.buttonImageView.frame));
}


- (void)click:(UIButton*)btn {
    if (self.clickButtonBlock) {
        self.clickButtonBlock();
    }
}

#pragma mark - setter

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}


- (void)setFont:(UIFont *)font {
    _font = font;
    self.titleLabel.font = font;
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}


- (void)setBackgroundColor:(UIColor *)backgroundColor {
    UIImage*bgImage = [UIImage mc_createImageWithColor:backgroundColor withSize:self.bgButton.bounds.size];
    [self.bgButton setImage:bgImage forState:0];
}


- (void)setNorBackgroundColor:(UIColor *)norBackgroundColor {
    _norBackgroundColor = norBackgroundColor;
    self.backgroundColor = norBackgroundColor;
}

-(void)setSpacing:(CGFloat)spacing{
    _spacing=spacing;
    [self layoutSubviews];
}

- (void)setLayoutStyle:(MCButtonLayoutStyle)layoutStyle {
    _layoutStyle = layoutStyle;
    [self layoutSubviews];
}

- (void)setSelect:(BOOL)select {
    _select = select;
    if (select) {
        //
        if (self.selectBackGroundColor) {
            self.backgroundColor = self.selectBackGroundColor;
        }
        if (self.selectImage) {
            self.buttonImageView.image = self.selectImage;
        }
        
    }
    else {
        if (self.norBackgroundColor) {
            self.backgroundColor = self.norBackgroundColor;
        }
        if (self.norImage) {
            self.buttonImageView.image = self.norImage;
        }
    }
}


#pragma mark - UI-Func

- (void)addShadowLayerRadius:(CGFloat)radius color:(UIColor*)color corner:(CGFloat)corner shadowSide:(MCButtonShadowSide)side{
    CALayer *layer = [CALayer layer];
    layer.name = @"shadow";
    layer.frame = self.bgButton.frame;
    layer.shadowOffset = CGSizeMake(0,0);
    layer.shadowColor = [color CGColor];
    layer.shadowOpacity = 0.8;
    layer.shadowRadius = radius;
    switch (side) {
        case MCButtonShadowAllSide:
        {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.bgButton.bounds.size.width, self.bgButton.bounds.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case MCButtonShadowTopSide:
        {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(radius/2.0, -radius, self.bgButton.bounds.size.width-radius, self.bgButton.bounds.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case MCButtonShadowBottomSide:
        {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(radius/2.0, radius, self.bgButton.bounds.size.width-radius, self.bgButton.bounds.size.height) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
            
        case MCButtonShadowLeftSide:
        {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-radius, radius/2.0, self.bgButton.bounds.size.width, self.bgButton.bounds.size.height-radius) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
        case MCButtonShadowRightSide:
        {
            layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(radius, radius/2.0, self.bgButton.bounds.size.width, self.bgButton.bounds.size.height-radius) byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(corner, corner)].CGPath;
        }
            break;
            
        default:
            break;
    }

    [self.layer insertSublayer:layer below:self.bgButton.layer];
}

- (void)addCornerRadius:(CGFloat)radius {
//    UIImage*cornerBgImage = [self.bgButton.currentImage mc_CutImageWithCornerRadius:radius ofSize:self.bgButton.bounds.size];
//    [self.bgButton setImage:cornerBgImage forState:0];
    self.bgButton.imageView.layer.cornerRadius = radius;

    self.bgButton.imageView.clipsToBounds = YES;
}




- (void)setGradientColors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIImage*bgImage;
    if (startPoint.x == endPoint.x&&endPoint.y > startPoint.x) {
        bgImage = [UIImage mc_gradientColorImageFromColors:colors gradientType:GradientTypeTopToBottom imgSize:self.bgButton.bounds.size];
    }
    else if (startPoint.x < endPoint.x&&startPoint.y == endPoint.y) {
        bgImage = [UIImage mc_gradientColorImageFromColors:colors gradientType:GradientTypeLeftToRight imgSize:self.bgButton.bounds.size];
    }
    
    else if (startPoint.x < endPoint.x && startPoint.y < endPoint.y) {
        bgImage = [UIImage mc_gradientColorImageFromColors:colors gradientType:GradientTypeUpleftToLowright imgSize:self.bgButton.bounds.size];
    }
    
    else {
        bgImage = [UIImage mc_gradientColorImageFromColors:colors gradientType:GradientTypeUprightToLowleft imgSize:self.bgButton.bounds.size];
    }
    
    [self.bgButton setImage:bgImage forState:0];
}


#pragma mark - net load



#pragma mark - lazy init

- (UIButton *)bgButton {
    if (!_bgButton) {
        _bgButton = [[UIButton alloc] init];
        [self addSubview:_bgButton];
        _bgButton.frame = self.bounds;
        
    }
    return _bgButton;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        [self.bgButton addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UIImageView *)buttonImageView {
    if (!_buttonImageView) {
        _buttonImageView = [[UIImageView alloc] init];
        _buttonImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.bgButton addSubview:_buttonImageView];
    }
    return _buttonImageView;
}

#pragma mark - Privacy func



- (BOOL)isBlankString:(NSString *)aStr {
    if (!aStr) {
        return YES;
    }
    if ([aStr isKindOfClass:[NSNull class]]) {
        return YES;
    }
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
    if (!trimmedStr.length) {
        return YES;
    }
    return NO;
}



@end

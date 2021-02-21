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


@interface MCButton ()

@property (strong,nonatomic) UIButton*bgButton;
@property (strong,nonatomic) UILabel*titleLabel;
@property (strong,nonatomic) UIImageView*buttonImageView;

@property (copy,  nonatomic) ClickButtonBlock clickButtonBlock;

@property (assign,nonatomic) CGFloat marginOffset;

@end

@implementation MCButton


- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupDefaultSet];
    }
    return self;
}

- (void)setupDefaultSet {
    self.titleColor = [UIColor blackColor];
    self.font = [UIFont systemFontOfSize:15];
    self.layoutStyle = MCButtonLayoutNormal;
}


- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image clickButtonBlock:(ClickButtonBlock)block {
    if (self == [super initWithFrame:frame]) {
        self.buttonImageView.image = image;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame title:(NSString *)title clickButtonBlock:(ClickButtonBlock)block {
    if (self == [super initWithFrame:frame]) {
        self.title = title;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(nonnull NSString *)title layoutStyle:(MCButtonLayoutStyle)layoutStyle spacing:(CGFloat)spacing clickButtonBlock:(nonnull ClickButtonBlock)block {
    if (self == [super initWithFrame:frame]) {
        self.title = title;
        self.buttonImageView.image = image;
        self.layoutStyle = layoutStyle;
        self.spacing = spacing;
        [self.bgButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        self.clickButtonBlock = block;
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image title:(nonnull NSString *)title layoutStyle:(MCButtonLayoutStyle)layoutStyle marginOffset:(CGFloat)marginOffset clickButtonBlock:(nonnull ClickButtonBlock)block {
    if (self == [super initWithFrame:frame]) {
        self.title = title;
        self.buttonImageView.image = image;
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
    
    CGFloat marginOffset = (self.frame.size.width - self.buttonImageView.image.size.width - self.spacing - textSize.width)/2.0;
    
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
                make.left.offset(marginOffset);
                make.centerY.offset(0);
            }];
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-marginOffset);
                make.centerY.offset(0);
            }];
        }
            break;
        case MCButtonLayoutImageRight:
        {
            [self.titleLabel updateConstraints:^(MASConstraintMaker *make) {
                make.left.offset(marginOffset);
                make.centerY.offset(0);
            }];
            [self.buttonImageView updateConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-marginOffset);
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
}


- (void)click:(UIButton*)btn {
    
    //如果有设置selImage或者selBgcolor
    
    
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

- (void)setNorImage:(UIImage *)norImage {
    _norImage = norImage;
    if (self.bgButton.state == UIControlStateNormal) {
        self.buttonImageView.image = norImage;
    }
}

- (void)setSelImage:(UIImage *)selImage {
    _selImage = selImage;
    if (self.bgButton.state == UIControlStateSelected) {
        self.buttonImageView.image = selImage;
    }
}

- (void)setBackgroundColor:(UIColor *)backgroundColor {
    self.bgButton.backgroundColor = backgroundColor;
}

-(void)setSpacing:(CGFloat)spacing{
    _spacing=spacing;
    [self layoutSubviews];
}

- (void)setLayoutStyle:(MCButtonLayoutStyle)layoutStyle {
    _layoutStyle = layoutStyle;
    [self layoutSubviews];
}

#pragma mark - lazy init

- (UIButton *)bgButton {
    if (!_bgButton) {
        _bgButton = [[UIButton alloc] init];
        [self addSubview:_bgButton];
        [_bgButton makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.offset(0);
        }];
        
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

//
//  SingleCheckBox.m
//  PageTableView
//
//  Created by tian on 14-6-12.
//  Copyright (c) 2014年 tian. All rights reserved.
//

#import "SingleCheckBox.h"


#define kSpace 2
@interface SingleCheckBox ()

@property (nonatomic) UIButton *singleButton;
@property (nonatomic) UILabel *singleLabel;
@property (nonatomic,copy) State block_on;
@end

@implementation SingleCheckBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.on = NO;
        self.image_Off = [self buttonImageFromColor:[UIColor colorWithWhite:0.85 alpha:1]];
        self.image_On = [self buttonImageFromColor:[UIColor redColor]];
        [self createSingleView];
    }
    return self;
}


- (void)createSingleView{
    
    _singleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _singleButton.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    [_singleButton setImage:_image_On forState:UIControlStateSelected];
    [_singleButton setImage:_image_Off forState:UIControlStateNormal];
    _singleButton.selected = self.on;
    [_singleButton addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_singleButton];
    
    _singleLabel = [[UILabel alloc]initWithFrame:CGRectMake(_singleButton.frame.size.width+kSpace, 0, self.frame.size.width-_singleButton.frame.size.width-kSpace, self.frame.size.height)];
    _singleLabel.textAlignment = NSTextAlignmentLeft;
    _singleLabel.backgroundColor = [UIColor clearColor];
    _singleLabel.textColor = [UIColor colorWithWhite:0.5 alpha:1];
    _singleLabel.font = [UIFont systemFontOfSize:12.0];
    _singleLabel.text = self.text;
    _singleLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_singleLabel];
}
#pragma mark- 触发方法
- (void)clickAction:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    //Block
    if (self.block_on) {
        self.block_on(sender.selected);
    }
    //Delegate
    if ([self.delegate respondsToSelector:@selector(checkBoxState:)]) {
        [self.delegate checkBoxState:sender.selected];
    }
    
}
#pragma mark- block回调方法
- (void)state:(State)on{
    self.block_on = on;
}
- (void)setOn:(BOOL)on{
    
    if (_on != on) {
        
        self.singleButton.selected = on;
        _on = on;

    }
    
}
- (void)setImage_Off:(UIImage *)image_Off{
    if (_image_Off != image_Off) {
        
        if (self.singleButton) {
            [self.singleButton setImage:image_Off forState:UIControlStateNormal];
//            [self.singleButton setImage:self.image_On forState:UIControlStateSelected];
//            self.singleButton.selected = self.on;
            //            [checkbox setImage:[UIImage imageNamed:@"login_single_off"] forState:UIControlStateNormal];
            //            [checkbox setImage:[UIImage imageNamed:@"login_single_on"] forState:UIControlStateSelected];
            
        }
        
        _image_Off = image_Off;
    }
}

- (void)setImage_On:(UIImage *)image_On{
    if (_image_On != image_On) {
        if (self.singleButton) {
//            [self.singleButton setImage:self.image_Off forState:UIControlStateNormal];
            [self.singleButton setImage:image_On forState:UIControlStateSelected];
//            self.singleButton.selected = self.on;
        }
        _image_On = image_On;
    }
}
- (void)setText:(NSString *)text{
    if (_text != text) {
        
        if (self.singleLabel) {
            self.singleLabel.text = text;
        }
        _text = text;
    }
}

- (void)setAdjustsFontSizeToFitWidth:(BOOL)adjustsFontSizeToFitWidth{

    if (_adjustsFontSizeToFitWidth != adjustsFontSizeToFitWidth) {
        
        _singleLabel.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth;
        _adjustsFontSizeToFitWidth =adjustsFontSizeToFitWidth;
        
    }
    
}

- (void)setFont:(UIFont *)font{
    if (_font != font) {
        _singleLabel.font = font;
        _font = font;
//        [self layoutSubviews];
    }
}

- (UIImage *)buttonImageFromColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

//
//  SingleCheckBox.h
//  PageTableView
//
//  Created by tian on 14-6-12.
//  Copyright (c) 2014年 tian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckBoxDelegate <NSObject>

@optional
- (void)checkBoxState:(BOOL)on;

@end

@interface SingleCheckBox : UIView

typedef void(^State)(BOOL on);

@property (nonatomic,assign) id<CheckBoxDelegate> delegate;
@property (nonatomic,copy) NSString *text;
@property (nonatomic) UIImage *image_On;
@property (nonatomic) UIImage *image_Off;
@property (nonatomic) BOOL on;
@property (nonatomic) UIFont *font;
@property (nonatomic) BOOL adjustsFontSizeToFitWidth;
- (void)state:(State)on;

@end

//
//  UIToolbar+IconFont.h
//  DemoCollection
//
//  Created by VcaiTech on 16/3/22.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "IconFontToolBar.h"

@interface ICFontButtonConfig : NSObject

-(instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)tiFont iconFontName:(NSString *)iFontName iconCode:(NSString *)iCode iconFontSize:(CGFloat)iSize buttonSelector:(SEL)selector sender:(id)sender;

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)UIFont *tiFont;
@property(nonatomic,strong)NSString *fontName;
@property(nonatomic,strong)NSString *iconCode;
@property(nonatomic,assign)CGFloat  fontSize;
@property(nonatomic,assign)SEL selector;
@property(nonatomic,assign)id target;


@end

@interface ICFontButton : UIButton
@property(readonly,nonatomic,strong)UIColor *normaleColor;
@property(readonly,nonatomic,strong)UIColor *selecteColor;
@property(nonatomic,strong)UILabel *iconLabel;
@property(nonatomic,strong)UILabel *textLabel;
-(void)setTextFont:(UIFont *)font iconFontName:(NSString *)fontName iconFontSize:(CGFloat)fontSize;
-(void)setNormalColor:(UIColor *)nColor andSelectedColor:(UIColor *)scolor;
-(void)setTitleText:(NSString *)tiText andIconCode:(NSString *)iconCode;

@end

@interface IconFontToolBar (IconFont)

-(void)setIconFontItems:(NSArray<ICFontButtonConfig *> *)items;
-(void)setSelectedItem:(NSInteger)itemIndex;


@end

//
//  UIToolbar+IconFont.m
//  DemoCollection
//
//  Created by VcaiTech on 16/3/22.
//  Copyright © 2016年 Tang guifu. All rights reserved.
//

#import "IconFontToolBar+IconFont.h"

#define DEFAULTITEMCOLOR [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1]
#define DEFAULTITEMSELCOLOR  [UIColor colorWithRed:172/255.0 green:0/255.0 blue:59/255.0 alpha:1]
#define BASEOFFSETINDEX 900910

@implementation IconFontToolBar (IconFont)

-(void)setSelectedItem:(NSInteger)itemIndex{
    
    if (itemIndex > self.numberOfItems) {
        itemIndex = itemIndex - BASEOFFSETINDEX;
    }
    
    for (int i = 0 ; i<self.numberOfItems; i++) {
        ICFontButton *button = (ICFontButton *)[self viewWithTag:i+BASEOFFSETINDEX];
        if (button) {
            i==itemIndex?[button setSelected:YES]:[button setSelected:NO];
        }
    }
    
}


-(void)setIconFontItems:(NSArray<ICFontButtonConfig *> *)items{
    
    assert( items.count < 6);
    @autoreleasepool {
        self.numberOfItems = items.count;
        NSInteger bsize  = llrint(self.frame.size.width/items.count);
        
        BOOL shouldDivCount = (items.count%2 != 0);
        
        CGSize itemSize = CGSizeMake(bsize, self.frame.size.height);
        
        NSMutableArray *muItems = [NSMutableArray arrayWithCapacity:items.count];
        NSInteger tagNum = 0;
        CGFloat offsetX = 0;
        for (ICFontButtonConfig *itemConfig in items) {
            
            CGFloat itWidth = itemSize.width;
            if (shouldDivCount) {
                if (tagNum == items.count/2) {
                    itWidth = self.frame.size.width-(itWidth*(items.count-1));
                }
            }
            ICFontButton *button = [ICFontButton buttonWithType:UIButtonTypeCustom];
            [button setFrame:CGRectMake(offsetX, 0, itWidth, itemSize.height)];
            [button setTextFont:itemConfig.tiFont iconFontName:itemConfig.fontName iconFontSize:itemConfig.fontSize];
            [button setTitleText:itemConfig.title andIconCode:itemConfig.iconCode];
            [button addTarget:itemConfig.target action:itemConfig.selector forControlEvents:UIControlEventTouchUpInside];
            button.tag =tagNum+BASEOFFSETINDEX;
            UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
            [muItems addObject:item];
            tagNum++;
            offsetX+=itWidth;
            [self addSubview:button];
        }
    }
}

@end

@implementation ICFontButtonConfig

-(instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)tiFont iconFontName:(NSString *)iFontName iconCode:(NSString *)iCode iconFontSize:(CGFloat)iSize buttonSelector:(SEL)selector sender:(id)sender{
    self = [super init];
    if (self) {
        self.title = title;
        self.tiFont = tiFont;
        self.fontName = iFontName;
        self.iconCode = iCode;
        self.fontSize = iSize;
        self.selector = selector;
        self.target = sender;
    }
    return self;
}

@end

@implementation ICFontButton

+(instancetype)buttonWithType:(UIButtonType)buttonType{
    
    if (buttonType != UIButtonTypeCustom) {
        
        buttonType = UIButtonTypeCustom;
        
    }
    
    return [super buttonWithType:buttonType];
}

-(void)setTitleText:(NSString *)tiText andIconCode:(NSString *)iconCode{
    
    [_iconLabel setText:iconCode];
    
    [_textLabel setText:tiText];
    
}

-(void)setFrame:(CGRect)frame{
    
    [super setFrame:frame];
    
    _iconLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height*0.1, frame.size.width, frame.size.height*0.6)];
    
    _iconLabel.backgroundColor =[UIColor clearColor];
    
    _iconLabel.textColor = _normaleColor?_normaleColor:DEFAULTITEMCOLOR;
    
    _iconLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_iconLabel];
    
    _textLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height*0.7, frame.size.width, frame.size.height*0.2)];
    
    _textLabel.backgroundColor =[UIColor clearColor];
    
    _textLabel.textColor = _iconLabel.textColor;
    
    _textLabel.textAlignment = NSTextAlignmentCenter;
    
    [self addSubview:_textLabel];
    
}

-(void)setTextFont:(UIFont *)font iconFontName:(NSString *)fontName iconFontSize:(CGFloat)fontSize{
    [_iconLabel setFont:[UIFont fontWithName:fontName size:fontSize]];
    [_textLabel setFont:font];
}

-(void)setNormalColor:(UIColor *)nColor andSelectedColor:(UIColor *)scolor{
    
    _selecteColor = [scolor copy];
    _normaleColor = [nColor copy];

}

-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected) {
        [_iconLabel setTextColor:_selecteColor?_selecteColor:DEFAULTITEMSELCOLOR];
        [_textLabel setTextColor:_iconLabel.textColor];
    }else{
        [_iconLabel setTextColor:_normaleColor?_normaleColor:DEFAULTITEMCOLOR];
        [_textLabel setTextColor:_iconLabel.textColor];
    }
}
@end



//
// Copyright (c) 2013 Robert Wijas. All rights reserved.
//

#import "UILabel+UISS.h"

NSString *const UISSTextAttributeHighlightedTextColor = @"UISSTextAttributeHighlightedTextColor";

@implementation UILabel (UISS)

- (void)setTextAttributes:(NSDictionary *)textAttributes;
{
    UIFont *font = [textAttributes objectForKey:NSFontAttributeName];
    if (font != nil && self.font != font) {
        self.font = font;
    }
    UIColor *textColor = [textAttributes objectForKey:NSForegroundColorAttributeName];
    if (textColor != nil && self.textColor != textColor) {
        self.textColor = textColor;
    }
    UIColor *textShadowColor = [textAttributes objectForKey:UITextAttributeTextShadowColor];
    if (textShadowColor != nil && self.shadowColor != textShadowColor) {
        self.shadowColor = textShadowColor;
    }
    NSValue *shadowOffsetValue = [textAttributes objectForKey:UITextAttributeTextShadowOffset];
    if (shadowOffsetValue) {
        UIOffset shadowOffset = [shadowOffsetValue UIOffsetValue];
        if (!UIOffsetEqualToOffset(shadowOffset, UIOffsetMake(self.shadowOffset.height, self.shadowOffset.width))) {
            self.shadowOffset = CGSizeMake(shadowOffset.horizontal, shadowOffset.vertical);
        }
    }
    UIColor *highlightedTextColor = [textAttributes objectForKey:UISSTextAttributeHighlightedTextColor];
    if (highlightedTextColor != nil && highlightedTextColor != self.highlightedTextColor) {
        self.highlightedTextColor = highlightedTextColor;
    }
}

@end

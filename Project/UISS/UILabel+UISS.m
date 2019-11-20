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
    NSShadow *textShadow = [textAttributes objectForKey:NSShadowAttributeName];
    if (textShadow != nil) {
        if (self.shadowColor != textShadow.shadowColor) {
            self.shadowColor = textShadow.shadowColor;
        }
        CGSize shadowOffset = textShadow.shadowOffset;
        if (!CGSizeEqualToSize(self.shadowOffset, shadowOffset)) {
            self.shadowOffset = textShadow.shadowOffset;
        }
    }
    UIColor *highlightedTextColor = [textAttributes objectForKey:UISSTextAttributeHighlightedTextColor];
    if (highlightedTextColor != nil && highlightedTextColor != self.highlightedTextColor) {
        self.highlightedTextColor = highlightedTextColor;
    }
}

@end

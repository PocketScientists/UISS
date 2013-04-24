//
// Copyright (c) 2013 Robert Wijas. All rights reserved.
//

#import <UIKit/UIKit.h>

UIKIT_EXTERN NSString *const UISSTextAttributeHighlightedTextColor;

@interface UILabel (UISS)

- (void)setTextAttributes:(NSDictionary *)textAttributes UI_APPEARANCE_SELECTOR;

@end

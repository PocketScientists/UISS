//
// Copyright (c) 2013 Robert Wijas. All rights reserved.
//

#import "UISSTextAttributesValueConverter.h"
#import "UISSFontValueConverter.h"
#import "UISSColorValueConverter.h"
#import "UISSSizeValueConverter.h"
#import "UISSArgument.h"

@interface UISSTextAttributesValueConverter ()

@property(nonatomic, strong) UISSFontValueConverter *fontConverter;
@property(nonatomic, strong) UISSColorValueConverter *colorConverter;
@property(nonatomic, strong) UISSSizeValueConverter *sizeConverter;

@end

@implementation UISSTextAttributesValueConverter

- (id)init
{
    self = [super init];
    if (self) {
        self.fontConverter = [[UISSFontValueConverter alloc] init];
        self.colorConverter = [[UISSColorValueConverter alloc] init];
        self.sizeConverter = [[UISSSizeValueConverter alloc] init];
    }
    return self;
}

- (BOOL)canConvertValueForArgument:(UISSArgument *)argument
{
    return [argument.type hasPrefix:@"@"] && [[argument.name lowercaseString] hasSuffix:@"textattributes"] && [argument.value isKindOfClass:[NSDictionary class]];
}

- (void)convertProperty:(NSString *)propertyName fromDictionary:(NSDictionary *)dictionary
           toDictionary:(NSMutableDictionary *)converterDictionary withKey:(NSString *)key
         usingConverter:(id<UISSArgumentValueConverter>)converter;
{
    id value = [dictionary objectForKey:propertyName];
    if (value) {
        id converted = [converter convertValue:value];
        if (converted) {
            [converterDictionary setObject:converted forKey:key];
        }
    }
}

- (id)convertValue:(id)value;
{
    if ([value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = (NSDictionary *) value;

        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        [self convertProperty:UISS_FONT_KEY fromDictionary:dictionary toDictionary:attributes withKey:NSFontAttributeName
               usingConverter:self.fontConverter];

        [self convertProperty:UISS_TEXT_COLOR_KEY fromDictionary:dictionary toDictionary:attributes withKey:NSForegroundColorAttributeName
               usingConverter:self.colorConverter];
        
        [self convertProperty:UISS_HIGHLIGHTED_TEXT_COLOR_KEY fromDictionary:dictionary toDictionary:attributes withKey:@"UISSTextAttributeHighlightedTextColor"
               usingConverter:self.colorConverter];

        id shadowColor = [dictionary objectForKey:UISS_TEXT_SHADOW_COLOR_KEY];
        id convertedShadowColor = nil;
        if (shadowColor) {
            convertedShadowColor = [self.colorConverter convertValue:shadowColor];
        }

        id shadowOffset = [dictionary objectForKey:UISS_TEXT_SHADOW_OFFSET_KEY];
        id convertedShadowOffset = nil;
        if (shadowOffset) {
            convertedShadowOffset = [self.sizeConverter convertValue:shadowOffset];
        }

        if (convertedShadowColor || convertedShadowOffset) {
            NSShadow *shadow = [[NSShadow alloc] init];
            shadow.shadowColor = convertedShadowColor;
            shadow.shadowOffset = ((NSValue *)convertedShadowOffset).CGSizeValue;
            [attributes setObject:shadow forKey:NSShadowAttributeName];
        }

        if (attributes.count) {
            return attributes;
        }
    }

    return nil;
}

- (NSString *)generateCodeForValue:(id)value
{
    if ([value isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dictionary = (NSDictionary *) value;

        NSMutableString *objectAndKeys = [NSMutableString string];

        id fontValue = [dictionary objectForKey:UISS_FONT_KEY];
        if (fontValue) {
            [objectAndKeys appendFormat:@"%@, %@,", [self.fontConverter generateCodeForValue:fontValue], @"UITextAttributeFont"];
        }

        id textColorValue = [dictionary objectForKey:UISS_TEXT_COLOR_KEY];
        if (textColorValue) {
            [objectAndKeys appendFormat:@"%@, %@,", [self.colorConverter generateCodeForValue:textColorValue], @"UITextAttributeTextColor"];
        }
        
        id highlightedTextColorValue = [dictionary objectForKey:UISS_HIGHLIGHTED_TEXT_COLOR_KEY];
        if (highlightedTextColorValue) {
            [objectAndKeys appendFormat:@"%@, %@,", [self.colorConverter generateCodeForValue:highlightedTextColorValue], @"UISSTextAttributeHighlightedTextColor"];
        }

        id textShadowColor = [dictionary objectForKey:UISS_TEXT_SHADOW_COLOR_KEY];
        if (textShadowColor) {
            [objectAndKeys appendFormat:@"%@, %@,", [self.colorConverter generateCodeForValue:textShadowColor], @"UITextAttributeTextShadowColor"];
        }

        id textShadowOffset = [dictionary objectForKey:UISS_TEXT_SHADOW_OFFSET_KEY];
        if (textShadowOffset) {
            [objectAndKeys appendFormat:@"[NSValue valueWithCGSize:%@], %@,", [self.sizeConverter generateCodeForValue:textShadowOffset], @"UITextAttributeTextShadowOffset"];
        }

        if (objectAndKeys.length) {
            return [NSString stringWithFormat:@"[NSDictionary dictionaryWithObjectsAndKeys:%@ nil]", objectAndKeys];
        }
    }
    
    return nil;
}

@end

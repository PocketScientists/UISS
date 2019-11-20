//
//  UISSContentModeValueConverter.m
//  UISS
//
//  Created by Philip Messlehner on 21.05.13.
//  Copyright (c) 2013 57things. All rights reserved.
//

#import "UISSContentModeValueConverter.h"
#import <UIKit/UIKit.h>

@implementation UISSContentModeValueConverter

- (id)init {
    self = [super init];
    if (self) {
        self.stringToValueDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithInteger:UIViewContentModeScaleToFill], @"fill",
                                        [NSNumber numberWithInteger:UIViewContentModeScaleAspectFit], @"aspectFit",
                                        [NSNumber numberWithInteger:UIViewContentModeScaleAspectFill], @"aspectFill",
                                        [NSNumber numberWithInteger:UIViewContentModeRedraw], @"redraw",
                                        [NSNumber numberWithInteger:UIViewContentModeCenter], @"center",
                                        [NSNumber numberWithInteger:UIViewContentModeTop], @"top",
                                        [NSNumber numberWithInteger:UIViewContentModeBottom], @"bottom",
                                        [NSNumber numberWithInteger:UIViewContentModeLeft], @"left",
                                        [NSNumber numberWithInteger:UIViewContentModeRight], @"right",
                                        [NSNumber numberWithInteger:UIViewContentModeTopLeft], @"topLeft",
                                        [NSNumber numberWithInteger:UIViewContentModeTopRight], @"topRight",
                                        [NSNumber numberWithInteger:UIViewContentModeBottomLeft], @"bottomLeft",
                                        [NSNumber numberWithInteger:UIViewContentModeBottomRight], @"bottomRight",
                                        nil];
        self.stringToCodeDictionary= [NSDictionary dictionaryWithObjectsAndKeys:
                                      @"UIViewContentModeScaleToFill", @"fill",
                                      @"UIViewContentModeScaleAspectFit", @"aspectFit",
                                      @"UIViewContentModeScaleAspectFill", @"aspectFill",
                                      @"UIViewContentModeRedraw", @"redraw",
                                      @"UIViewContentModeCenter", @"center",
                                      @"UIViewContentModeTop", @"top",
                                      @"UIViewContentModeBottom", @"bottom",
                                      @"UIViewContentModeLeft", @"left",
                                      @"UIViewContentModeRight", @"right",
                                      @"UIViewContentModeTopLeft", @"topLeft",
                                      @"UIViewContentModeTopRight", @"topRight",
                                      @"UIViewContentModeBottomLeft", @"bottomLeft",
                                      @"UIViewContentModeBottomRight", @"bottomRight",
                                      nil];
    }
    return self;
}

- (NSString *)propertyNameSuffix {
    return @"contentMode";
}

@end

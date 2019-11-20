//
// Copyright (c) 2013 Robert Wijas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol UISSDictionaryPreprocessor <NSObject>

- (NSDictionary *)preprocess:(NSDictionary *)dictionary userInterfaceIdiom:(UIUserInterfaceIdiom)userInterfaceIdiom;

@end

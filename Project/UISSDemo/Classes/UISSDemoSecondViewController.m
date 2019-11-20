//
// Copyright (c) 2013 Robert Wijas. All rights reserved.
//

#import "UISSDemoSecondViewController.h"

@implementation UISSDemoSecondViewController

- (BOOL)shouldAutorotate
{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    }
    return UIInterfaceOrientationMaskAll;
}

@end

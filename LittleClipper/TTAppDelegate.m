//
//  TTAppDelegate.m
//  LittleClipper
//
//  Created by Tom Taylor on 11/12/2012.
//  Copyright (c) 2012 Tom Taylor. All rights reserved.
//

#import "TTAppDelegate.h"
#import "TTPasteboardManager.h"
#import "TTStringPrintFormatter.h"

@implementation TTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Register supported objects and their associated print formatter classes
    [[TTPasteboardManager sharedManager] registerContentClass:[NSString class]
                                               printFormatter:[TTStringPrintFormatter class]];
    
    
}

@end

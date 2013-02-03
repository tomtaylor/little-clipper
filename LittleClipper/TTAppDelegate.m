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
#import "TTDeliveryManager.h"

@implementation TTAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    TTPasteboardManager *pasteboardManager = [TTPasteboardManager sharedManager];

    // Register supported objects class and their associated print formatter classes.
    // For now there's only a simple NSString formatter.
    [pasteboardManager registerContentClass:[NSString class]
                             printFormatter:[TTStringPrintFormatter class]];
    
    
    if ([pasteboardManager canGenerateHTML]) {
        NSString *html = [pasteboardManager generateHTML];
        
        NSLog(@"Printing: %@", html);
        
        // You need to put your own Direct Print Code in here, for now.
        if (html) {
            TTDeliveryManager *deliveryManager = [[TTDeliveryManager alloc] initWithDirectPrintCode:@""];
            [deliveryManager sendHTML:html];            
        }
    }
}

@end

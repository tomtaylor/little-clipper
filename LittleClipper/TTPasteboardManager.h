//
//  TTPasteboardManager.h
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTPasteboardManager : NSObject {
    NSMutableDictionary *registeredPrintFormatters;
    NSPasteboard *pasteboard;
}

+ (TTPasteboardManager *)sharedManager;

- (BOOL)printPasteboard;
- (BOOL)canPrintPasteboard;

- (void)registerContentClass:(Class)contentClass
              printFormatter:(Class)printFormatterClass;

@end

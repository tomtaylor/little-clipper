//
//  TTPasteboardManager.h
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TTDeliveryManager;

@interface TTPasteboardManager : NSObject {
    NSMutableArray *registeredPrintFormatters;
    NSPasteboard *pasteboard;
    TTDeliveryManager *deliveryManager;
}

+ (TTPasteboardManager *)sharedManager;

- (NSString *)generateHTML;
- (BOOL)canGenerateHTML;

- (void)registerContentClass:(Class)contentClass
              printFormatter:(Class)printFormatterClass;

@end

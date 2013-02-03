//
//  TTPasteboardManager.m
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import "TTPasteboardManager.h"

@implementation TTPasteboardManager

+ (TTPasteboardManager *)sharedManager
{
    static TTPasteboardManager *sharedPasteboardManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedPasteboardManagerInstance = [[self alloc] init];
    });
    return sharedPasteboardManagerInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        registeredPrintFormatters = [[NSMutableDictionary alloc] init];
        pasteboard = [NSPasteboard generalPasteboard];
    }
    return self;
}

// Attempts to print the pasteboard, if a supported object is present
- (BOOL)printPasteboard {
    if (![self canPrintPasteboard]) {
        return NO;
    }
    
    NSArray *objects = [pasteboard readObjectsForClasses:[self registeredObjectClasses] options:nil];
    
    id object = [objects objectAtIndex:0];
    id printFormatter = [registeredPrintFormatters objectForKey:[object class]];
}

// Checks whether the pasteboard contains any printable objects
- (BOOL)canPrintPasteboard {
    return [pasteboard canReadObjectForClasses:[self registeredObjectClasses] options:nil];
}

- (void)registerContentClass:(Class)contentClass
              printFormatter:(Class)printFormatterClass
{
    // We perform explicit type conversion to store a Class as the dictionary key.
    // http://stackoverflow.com/questions/12525324/unable-to-use-class-as-a-key-in-nsdictionary-with-xcode-4-5/12525479#12525479
    [registeredPrintFormatters setObject:printFormatterClass forKey:(id <NSCopying>)contentClass];
}

#pragma mark Private methods

- (NSArray *)registeredObjectClasses {
    return [registeredPrintFormatters allKeys];
}

@end

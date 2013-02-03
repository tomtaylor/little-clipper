//
//  TTPasteboardManager.m
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import "TTPasteboardManager.h"
#import "TTPrintFormatterProtocol.h"

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
        registeredPrintFormatters = [[NSMutableArray alloc] init];
        pasteboard = [NSPasteboard generalPasteboard];
    }
    return self;
}

// Attempts to print the pasteboard, if a supported object is present
- (NSString *)generateHTML {
    if (![self canGenerateHTML]) {
        return nil;
    }
    
    NSArray *objects = [pasteboard readObjectsForClasses:[self registeredObjectClasses] options:nil];
    
    id object = [objects objectAtIndex:0];
    if (object) {
        Class printFormatterClass = [self registeredPrintFormatterClassForContentObject:object];
        id<TTPrintFormatterProtocol> printFormatter = [[printFormatterClass alloc] init];
        return [printFormatter generateHTML:object];
    } else {
        return nil;
    }
}

// Checks whether the pasteboard contains any printable objects
- (BOOL)canGenerateHTML {
    return [pasteboard canReadObjectForClasses:[self registeredObjectClasses] options:nil];
}

// Registered a print formatter class for a class of object on the pasteboard
- (void)registerContentClass:(Class)contentClass
              printFormatter:(Class)printFormatterClass
{
    [registeredPrintFormatters addObject:@[contentClass, printFormatterClass]];
}

// Retrieve the printFormatterClass for an object on the pasteboard
- (Class)registeredPrintFormatterClassForContentObject:(id)object {
    __block Class printFormatterClass = nil;
    
    [registeredPrintFormatters enumerateObjectsUsingBlock:^(NSArray *classPair, NSUInteger idx, BOOL *stop) {
        Class contentClass = [classPair objectAtIndex:0];
        if ([object isKindOfClass:contentClass]) {
            printFormatterClass = [classPair objectAtIndex:1];
            stop = YES;
        }
    }];
    
    return printFormatterClass;
}

#pragma mark Private methods

- (NSArray *)registeredObjectClasses {
    NSMutableArray *registeredContentClasses = [[NSMutableArray alloc] initWithCapacity:registeredPrintFormatters.count];
    
    [registeredPrintFormatters enumerateObjectsUsingBlock:^(NSArray *classPair, NSUInteger idx, BOOL *stop) {
        [registeredContentClasses addObject:[classPair objectAtIndex:0]];
    }];
    
    return registeredContentClasses;
}

@end

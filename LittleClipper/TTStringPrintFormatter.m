//
//  TTStringPrintFormatter.m
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import "TTStringPrintFormatter.h"

@implementation TTStringPrintFormatter

- (id)initWithPasteboardObject:(NSString *)_string
{
    self = [super init];
    if (self) {
        string = _string;
    }
    return self;
}

- (NSString *)generateHTML
{
    NSUInteger length = [string length];
    NSUInteger paraStart = 0, paraEnd = 0, contentsEnd = 0;
    NSMutableArray *paragraphs = [NSMutableArray array];
    NSRange currentRange;
    while (paraEnd < length) {
        [string getParagraphStart:&paraStart end:&paraEnd
                      contentsEnd:&contentsEnd forRange:NSMakeRange(paraEnd, 0)];
        currentRange = NSMakeRange(paraStart, contentsEnd - paraStart);
        [paragraphs addObject:[string substringWithRange:currentRange]];
    }
    
    __block NSMutableString *html = [NSMutableString stringWithString:@"<html><body>"];
    [paragraphs enumerateObjectsUsingBlock:^(NSString *paragraph, NSUInteger idx, BOOL *stop) {
        [html appendString:[NSString stringWithFormat:@"<p>%@</p>", paragraph]];
    }];
    
    [html appendString:@"</body></html>"];
    return html;
}

@end

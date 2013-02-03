//
//  TTPrintFormatterProtocol.h
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTPrintFormatterProtocol <NSObject>

- (NSString *)generateHTML:(id)object;

@end

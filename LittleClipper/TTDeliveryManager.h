//
//  TTDeliveryManager.h
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPClient;

@interface TTDeliveryManager : NSObject {
    NSString *directPrintCode;
    AFHTTPClient *httpClient;
}

- (id)initWithDirectPrintCode:(NSString *)_directPrintCode;

- (void)sendHTML:(NSString *)html;

@end

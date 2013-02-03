//
//  TTDeliveryManager.m
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import "TTDeliveryManager.h"

@implementation TTDeliveryManager

- (id)initWithDirectPrintCode:(NSString *)_directPrintCode
{
    self = [super init];
    if (self) {
        directPrintCode = _directPrintCode;
    }
    return self;
}

- (void)sendHTML:(NSString *)html success:^(void) failure:^(void)
{
    
}

@end

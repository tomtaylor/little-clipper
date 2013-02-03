//
//  TTDeliveryManager.m
//  LittleClipper
//
//  Created by Tom Taylor on 03/02/2013.
//  Copyright (c) 2013 Tom Taylor. All rights reserved.
//

#import "TTDeliveryManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation TTDeliveryManager

- (id)initWithDirectPrintCode:(NSString *)_directPrintCode
{
    self = [super init];
    if (self) {
        directPrintCode = _directPrintCode;
        httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://remote.bergcloud.com/playground/direct_print/"]];
        [httpClient setParameterEncoding:AFJSONParameterEncoding];
    }
    return self;
}

- (void)sendHTML:(NSString *)html
{
    NSMutableURLRequest *request = [httpClient requestWithMethod:@"POST"
                                                            path:directPrintCode
                                                      parameters:@{@"html": html}];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                                                        success:nil
                                                                                        failure:nil];
    
    [operation start];
}

@end

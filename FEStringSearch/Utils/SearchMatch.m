//
//  SearchMatch.m
//  FEStringSearch
//
//  Created by keso on 16/6/8.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "SearchMatch.h"

@implementation SearchMatch

+(BOOL)simpleMatchPattern:(NSString *)text pattern:(NSString *)pattern{
    NSInteger cnlen=text.length;
    NSInteger ptlen=pattern.length;
    for (NSInteger i=0; i<=cnlen-ptlen; i++) {
        NSInteger j;
        for (j=0; j<ptlen; j++) {
            unichar tChar=[text characterAtIndex:i+j];
            unichar pChar=[pattern characterAtIndex:j];
            if (tChar!=pChar) {
                break;
            }
        }
        if (j==ptlen) {
            return YES;
        }
    }
    return NO;
}

+(NSInteger)simpleBackMatchPattern:(NSString *)text pattern:(NSString *)pattern{
    NSInteger i,j;
    NSInteger cnlen=text.length;
    NSInteger ptlen=pattern.length;
    for (i=0,j=0; i<cnlen && j<ptlen; i++) {
        unichar tChar=[text characterAtIndex:i];
        unichar pChar=[pattern characterAtIndex:j];
        if (tChar==pChar) {
            j++;
        }else{
            i=i-j;
            j=0;
        }
    }
    if (j==ptlen) {
        return i-ptlen;
    }else{
         return 0;
    }
}

@end

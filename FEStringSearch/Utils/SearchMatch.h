//
//  SearchMatch.h
//  FEStringSearch
//
//  Created by keso on 16/6/8.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchMatch : NSObject

+(BOOL)simpleMatchPattern:(NSString *)content pattern:(NSString *)pattern;
// 暴力回退
+(NSInteger)simpleBackMatchPattern:(NSString *)content pattern:(NSString *)pattern;

@end

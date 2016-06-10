//
//  BoyerMoore.h
//  FEStringSearch
//
//  Created by keso on 16/6/9.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoyerMoore : NSObject

-(instancetype)initWithPattern:(NSString *)pattern;

-(NSInteger)search:(NSString *)text;

@end

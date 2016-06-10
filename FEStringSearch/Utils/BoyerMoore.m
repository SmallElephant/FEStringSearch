//
//  BoyerMoore.m
//  FEStringSearch
//
//  Created by keso on 16/6/9.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "BoyerMoore.h"

static const NSInteger LetterCount=256;

@interface BoyerMoore()

@property (strong,nonatomic) NSString *pattern;

@property (strong,nonatomic) NSMutableArray *rightArr;

@end

@implementation BoyerMoore

-(instancetype)initWithPattern:(NSString *)pattern{
    self=[super init];
    if (self) {
        self.pattern=pattern;
        [self setup];
    }
    return self;
}

-(NSInteger)search:(NSString *)text{
    NSInteger tlen=text.length;
    NSInteger plen=self.pattern.length;
    NSInteger skip;
    for (NSInteger i=0; i<=tlen-plen; i+=skip) {
        skip=0;
        for (NSInteger j=plen-1;j>=0;j=j-1) {
            if ([self.pattern characterAtIndex:j]!=[text characterAtIndex:(i+j)]) {
                NSInteger index=[text characterAtIndex:(i+j)];
                skip=j-[self.rightArr[index] integerValue];
                break;
            }
        }
        if (skip==0) {
            return i;//匹配成功
        }
    }
    return -1;//匹配失败
}

-(void)setup{
    self.rightArr=[[NSMutableArray alloc]init];
    for (NSInteger i=0; i<LetterCount; i++) {
        [self.rightArr addObject:@(-1)];
    }
    
    for (NSInteger j=0; j<self.pattern.length; j++) {
        NSInteger index=[self.pattern characterAtIndex:j];
        self.rightArr[index]=@(j);
    }
}

@end

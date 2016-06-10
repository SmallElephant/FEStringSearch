//
//  RabinKarp.m
//  FEStringSearch
//
//  Created by keso on 16/6/9.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "RabinKarp.h"
static  const NSInteger Q=997;
static  const NSInteger LetterCount=10;
@interface RabinKarp()

@property (strong,nonatomic) NSString *pattern;

@property (assign,nonatomic) NSInteger pCount;
@property (assign,nonatomic) NSInteger RM;
@property (assign,nonatomic) NSInteger pathHash;

@end


@implementation RabinKarp

-(instancetype)initWithPattern:(NSString *)pattern{
    self=[super init];
    if (self) {
        self.pattern=pattern;
        self.pCount=self.pattern.length;
        [self setup];
    }
    return self;
}

-(NSInteger)search:(NSString *)text{
    NSInteger tlen=text.length;
    NSInteger txtHash=[self hash:text length:self.pCount];
    //开头匹配成功
    if (self.pathHash==txtHash) {
        return 0;
    }
    
    for (NSInteger j=self.pCount; j<tlen; j++) {
        //逐一匹配
        NSInteger chValue=[[text substringWithRange:NSMakeRange(j-self.pCount, 1)] integerValue];
        txtHash=(txtHash+Q-self.RM*chValue%Q)%Q;
        NSInteger num=[[text substringWithRange:NSMakeRange(j, 1)] integerValue];
        txtHash=(txtHash*LetterCount+num)%Q;
        if (self.pathHash==txtHash) {
            return j-self.pCount+1;
        }
    }
    return -1;
}

-(void)setup{
    self.RM=1;
    for (NSInteger i=1; i<=self.pCount-1; i++) {
        self.RM=(LetterCount*self.RM)%Q;
    }
    self.pathHash=[self hash:self.pattern length:self.pCount];
}

-(NSInteger)hash:(NSString *)key length:(NSInteger)len{
    NSInteger hash=0;
    for (NSInteger j=0; j<len; j++) {
        NSInteger chValue=[[key substringWithRange:NSMakeRange(j, 1)] integerValue];
        hash=(LetterCount*hash+chValue)%Q;
    }
    return hash;
}

-(NSInteger)hashStr:(NSString *)key length:(NSInteger)len{
    NSInteger hash=0;
    for (NSInteger j=0; j<len; j++) {
        NSInteger chValue=[key characterAtIndex:j];
        hash=(LetterCount*hash+chValue)%Q;
    }
    return hash;
}

@end

    //
//  KMPSearch.m
//  FEStringSearch
//
//  Created by keso on 16/6/9.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "KMPSearch.h"
static const NSInteger LetterCount=256;
@interface KMPSearch()

@property (strong,nonatomic) NSString *pattern;

@property (strong,nonatomic) NSMutableArray *dfa;

@end

@implementation KMPSearch

-(instancetype)initWithPattern:(NSString *)pattern{
    self=[super init];
    if (self) {
        self.pattern=pattern;
        [self setupData];
    }
    return self;
}

-(NSInteger)search:(NSString *)text{
    NSInteger i,j;
    NSInteger plen=self.pattern.length;
    NSInteger tlen=text.length;
    for (i=0,j=0; i<tlen & j<plen; i++) {
        unichar uc=[text characterAtIndex:i];
        NSArray *arr=self.dfa[uc];
        j=[arr[j] integerValue];
    }
    if (j==plen) {
        return i-plen;
    }else{
        return -1;
    }
}

-(void)setupData{
    NSInteger plen=self.pattern.length;

    self.dfa=[[NSMutableArray alloc]initWithCapacity:LetterCount];
    
    for (NSInteger i=0; i<LetterCount; i++) {
        NSMutableArray *arr=[[NSMutableArray alloc]init];
        for (NSInteger m=0; m<plen; m++) {
            [arr addObject:@(0)];
        }
        [self.dfa addObject:arr];
    }
    
    NSInteger index=[self.pattern characterAtIndex:0];
    self.dfa[index][0]=@(1);
    for (NSInteger X=0,j=1; j<plen;j++) {
        for (NSInteger c=0; c<LetterCount; c++) {
            self.dfa[c][j]=self.dfa[c][X];
        }
        NSInteger uc=[self.pattern characterAtIndex:j];
        self.dfa[uc][j]=@(j+1);
        X=[self.dfa[uc][X] integerValue];
    }
    
}

@end

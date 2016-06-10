//
//  main.m
//  FEStringSearch
//
//  Created by keso on 16/6/8.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchMatch.h"
#import "KMPSearch.h"
#import "BoyerMoore.h"
#import "RabinKarp.h"

int main(int argc, const char * argv[]) {
    NSLog(@"FlyElephant");
    //1.暴力查找
    NSString *text=@"She is a girl";
    NSString *pattern=@"girl";
    if ([SearchMatch simpleMatchPattern:text pattern:pattern]) {
        NSLog(@"%@ is contains %@",text,pattern);
    }else{
        NSLog(@"%@ is not contains %@",text,pattern);
    }
    //2.简单回退
    text=@"FlyElephant";
    pattern=@"Elem";
    NSInteger matchIndex=[SearchMatch simpleBackMatchPattern:text pattern:pattern];
    if (matchIndex>0) {
        NSLog(@"%@ contains %@ ,index %ld",text,pattern,matchIndex);
    }else{
        NSLog(@"%@ is not contains %@",text,pattern);
    }
    //3.KMP查找
    NSString *kmpText=@"BCBAABACAABABACAA";
    NSString *kmpPattern=@"ABABAC";
    kmpText=@"AAACCBBDEF";
    kmpPattern=@"A";
    KMPSearch *kmp=[[KMPSearch alloc]initWithPattern:kmpPattern];
    NSInteger result=[kmp search:kmpText];
    if (result>=0) {
        NSLog(@"%@ contains %@ ,Match Begin index:%ld",kmpText,kmpPattern,result);
    }else{
        NSLog(@"%@ not contains %@ ",kmpText,kmpPattern);
    }
    //4.BoyerMoore查找
    NSString *bmText=@"FlyElephant";
    NSString *bmPattern=@"Fly";
    BoyerMoore *bm=[[BoyerMoore alloc]initWithPattern:bmPattern];
    NSInteger bmResult=[bm search:bmText];
    if (bmResult>=0) {
        NSLog(@"%@ contains %@,Begin Index:%ld",bmText,bmPattern,bmResult);
    }else{
        NSLog(@"%@ not contains %@",bmText,bmPattern);
    }
    
    //5.RabinKarp 查找
    NSString *rmText=@"3141592653589793";
    NSString *rmPattern=@"26535";
    RabinKarp *rm=[[RabinKarp alloc]initWithPattern:rmPattern];
    NSInteger rmResult=[rm search:rmText];
    if (rmResult>=0) {
        NSLog(@"%@ contains %@,Begin Index:%ld",rmText,rmPattern,rmResult);
    }else{
        NSLog(@"%@ not contains %@",rmText,rmPattern);
    }
    
    
    
}

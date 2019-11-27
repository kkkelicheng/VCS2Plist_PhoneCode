//
//  main.m
//  CSV2Plist
//
//  Created by Emma Sun on 2019/11/27.
//  Copyright © 2019 Shushangyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "parseCSV.h"
#import "NSString+FGReverser.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //CSV 解析工具
        //https://github.com/JanX2/cCSVParse
       // https://michael.stapelberg.ch/ccsvparse/
    
        
        //简体转繁体
        //https://github.com/jwliang1226/FGReverser
        //https://github.com/zhishidapang/GBig
        
        
        
        CSVParser *parser = [CSVParser new];
        NSSet * inlands = [NSSet setWithObjects:@"MO",@"HK",@"TW",nil];
        NSString * path = [[NSBundle mainBundle]pathForResource:@"腾讯短信国家号utf8" ofType:@"csv"];
        [parser openFile:path];
        NSMutableArray *csvContent = [parser parseFile];
        int c;
        NSMutableArray<NSDictionary *> * container = [NSMutableArray array];
        for (c = 0; c < [csvContent count]; c++) {
            if (c == 0) {
                continue;
            }
            NSArray<NSString *> * columns = [csvContent objectAtIndex: c];
            NSLog(@"content of line : %@",@(c));
            NSMutableDictionary * info = [NSMutableDictionary dictionary];
            info[@"name_en"] = columns[0];
            info[@"name_zh_Hans"] = columns[1];
            info[@"name_zh_Hant"] = columns[1].fg_reversed;
            info[@"code"] = columns[2];
            if ([inlands containsObject:columns[2]]){
                continue;
            }
            info[@"number"] = columns[3];
            NSLog(@"--------");
            [container addObject:info];
        }
        [parser closeFile];
        NSString * fileNamePath = @"~/Desktop/test1111111.plist";
        [container writeToFile:fileNamePath atomically:true];
        
    }
    return 0;
}

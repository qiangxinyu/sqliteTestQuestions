//
//  SqliteManager.m
//  FMDB
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "SqliteManager.h"
#import <objc/runtime.h>
#import "TestQuestions.h"


@implementation SqliteManager

+ (SqliteManager *)shareSqliteManager
{
    static SqliteManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SqliteManager alloc] init];
    });
   return manager;
}

- (NSMutableArray *)getArray
{
    if ([self.db open]) {
         NSMutableArray * array = @[].mutableCopy;
         NSString * sql = @"select * from web_note where chapterid=34 or chapterid=7 and kemu=4 and licensetype like '%A2%B2%'";
        FMResultSet * rs = [self.db executeQuery:sql];
        
        
        while ([rs next]) {
            [array addObject:[TestQuestions getDicWithRs:rs]];
        }
        [self.db close];
        
        NSLog(@" == %@",array);

        return array;
        
    }
    return nil;
}


#pragma mark -------------------------------------------------------
#pragma mark Method



#pragma mark -------------------------------------------------------
#pragma mark Lazy Loading


- (FMDatabase *)db
{
    if (!_db) {
        _db = [FMDatabase databaseWithPath:[[NSBundle mainBundle] pathForResource:@"jxedt_user.db" ofType:nil]];
    }
    return _db;
}






@end

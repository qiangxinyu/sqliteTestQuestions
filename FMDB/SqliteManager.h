//
//  SqliteManager.h
//  FMDB
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface SqliteManager : NSObject
+ (SqliteManager *)shareSqliteManager;

@property (nonatomic,strong)FMDatabase * db;
- (NSMutableArray *)getArray;

@end

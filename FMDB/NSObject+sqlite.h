//
//  NSObject+sqlite.h
//  FMDB
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 apple. All rights reserved.
//
#import "YYKit.h"
#import <UIKit/UIKit.h>
#import "FMDB.h"

@interface NSObject (sqlite)
+ (id)getDicWithRs:(FMResultSet *)rs;
@end

//
//  NSObject+sqlite.m
//  FMDB
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSObject+sqlite.h"
#import <objc/runtime.h>

@implementation NSObject (sqlite)

+ (id)getDicWithRs:(FMResultSet *)rs
{
    NSMutableDictionary * dic = @{}.mutableCopy;
    
    id objc = [[self.class alloc] init];
    
    NSDictionary *properties = [objc properties];
    for (NSString *key in properties) {
        NSString *type = [properties objectForKey:key];
        NSString *className;
        
        NSMethodSignature *signature = [objc methodSignatureForSelector:NSSelectorFromString(key)];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setSelector:NSSelectorFromString(key)];
        [invocation setTarget:objc];
        
        switch ([type characterAtIndex:0]) {
            case '@': { // object
                if ([[type componentsSeparatedByString:@"\""] count] > 1) {
                    className = [[type componentsSeparatedByString:@"\""] objectAtIndex:1];
                    
                    if ([className isEqualToString:@"NSString"]) {
                        NSString * string = [rs stringForColumn:key];
                        [dic setValue:string forKey:key];
                        break;
                    }
                    
                }
                break;
            }
            case 'c': { // bool
                BOOL aBool = [rs boolForColumn:key];
                [dic setValue:@(aBool) forKey:key];
                break;
            }
                
            case 'f':  // float
            case 'd': { // double
                CGFloat aFloat = [rs doubleForColumn:key];
                [dic setValue:@(aFloat) forKey:key];
                break;
            }
            case 'i':   // int
            case 'L':   // unsigned long
            case 'Q':   // unsigned long long
            case 'l':   // long
            case 's':   // short
            case 'I': { // unsigned
                int aInt = [rs intForColumn:key];
                [dic setValue:@(aInt) forKey:key];
                break;
            }
        }
    }
    
    return dic;
    return [self.class modelWithDictionary:dic];
}


- (NSDictionary *)properties {
    return [self propertiesForClass:[self class]];
}

- (NSMutableDictionary *)propertiesForClass:(Class)klass {
    
    NSMutableDictionary *results = [[NSMutableDictionary alloc] init];
    
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList(klass, &outCount);
    for(i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        
        NSString *pname = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSString *pattrs = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
        
        pattrs = [[pattrs componentsSeparatedByString:@","] objectAtIndex:0];
        pattrs = [pattrs substringFromIndex:1];
        
        [results setObject:pattrs forKey:pname];
    }
    free(properties);
    
    if ([klass superclass] != [NSObject class]) {
        [results addEntriesFromDictionary:[self propertiesForClass:[klass superclass]]];
    }
    
    return results;
}
@end

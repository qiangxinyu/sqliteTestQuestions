//
//  TestQuestions.h
//  FMDB
//
//  Created by apple on 16/6/21.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "NSObject+sqlite.h"

@interface TestQuestions : NSObject

@property (nonatomic, assign)NSInteger ID;
@property (nonatomic, assign)NSInteger Type;

@property (nonatomic, copy)NSString * intNumber;
@property (nonatomic, copy)NSString * strTppe;
@property (nonatomic, copy)NSString * strType_l;
@property (nonatomic, copy)NSString * LicenseType;
@property (nonatomic, copy)NSString * Question;
@property (nonatomic, copy)NSString * An1;
@property (nonatomic, copy)NSString * An2;
@property (nonatomic, copy)NSString * An3;
@property (nonatomic, copy)NSString * An4;
@property (nonatomic, copy)NSString * An5;
@property (nonatomic, copy)NSString * An6;
@property (nonatomic, copy)NSString * An7;
@property (nonatomic, copy)NSString * AnswerTrue;
@property (nonatomic, copy)NSString * explain;

@property (nonatomic, assign)NSInteger BestAnswerId;
@property (nonatomic, assign)NSInteger kemu;

@property (nonatomic, copy)NSString * jieshi_from;
@property (nonatomic, copy)NSString * moretypes;

@property (nonatomic, assign)NSInteger chapterid;

@property (nonatomic, copy)NSString * sinaimg;
@property (nonatomic, copy)NSString * video_url;

@property (nonatomic, assign)NSInteger diff_degree;




@end

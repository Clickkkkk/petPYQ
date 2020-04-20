//
//  PyqGroupModel.m
//  Pyq好难弄啊（改
//
//  Created by 周彦辰 on 11/22/19.
//  Copyright © 2019 周彦辰. All rights reserved.
//

#import "PyqGroupModel.h"

@implementation PyqGroupModel

- (instancetype) initWithDict :(NSDictionary *)dict{
    self = [super init];
    if (self){
//        self.name = dict [@"name"];
//        self.words = dict[@"words"];
//        self.icon = dict[@"icon"];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype) pyqGroupModelWithDict :(NSDictionary *)dict{
    return [[PyqGroupModel alloc]initWithDict :dict];
}

@end


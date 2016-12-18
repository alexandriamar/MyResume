//
//  Reference.m
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "Reference.h"

@interface Reference()

@property (readwrite) NSString *name;
@property (readwrite) NSString *num;

@end

@implementation Reference

- (instancetype) initWithName:(NSString *)name
                       number:(NSString *)num {
    self.name = name;
    self.num = num;
    return self;
}

@end

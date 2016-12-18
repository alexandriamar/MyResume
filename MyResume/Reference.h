//
//  Reference.h
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reference : NSObject

@property (readonly) NSString *name;
@property (readonly) NSString *num;

- (instancetype) initWithName: (NSString *) name
                       number: (NSString *) num;

@end

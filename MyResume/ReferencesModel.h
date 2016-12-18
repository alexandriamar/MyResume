//
//  ReferencesModel.h
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Reference.h"

@interface ReferencesModel : NSObject

@property (readonly) NSUInteger currentIndex;

// Creating the model
+ (instancetype) sharedModel;

// Accessing number of references in model
- (NSUInteger) numberOfReferences;

// Accessing a reference – sets currentIndex appropriately
- (Reference *) referenceAtIndex: (NSUInteger) index;
- (Reference *) nextReference;
- (Reference *) prevReference;

// Inserting a reference
- (void) insertWithName: (NSString *) name
                 number: (NSString *) num;

- (void) insertWithName: (NSString *) name
                 number: (NSString *) num
                atIndex: (NSUInteger) index;

// Removing a reference
- (void) removeReference;
- (void) removeReferenceAtIndex: (NSUInteger) index;

@end

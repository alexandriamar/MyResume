//
//  ReferencesModel.m
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "ReferencesModel.h"

NSString *const referencesArrayKey = @"ReferencesArray";
static NSString* const referencesPList = @"Resume.plist";

@interface ReferencesModel()

@property (nonatomic, strong) NSMutableArray *references;
@property (readwrite) NSUInteger currentIndex;
@property (strong, nonatomic) NSString *filepath;

@end

@implementation ReferencesModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* documentsDirectory = [paths objectAtIndex:0];
        _filepath = [documentsDirectory stringByAppendingPathComponent:referencesPList];
        _references = [NSMutableArray arrayWithContentsOfFile:_filepath];
        
        Reference *reference1 = [[Reference alloc] initWithName:@"Ali Mar" number:@"310-766-5552"];
        Reference *reference2 = [[Reference alloc] initWithName:@"Audrey Wilcox" number:@"949-345-8291"];
        Reference *reference3 = [[Reference alloc] initWithName:@"Megan Wood" number:@"949-482-5801"];
        Reference *reference4 = [[Reference alloc] initWithName:@"Courtney Wood" number:@"949-391-3991"];
        Reference *reference5 = [[Reference alloc] initWithName:@"Atorina Samuel" number:@"481-582-4521"];
        _references = [[NSMutableArray alloc] initWithObjects: reference1, reference2, reference3, reference4, reference5, nil];
        
        
    }
    self.currentIndex = 0;
    return self;
}
+ (instancetype) sharedModel {
    static ReferencesModel *_sharedModel = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[self alloc] init];
    });
    
    return _sharedModel;
}

- (NSUInteger) numberOfReferences {
    return self.references.count;
}

- (Reference *) referenceAtIndex: (NSUInteger) index {
    return [self.references objectAtIndex:index];
}
- (Reference *) nextReference {
    if ((int)self.currentIndex < [self numberOfReferences] - 1)
    {
        self.currentIndex += 1;
    }
    else self.currentIndex = 0;
    return [self.references objectAtIndex:(self.currentIndex)];
}
- (Reference *) prevReference {
    if (self.currentIndex > 0){
        self.currentIndex = (self.currentIndex - 1);
    }
    else self.currentIndex = [self numberOfReferences] - 1;
    
    return [self.references objectAtIndex:(self.currentIndex)];
}

- (void) insertWithName: (NSString *) name
                 number: (NSString *) num {
    Reference *newReference = [[Reference alloc] initWithName:name number:num];
    [self.references addObject:newReference];
    [self save];
}

- (void) insertWithName: (NSString *) name
                 number: (NSString *) num
                atIndex: (NSUInteger) index {
    NSUInteger numReferences = [self numberOfReferences];
    if (index <= numReferences) {
        Reference *newReference = [[Reference alloc] initWithName:name number:num];
        [self.references insertObject:newReference atIndex:index];
    }
    [self save];
}

- (void) removeReference {
    [self.references removeLastObject];
    [self save];
}

- (void) removeReferenceAtIndex: (NSUInteger) index {
    if (index < self.references.count) {
        [self.references removeObjectAtIndex:index];
    }
    [self save];
}

-(void) save {
    [self.references writeToFile:self.filepath atomically:YES];
}

@end

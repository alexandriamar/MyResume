//
//  AddCardViewController.h
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^CompletionHandler)(NSString *name, NSString *number);
typedef void(^OnCancel)();

@interface AddCardViewController : UIViewController

@property (copy, nonatomic) CompletionHandler completionHandler;
@property (copy, nonatomic) OnCancel onCancelHandler;

@end

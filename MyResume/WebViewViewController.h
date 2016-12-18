//
//  WebViewViewController.h
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnCancel)();

@interface WebViewViewController : UIViewController

@property(strong, nonatomic) NSString *urlString;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (copy, nonatomic) OnCancel onCancelHandler;

@end

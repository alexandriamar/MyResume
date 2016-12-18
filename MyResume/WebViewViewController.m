//
//  WebViewViewController.m
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "WebViewViewController.h"

@interface WebViewViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self.urlString isEqualToString:@"facebook"]) {
        NSURL *url = [NSURL URLWithString:@"https://www.facebook.com/ali.mar.5496"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    else if ([self.urlString isEqualToString:@"instagram"]) {
        NSURL *url = [NSURL URLWithString:@"https://www.instagram.com/aliimar/"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
    else if ([self.urlString isEqualToString:@"linkedin"]) {
        NSURL *url = [NSURL URLWithString:@"https://www.linkedin.com/in/alexandriamar"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
    }
}

- (IBAction)onCancelDidTapped {
    if (self.onCancelHandler){
        self.onCancelHandler();
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

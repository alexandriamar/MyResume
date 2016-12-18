//
//  SocialMediaViewController.m
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "SocialMediaViewController.h"
#import "WebViewViewController.h"

@interface SocialMediaViewController ()

@end

@implementation SocialMediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewViewController *wvvc = (WebViewViewController *)segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"FacebookSegue"]) {
        wvvc.urlString = @"facebook";
    }
    else if ([segue.identifier isEqualToString:@"InstagramSegue"]) {
        wvvc.urlString = @"instagram";
    }
    else if ([segue.identifier isEqualToString:@"LinkedInSegue"]) {
        wvvc.urlString = @"linkedin";
    }
    wvvc.onCancelHandler = ^{
        [self dismissViewControllerAnimated:YES completion:nil];
    };
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

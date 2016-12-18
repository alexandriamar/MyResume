//
//  AddCardViewController.m
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "AddCardViewController.h"
#import "ReferencesModel.h"
#import "ReferencesTableViewController.h"
#import "Reference.h"

@interface AddCardViewController () <UITextFieldDelegate>

//@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;
@property (weak, nonatomic) ReferencesModel *model;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.saveButton.enabled = NO;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.nameTextField becomeFirstResponder];
}

- (IBAction)saveDidTapped {
    if (self.completionHandler){
        self.completionHandler(self.nameTextField.text, self.numberTextField.text);
    }
}

- (IBAction)onCancelDidTapped {
    if (self.onCancelHandler){
        self.onCancelHandler();
    }
}


- (BOOL)textFieldShouldReturn:(UITextField *) textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField == _numberTextField) {
        NSString *latestNumberStr = [textField.text stringByReplacingCharactersInRange:range withString:string];

        [self updateSaveButtonStatusWithNumber:latestNumberStr andName:self.nameTextField.text];
//        NSLog(@"This is the latest number string: %@, and this is the latest name string: %@", latestNumberStr, self.nameTextField.text);
    }
    else if (textField == _nameTextField) {
        NSString *latestNameStr = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        NSLog(@"This is the latest name string: %@, and this is the latest name string: %@", latestNameStr, self.numberTextField.text);
        [self updateSaveButtonStatusWithNumber:self.numberTextField.text andName:latestNameStr];
//        NSLog(@"This is the latest name string: %@, and this is the latest name string: %@", latestNameStr, self.numberTextField.text);
    }
    return YES;
    
}

- (void)updateSaveButtonStatusWithNumber:(NSString *)number andName:(NSString *)name{
    self.saveButton.enabled = (name.length > 0 && number.length > 0);
}

- (void) touchesBegan: (NSSet *) touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.numberTextField isFirstResponder] && [touch view] != self.numberTextField) {
        [self.numberTextField resignFirstResponder];
    }
    if ([self.nameTextField isFirstResponder] && [touch view] != self.nameTextField) {
        [self.nameTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
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

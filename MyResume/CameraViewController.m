//
//  CameraViewController.m
//  MyResume
//
//  Created by Alexandria Mar on 12/11/16.
//  Copyright © 2016 Alexandria Mar. All rights reserved.
//

#import "CameraViewController.h"
#import <Photos/Photos.h>

@interface CameraViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation CameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
//    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    
    self.imageView.image = originalImage;
    UIImageWriteToSavedPhotosAlbum(originalImage, nil, nil, nil);
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePhoto:(id)sender {
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.allowsEditing = YES;
//        UIImage *snapshot = self.imageView.image;
//        [[PHPhotoLibrary sharedPhotoLibrary] performChanges: ^{
//            PHAssetChangeRequest *changeRequest = [PHAssetChangeRequest creationRequestForAssetFromImage:snapshot];
//            changeRequest.creationDate = [NSDate date];
//        }
//                                        completionHandler:^(BOOL success, NSError *error) {
//                                              if (success)
//                                              {
//                                                  NSLog(@"successfully saved");
//                                              }
//                                              else 
//                                              {
//                                                  NSLog(@"error saving to photos: %@", error);
//                                              }
//                                          }];
        
    }
    else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message: @"Camera not available" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Okay" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            NSLog(@"Okay action");
        }];
        [alertController addAction:okAction];
        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    
    [self presentViewController:ipc animated:YES completion:nil];
}

- (IBAction)choosePhoto:(id)sender {
    
    // 1. Create and present UIImagePickerController modally
    
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.delegate = self;
    
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //    ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:ipc animated:YES completion:nil];
}



//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
